using Atlass.Framework.Common;
using Atlass.Framework.Common.Log;
using Atlass.Framework.Core;
using Atlass.Framework.Generate.Dto;
using Atlass.Framework.Models.Admin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VTemplate.Engine;

namespace Atlass.Framework.Generate
{
    /// <summary>
    /// 代码生成
    /// </summary>
    public class GenerateCodeTemplate
    {
        private readonly string EntityFile = "CodeTemplate/T_实体类.html";//实体类
        private readonly string ServiceFile = "CodeTemplate/T_服务类.html";//AppService
        private readonly string ControllerFile = "CodeTemplate/T_控制器.html";//控制器
        private readonly string ListFile = "CodeTemplate/T_列表页.html";//列表页
        private readonly string FormFile = "CodeTemplate/T_表单页.html";//表单页
        private code_table table;
        private List<code_column> columns;
        public GenerateCodeTemplate(code_table codeTable)
        {
            this.table = codeTable;
            this.columns = codeTable.columns;
        }
        /// <summary>
        /// 生成实体类 10001
        /// </summary>
        /// <returns></returns>
        public GenerateResultDto GenEntity()
        {
            GenerateResultDto ret = new GenerateResultDto();
            try {
                string filePath = Path.Combine(GlobalContext.WebRootPath, EntityFile);
                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                TemplateDocument Document = this.LoadDocument(10001, filePath);
                string renderHtml =Document.GetRenderText();
                ret.Status = true;
                ret.Html = renderHtml;
            }
            catch(Exception ex)
            {
                LoggerHelper.Exception(ex);
            }
           
            return ret;
        }

