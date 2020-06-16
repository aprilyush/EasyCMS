using Atlass.Framework.Common.Extends;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;

namespace Atlass.Framework.Common
{
    public class ImageWatermarker
    {
        /// <summary>
        /// 是否跳过小缩略图
        /// </summary>
        public bool SkipWatermarkForSmallImages { get; set; }

        /// <summary>
        /// 小图像素大小
        /// </summary>
        public int SmallImagePixelsThreshold { get; set; }

        private readonly Stream _stream;

        public ImageWatermarker(Stream originStream)
        {
            _stream = originStream;
        }
        public ImageWatermarker()
        {
        }
        /// <summary>
        /// 添加水印
        /// </summary>
        /// <param name="watermarkText">水印文字</param>
        /// <param name="color">水印颜色</param>
        /// <param name="watermarkPosition">水印位置</param>
        /// <param name="textPadding">边距</param>
        /// <param name="fontSize">字体大小</param>
        /// <param name="font">字体</param>
        /// <param name="textAntiAlias">不提示的情况下使用抗锯齿标志符号位图来绘制每个字符。
        ///    由于抗锯齿质量就越好。
        ///    因为关闭了提示，词干宽度之间的差异可能非常明显。</param>
        /// <returns></returns>
        public MemoryStream AddWatermark(string watermarkText, Color color, WatermarkPosition watermarkPosition = WatermarkPosition.BottomRight, int textPadding = 10, int fontSize = 20, Font font = null, bool textAntiAlias = true)
        {
            using var img = Image.FromStream(_stream);
            if (SkipWatermarkForSmallImages && img.Height * img.Width < SmallImagePixelsThreshold)
            {
                return _stream.SaveAsMemoryStream();
            }

            using var graphic = Graphics.FromImage(img);
            if (textAntiAlias)
            {
                graphic.TextRenderingHint = TextRenderingHint.AntiAlias;
            }

            using var brush = new SolidBrush(color);
            if (img.Width / fontSize > 50)
            {
                fontSize = img.Width / 50;
            }

            using var f = font ?? new Font(FontFamily.GenericSansSerif, fontSize, FontStyle.Bold, GraphicsUnit.Pixel);
            var textSize = graphic.MeasureString(watermarkText, f);
            int x, y;
            textPadding += (img.Width - 1000) / 100;
            switch (watermarkPosition)
            {
                case WatermarkPosition.TopLeft:
                    x = textPadding;
                    y = textPadding;
                    break;
                case WatermarkPosition.TopRight:
                    x = img.Width - (int)textSize.Width - textPadding;
                    y = textPadding;
                    break;
                case WatermarkPosition.BottomLeft:
                    x = textPadding;
                    y = img.Height - (int)textSize.Height - textPadding;
                    break;
                case WatermarkPosition.BottomRight:
                    x = img.Width - (int)textSize.Width - textPadding;
                    y = img.Height - (int)textSize.Height - textPadding;
                    break;
                default:
                    x = textPadding;
                    y = textPadding;
                    break;
            }

            graphic.DrawString(watermarkText, f, brush, new Point(x, y));
            var ms = new MemoryStream();
            img.Save(ms, img.RawFormat);
            ms.Position = 0;
            return ms;
        }


        /// <summary>
        /// 加图片水印
        /// </summary>
        /// <param name="filename">文件名</param>
        /// <param name="watermarkFilename">水印文件名</param>
        /// <param name="watermarkPosition">图片水印位置 0=不使用 1=左上 2=中上 3=右上 4=左中 ... 9=右下</param>
        /// <param name="quality">附加图片质量，1是 0不是</param>
        /// <param name="watermarkTransparency">水印的透明度 1--10 10为不透明</param>
        public void AddImageSignPic(Image img, string filename, string watermarkFilename, int watermarkPosition, int quality, int watermarkTransparency)
        {
            Graphics g = Graphics.FromImage(img);
            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            Image watermark = new Bitmap(watermarkFilename);

            if (watermark.Height >= img.Height || watermark.Width >= img.Width)
            {
                return;
            }

            ImageAttributes imageAttributes = new ImageAttributes();
            ColorMap colorMap = new ColorMap();

            colorMap.OldColor = Color.FromArgb(255, 0, 255, 0);
            colorMap.NewColor = Color.FromArgb(0, 0, 0, 0);
            ColorMap[] remapTable = { colorMap };

            imageAttributes.SetRemapTable(remapTable, ColorAdjustType.Bitmap);

            float transparency = 0.5F;
            if (watermarkTransparency >= 1 && watermarkTransparency <= 10)
            {
                transparency = (watermarkTransparency / 10.0F);
            }

            float[][] colorMatrixElements = {
                                                new float[] {1.0f, 0.0f, 0.0f, 0.0f, 0.0f},
                                                new float[] {0.0f, 1.0f, 0.0f, 0.0f, 0.0f},
                                                new float[] {0.0f, 0.0f, 1.0f, 0.0f, 0.0f},
                                                new float[] {0.0f, 0.0f, 0.0f, transparency, 0.0f},
                                                new float[] {0.0f, 0.0f, 0.0f, 0.0f, 1.0f}
                                            };

            ColorMatrix colorMatrix = new ColorMatrix(colorMatrixElements);

            imageAttributes.SetColorMatrix(colorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);

            int xpos = 0;
            int ypos = 0;

            switch (watermarkPosition)
            {
                case 1:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 2:
                    xpos = (int)((img.Width * (float).50) - (watermark.Width / 2));
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 3:
                    xpos = (int)((img.Width * (float).99) - (watermark.Width));
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 4:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)((img.Height * (float).50) - (watermark.Height / 2));
                    break;
                case 5:
                    xpos = (int)((img.Width * (float).50) - (watermark.Width / 2));
                    ypos = (int)((img.Height * (float).50) - (watermark.Height / 2));
                    break;
                case 6:
                    xpos = (int)((img.Width * (float).99) - (watermark.Width));
                    ypos = (int)((img.Height * (float).50) - (watermark.Height / 2));
                    break;
                case 7:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)((img.Height * (float).99) - watermark.Height);
                    break;
                case 8:
                    xpos = (int)((img.Width * (float).50) - (watermark.Width / 2));
                    ypos = (int)((img.Height * (float).99) - watermark.Height);
                    break;
                case 9:
                    xpos = (int)((img.Width * (float).99) - (watermark.Width));
                    ypos = (int)((img.Height * (float).99) - watermark.Height);
                    break;
            }

