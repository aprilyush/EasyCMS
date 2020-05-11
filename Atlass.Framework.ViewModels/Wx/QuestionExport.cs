using System;
using System.Collections.Generic;
using System.Text;
using CsvHelper.Configuration.Attributes;

namespace Atlass.Framework.ViewModels.Wx
{
    public class QuestionExport
    {
        [Name("咨询师")]
        public string Name { get; set; }
        [Name("提问时间")]
        public string Qtime { get; set; }
        [Name("咨询内容")]
        public string Qcontent { get; set; }
        [Name("回答时间")]
        public string ReplyTime { get; set; }
        [Name("回答内容")]
        public string ReplyContentOne { get; set; }
        [Name("追答时间")]
        public string ReplyTimeTwo { get; set; }
        [Name("追答内容")]
        public string ReplyContentTwo { get; set; }
        [Name("回合标记")]
        public int RountNum { get; set; }
        [Name("评分")]
        public int Star { get; set; }
        [Name("打赏")]
        public int PayMoney { get; set; }
        [Name("唯一身份")]
        public string Openid { get; set; }
    }
}
