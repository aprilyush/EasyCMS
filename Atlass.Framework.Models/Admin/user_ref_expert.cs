using FreeSql.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Models.Admin
{
    /// <summary>
    /// 用户专家关联表
    /// </summary>
    public class user_ref_expert
    {
        [Column(IsPrimary =true,IsIdentity =true)]
        public int id { get; set; }
        public string expert_id { get; set; }
        public long user_id { get; set; }
    }
}
