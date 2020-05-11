using Atlass.Framework.Common.NLog;
using Atlass.Framework.Models.Admin;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;


namespace Atlass.Framework.Core.HostService
{
    public class EasyLogHostedService: IHostedService, IDisposable
    {
        private readonly ILogger _logger;
        private readonly IFreeSql _freeSql;
        public EasyLogHostedService(ILogger<EasyLogHostedService> logger,IFreeSql freeSql)
        {
            _logger = logger;
            _freeSql = freeSql;
        }
        public Task StartAsync(CancellationToken cancellationToken)
        {
            //Console.WriteLine("启动定时任务托管服务");

            Task.Factory.StartNew(() => DoWork());
            return Task.CompletedTask;
        }

        private void DoWork()
        {
            try
            {
                //Console.WriteLine("服务开始了吗");
                while (true)
                {
                    //队列中取log
                    LogDto log=LogQueueInstance.GetLog();
                    if (log != null)
                    {
                        try
                        {

                            easy_log logModel = new easy_log();
                            logModel.log_summary = log.LogSummary;
                            logModel.log_message = log.LogMessage;
                            logModel.log_type = log.LogType;
                            logModel.log_time = log.LogTime;
                            _freeSql.Insert(logModel).ExecuteAffrows();

                        }
                        catch(Exception ex)
                        {
                            _logger.LogError(ex.ToString());
                        }
                      
                    }
                    Thread.Sleep(100);
                }
            }
            catch(Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
         
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {

            LogQueueInstance.Clear();

            return Task.CompletedTask;
        }

        public void Dispose()
        {
            // 手动释放定时器
            // _timer?.Dispose();
            LogQueueInstance.Clear();
        }
    }
}
