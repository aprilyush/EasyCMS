using Atlass.Framework.Models.BaseData;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Atlass.Framework.AppService.BasicData
{
    public class WeiXinSetAppService
    {
        private readonly IFreeSql Sqldb;
        public WeiXinSetAppService(IServiceProvider service)
        {
            Sqldb = service.GetRequiredService<IFreeSql>();
        }


        public void SaveSet(weixin_set dto)
        {
            dto.site_host = dto.site_host.Trim();
            dto.consulting_success = dto.consulting_success.Trim();
            dto.new_question = dto.new_question.Trim();
            dto.feed_back = dto.feed_back.Trim();
            dto.question_end = dto.question_end.Trim();
            dto.pay_notice = dto.pay_notice.Trim();
            if (dto.id == 0)
            {
                Sqldb.Insert(dto).ExecuteAffrows();
            }
            else
            {
                Sqldb.Update<weixin_set>().SetSource(dto).ExecuteAffrows();
            }
        }

        public weixin_set GetModel()
        {
            return Sqldb.Select<weixin_set>().OrderBy(s => s.id).First();
        }
    }
}