            g.DrawImage(watermark, new Rectangle(xpos, ypos, watermark.Width, watermark.Height), 0, 0, watermark.Width, watermark.Height, GraphicsUnit.Pixel, imageAttributes);
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
            ImageCodecInfo ici = null;
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.MimeType.IndexOf("jpeg") > -1)
                {
                    ici = codec;
                }
            }
            EncoderParameters encoderParams = new EncoderParameters();
            long[] qualityParam = new long[1];
            if (quality < 0 || quality > 100)
            {
                quality = 80;
            }
            qualityParam[0] = quality;

            EncoderParameter encoderParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, qualityParam);
            encoderParams.Param[0] = encoderParam;

            if (ici != null)
            {
                img.Save(filename, ici, encoderParams);
            }
            else
            {
                img.Save(filename);
            }

            g.Dispose();
            img.Dispose();
            watermark.Dispose();
            imageAttributes.Dispose();
        }


        /// <summary>
        /// 添加文字水印
        /// </summary>
        /// <param name="picture">要加水印的原图像</param>
        /// <param name="text">水印文字</param>
        /// <param name="markposition">添加的位置</param>
        /// <param name="width">原图像的宽度</param>
        /// <param name="height">原图像的高度</param>
        public void AddWatermarkText(Image img,string savePath, string watermarkText, int markposition,int fontSize=50,string fontColor= "#030d14")
        {
            Graphics picture = Graphics.FromImage(img);
            //设置高质量插值法
            picture.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            //设置高质量,低速度呈现平滑程度
            picture.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
           

            Font crFont = new Font("Arial", fontSize, FontStyle.Bold, GraphicsUnit.Pixel);
            SizeF crSize = picture.MeasureString(watermarkText, crFont);


            float xpos = 0;
            float ypos = 0;

            switch (markposition)
            {
                case 1:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 2:
                    xpos = (int)((img.Width * (float).50) - (crSize.Width / 2));
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 3:
                    xpos = (int)((img.Width * (float).99) - (crSize.Width));
                    ypos = (int)(img.Height * (float).01);
                    break;
                case 4:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)((img.Height * (float).50) - (crSize.Height / 2));
                    break;
                case 5:
                    xpos = (int)((img.Width * (float).50) - (crSize.Width / 2));
                    ypos = (int)((img.Height * (float).50) - (crSize.Height / 2));
                    break;
                case 6:
                    xpos = (int)((img.Width * (float).99) - (crSize.Width));
                    ypos = (int)((img.Height * (float).50) - (crSize.Height / 2));
                    break;
                case 7:
                    xpos = (int)(img.Width * (float).01);
                    ypos = (int)((img.Height * (float).99) - crSize.Height);
                    break;
                case 8:
                    xpos = (int)((img.Width * (float).50) - (crSize.Width / 2));
                    ypos = (int)((img.Height * (float).99) - crSize.Height);
                    break;
                case 9:
                    xpos = (int)((img.Width * (float).99) - (crSize.Width));
                    ypos = (int)((img.Height * (float).99) - crSize.Height);
                    break;
            }

            StringFormat StrFormat = new StringFormat();
            StrFormat.Alignment = StringAlignment.Center;

            Color color = ColorTranslator.FromHtml(fontColor);
            //Color.FromArgb(153, 0, 0, 0)
            SolidBrush semiTransBrush2 = new SolidBrush(color);
            picture.DrawString(watermarkText, crFont, semiTransBrush2, xpos + 1, ypos + 1, StrFormat);
            //Color.FromArgb(153, 255, 255, 255)
            //SolidBrush semiTransBrush = new SolidBrush(color);
            //picture.DrawString(watermarkText, crFont, semiTransBrush, xpos, ypos, StrFormat);

            semiTransBrush2.Dispose();
            //semiTransBrush.Dispose();


            img.Save(savePath);
            img.Dispose();
            picture.Dispose();
            
        }
    }
}