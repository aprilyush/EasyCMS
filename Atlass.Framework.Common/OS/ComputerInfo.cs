namespace Atlass.Framework.Common
{
    public class ComputerInfo
    {/// <summary>
     /// 硬盘数量
     /// </summary>
        public int DiskCount { get; set; }

        /// <summary>
        /// 硬盘大小
        /// </summary>
        public string RAMTotal { get; set; }
        /// <summary>
        /// 硬盘空闲大小
        /// </summary>
        public string RAMFree { get; set; }
        /// <summary>
        /// 硬盘已使用大小
        /// </summary>
        public string RAMUsed { get; set; }
        /// <summary>
        /// 硬盘使用率
        /// </summary>
        public string UsedRate { get; set; }
    }
}