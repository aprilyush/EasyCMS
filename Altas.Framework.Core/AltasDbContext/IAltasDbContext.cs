using System;
using System.Collections.Generic;
using System.Text;
using SqlSugar;

namespace Altas.Framework.Core.AltasDbContext
{
    public interface IAltasDbContext
    {
        SqlSugarClient DbInstance();
    }
}
