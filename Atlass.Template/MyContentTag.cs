using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VTemplate.Engine;

namespace Atlass.TemplateExt
{
    public class MyContentTag:ForEachTag
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ownerTemplate"></param>
        public MyContentTag(Template ownerTemplate)
            : base(ownerTemplate)
        { }

       
        /// <summary>
        /// 返回标签的名称
        /// </summary>
        public override string TagName
        {
            get { return "mycontent"; }
        }

        /// <summary>
        /// 返回此标签是否是单一标签.即是不需要配对的结束标签
        /// </summary>
        public override bool IsSingleTag
        {
            get { return false; }
        }

        /// <summary>
        /// 栏目索引
        /// </summary>
        /// <remarks></remarks>
        public Attribute ChannelIndex
        {
            get
            {
                return this.Attributes["channelIndex"];
            }
        }

        /// <summary>
        /// 从第几条信息开始显示，默认从1开始
        /// </summary>
        public Attribute StartNum
        {
            get
            {
                return this.Attributes["startNum"];
            }
        }
        /// <summary>
        /// 显示信息总数 默认20条
        /// </summary>
        public Attribute TotalNum
        {
            get
            {
                return this.Attributes["totalNum"];
            }
        }
    }
}
