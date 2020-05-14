/* ***********************************************
 * Author		:  kingthy
 * Email		:  kingthy@gmail.com
 * Description	:  ITemplateRender,TemplateRenderMethodAttribute
 *
 * ***********************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace VTemplate.Engine
{
    /// <summary>
    /// 模板块数据的解析处理接口
    /// </summary>
    public interface ITemplateRender
    {
        /// <summary>
        /// 预处理解析模板数据
        /// </summary>
        /// <param name="template"></param>
        void PreRender(Template template);
    }

    /// <summary>
    /// 预处理模板数据的方法属性
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple=false, Inherited=false)]
    public class TemplateRenderMethodAttribute : System.Attribute
    {
        /// <summary>
        /// 
        /// </summary>
        public TemplateRenderMethodAttribute() { }
        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }
    }
}