        /// <summary>
        /// 生成AppService类 10002
        /// </summary>
        /// <returns></returns>
        public GenerateResultDto GenAppService()
        {
            GenerateResultDto ret = new GenerateResultDto();
            try
            {
                string filePath = Path.Combine(GlobalContext.WebRootPath, ServiceFile);
                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                TemplateDocument Document = this.LoadDocument(10002, filePath);
                string renderHtml = Document.GetRenderText();
                ret.Status = true;
                ret.Html = renderHtml;
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

            return ret;
        }


        /// <summary>
        /// 生成Controller类 10003
        /// </summary>
        /// <returns></returns>
        public GenerateResultDto GenController()
        {
            GenerateResultDto ret = new GenerateResultDto();
            try
            {
                string filePath = Path.Combine(GlobalContext.WebRootPath, ControllerFile);
                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                TemplateDocument Document = this.LoadDocument(10003, filePath);
                string renderHtml = Document.GetRenderText();
                ret.Status = true;
                ret.Html = renderHtml;
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

            return ret;
        }


        /// <summary>
        /// 生成List页面 10004
        /// </summary>
        /// <returns></returns>
        public GenerateResultDto GenList()
        {
            GenerateResultDto ret = new GenerateResultDto();
            try
            {
                string filePath = Path.Combine(GlobalContext.WebRootPath, ListFile);
                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                TemplateDocument Document = this.LoadDocument(10004,filePath);

                string renderHtml = Document.GetRenderText();
                ret.Status = true;
                ret.Html = renderHtml;
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

            return ret;
        }


        /// <summary>
        /// 生成Form页面 10005
        /// </summary>
        /// <returns></returns>
        public GenerateResultDto GenForm()
        {
            GenerateResultDto ret = new GenerateResultDto();
            try
            {
                string filePath = Path.Combine(GlobalContext.WebRootPath, FormFile);
                //加载模板 先取缓存，没有再初始化一个并且加入缓存
                TemplateDocument Document =this.LoadDocument(10005,filePath);
                string renderHtml = Document.GetRenderText();
                ret.Status = true;
                ret.Html = renderHtml;
            }
            catch (Exception ex)
            {
                LoggerHelper.Exception(ex);
            }

            return ret;
        }


        private TemplateDocument LoadDocument(int documentId,string filePath)
        {
            TemplateDocument Document = RenderDocumentCache.GetRenderDocument(documentId);
            if (Document == null)
            {
                string newContent = FileUtils.ReadText(filePath);
                Document = new TemplateDocument(newContent, GlobalContext.WebRootPath, filePath);
               // RenderDocumentCache.AddRenderDocument(10005, Document);
            }
            string upperTableName = GetUpperCanelName(table.entity_name);
            string lowTableName = upperTableName.Substring(0, 1).ToLower()+ upperTableName.Substring(1);
            string roletag = table.entity_name.Replace("-","");
            //加入基本信息
            Document.Variables.SetValue("this", this);
            Document.Variables.SetValue("table", table);
            Document.Variables.SetValue("columns", columns);
            Document.Variables.SetValue("gentime", DateTime.Now);
            Document.Variables.SetValue("upperTableName", upperTableName);
            Document.Variables.SetValue("lowTableName", lowTableName);
            Document.Variables.SetValue("roletag", roletag);
            Document.RegisterGlobalFunction(this.GetColumnAttr);
            Document.RegisterGlobalFunction(this.GetCsType);

            return Document;
        }


        /// <summary>
        /// 获取大写驼峰名称
        /// </summary>
        /// <param name="tableNameParam"></param>
        /// <returns></returns>
        public string GetUpperCanelName(string tableName)
        {

            if (!tableName.Contains("_"))
            {
                string prefix = tableName.Substring(0, 1);
                return prefix + tableName.Substring(1);
            }
            string val = "";
            string[] names = tableName.Split('_');
            foreach(string name in names)
            {
                string prefix = name.Substring(0, 1);
                val += prefix.ToUpper() + name.Substring(1);
            }
            return val;
        }

        /// <summary>
        /// 获取c#类型
        /// </summary>
        /// <param name="cstype"></param>
        /// <returns></returns>
        public object GetCsType(object[] cstype)
        {
            if (cstype.Length<= 0)
            {
                return "string";
            }

                string typeVal = "string";
            switch (cstype[0].ToString())
            {
                case "Int32":
                    typeVal = "int";
                    break;
                case "String":
                    typeVal = "string";
                    break;
                case "DateTime":
                    typeVal = "DateTime";
                    break;
                case "SByte":
                    typeVal = "int";
                    break;
                case "Int64":
                    typeVal = "long";
                    break;
                case "Decimal":
                    typeVal = "decimal";
                    break;
            }

            return typeVal;

        }
        /// <summary>
        /// 获取属性和默认值
        /// </summary>
        /// <param name="colums"></param>
        /// <returns></returns>
        public object GetColumnAttr(object[] columnParams)
        {
            if (columnParams.Length > 0 && columnParams[0] is code_column)
            {
                var columnModel = (code_column)columnParams[0];
               // string json = columnModel.ToJson();
               // LoggerHelper.Debug(json,$"长度：{colums.l}");
                string attr = $"Column(DbType =\"{columnModel.type_text_full}\"";
                if (columnModel.is_primary == 1)
                {
                    attr += ",IsPrimary =true";
                }
                if (columnModel.is_identity == 1)
                {
                    attr += ",IsIdentity =true";
                }
                if (columnModel.column_name == "create_by" || columnModel.column_name == "create_time")
                {
                    attr += ",CanUpdate = false";
                }
                attr += ")";

                var dval = GetDefaultVal(columnModel.type_text);
                return new { attr = attr, defaultVal = dval };
               
            }
            else
            {
                return new { attr="",defaultVal=""};
            }
        }


        /// <summary>
        /// 获取类型默认值
        /// </summary>
        /// <param name="typeText"></param>
        /// <returns></returns>
        private object GetDefaultVal(string typeText)
        {
            object val = "";
            switch (typeText) {
                case "tinyint":
                case "int":
                case "bigint":
                    val = 0;
                    break;
                case "datetime":
                    val = "DateTime.Now";
                    break;
                case "varchar":
                case "tinytext":
                case "text":
                case "longtext":
                case "mediumtext":
                    val = "string.Empty";
                    break;
                case "decimal":
                    val = 0;
                    break;
            }

          return val;
        }
    }
}
