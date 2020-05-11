using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.ViewModels.Api
{
    public class ExpertDetailDto
    {
        public string id { get; set; }
        public string expert_name { get; set; }
        public string expert_profile { get; set; }
        public int work_year { get; set; }
        public int expert_count { get; set; }
        public string position_name { get; set; }
        public string company_name { get; set; }

        public string category_id { get; set; }

        public decimal star_score { get; set; }
        //public decimal starLen { get; set; }
        public string head_url { get; set; }
        public string open_id { get; set; }

        public string expert_title { get; set; }
        public DateTime insert_time { get; set; }
    }
}
