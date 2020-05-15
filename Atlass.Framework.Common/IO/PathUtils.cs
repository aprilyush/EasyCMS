
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Atlass.Framework.Common
{
    public static class PathUtils
    {
        public static readonly char SeparatorChar = Path.DirectorySeparatorChar;
        public static readonly char[] InvalidPathChars = Path.GetInvalidPathChars();
        public const string UnClickableUrl = "javascript:;";
        public static string Combine(params string[] paths)
        {
            var retVal = string.Empty;
            if (paths != null && paths.Length > 0)
            {
                retVal = paths[0]?.Replace('/',SeparatorChar).TrimEnd(SeparatorChar) ?? string.Empty;
                for (var i = 1; i < paths.Length; i++)
                {
                    var path = paths[i] != null ? paths[i].Replace('/', SeparatorChar).Trim(SeparatorChar) : string.Empty;
                    retVal = Path.Combine(retVal, path);
                }
            }
            return retVal;
        }

        /// <summary>
        /// 根据路径扩展名判断是否为文件夹路径
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public static bool IsDirectoryPath(string path)
        {
            var retVal = false;
            if (!string.IsNullOrEmpty(path))
            {
                var ext = Path.GetExtension(path);
                if (string.IsNullOrEmpty(ext))		//path为文件路径
                {
                    retVal = true;
                }
            }
            return retVal;
        }

        public static bool IsExtension(string ext, params string[] extensions)
        {
            return extensions.Any(extension => StringUtils.EqualsIgnoreCase(ext, extension));
        }

        public static bool IsFilePath(string val)
        {
            try
            {
                return FileUtils.IsFileExists(val);
            }
            catch
            {
                return false;
            }
        }

        public static string RemoveQueryString(string url)
        {
            if (url == null) return null;

            if (url.IndexOf("?", StringComparison.Ordinal) == -1 || url.EndsWith("?"))
            {
                return url;
            }

            return url.Substring(0, url.IndexOf("?", StringComparison.Ordinal));
        }

        public static string GetExtension(string path)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(path))
            {
                path = RemoveQueryString(path);
                path = path.Trim('/', SeparatorChar).Trim();
                try
                {
                    retVal = Path.GetExtension(path);
                }
                catch
                {
                    // ignored
                }
            }
            return retVal;
        }

        public static string RemoveExtension(string fileName)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(fileName))
            {
                var index = fileName.LastIndexOf('.');
                retVal = index != -1 ? fileName.Substring(0, index) : fileName;
            }
            return retVal;
        }

        public static string RemoveParentPath(string path)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(path))
            {
                retVal = path.Replace("../", string.Empty);
                retVal = retVal.Replace("./", string.Empty);
            }
            return retVal;
        }

        public static string GetFileName(string filePath)
        {
            return Path.GetFileName(filePath);
        }

        private static char[] GetInvalidChars()
        {
            return Path.GetInvalidFileNameChars().Concat(Path.GetInvalidPathChars()).Concat(new[] { ' ', ';' }).ToArray();
        }

        public static string GetSafeFilename(string filename)
        {
            if (string.IsNullOrEmpty(filename)) return StringUtils.GetShortGuid().ToLower();

            return string.Join("_", filename.Split(GetInvalidChars()));
        }

        public static string GetFileNameWithoutExtension(string filePath)
        {
            return Path.GetFileNameWithoutExtension(filePath);
        }

        public static string GetDirectoryName(string path, bool isFile)
        {
            if (string.IsNullOrWhiteSpace(path)) return string.Empty;

            if (isFile)
            {
                path = Path.GetDirectoryName(path);
            }
            if (!string.IsNullOrEmpty(path))
            {
                var directoryInfo = new DirectoryInfo(path);
                return directoryInfo.Name;
            }
            return string.Empty;
        }

        public static string GetPathDifference(string rootPath, string path)
        {
            if (!string.IsNullOrEmpty(path) && StringUtils.StartsWithIgnoreCase(path, rootPath))
            {
                var retVal = path.Substring(rootPath.Length, path.Length - rootPath.Length);
                return retVal.Trim('/', '\\');
            }
            return string.Empty;
        }

        public static string RemovePathInvalidChar(string filePath)
        {
            if (string.IsNullOrEmpty(filePath))
                return filePath;
            var invalidChars = new string(Path.GetInvalidPathChars());
            string invalidReStr = $"[{Regex.Escape(invalidChars)}]";
            return Regex.Replace(filePath, invalidReStr, "");
        }

        public static bool IsFileExtensionAllowed(string sAllowedExt, string sExt)
        {
            if (sExt != null && sExt.StartsWith("."))
            {
                sExt = sExt.Substring(1, sExt.Length - 1);
            }
            sAllowedExt = sAllowedExt.Replace("|", ",");
            var aExt = sAllowedExt.Split(',');
            return aExt.Any(t => StringUtils.EqualsIgnoreCase(sExt, t));
        }

       

        public static string GetLibraryFileName(string filePath)
        {
            return $"{StringUtils.GetShortGuid(false)}{GetExtension(filePath)}";
        }

       
    }
}
