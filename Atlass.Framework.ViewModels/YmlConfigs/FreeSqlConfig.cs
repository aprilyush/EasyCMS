using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.ViewModels.YmlConfigs
{
    /// <summary>
    /// freesql的一些配置
    /// </summary>
    public class FreeSqlConfig
    { /// <summary>
      /// 是否记录sql 
      /// </summary>
        public bool LogSql { get; set; } = false;
    }
}
