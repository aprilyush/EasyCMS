using System;

namespace Atlass.Framework.Enum
{
    /// <summary>
    /// 数据状态字段
    /// </summary>
    public class DataStatusConstant
    {
        /// <summary>
        /// 正常
        /// </summary>
        public static int ENABLE = 1;
        /// <summary>
        /// 停用
        /// </summary>
        public static int DISABLE = 0;
        /// <summary>
        /// 删除
        /// </summary>
        public static int DELETED = 1;
        /// <summary>
        /// 正常
        /// </summary>
        public static int NOT_DELETED = 0;
        /// <summary>
        /// 超管
        /// </summary>
        public static int SUPER = 1;
        /// <summary>
        /// 普通
        /// </summary>
        public static int NOT_SUPER = 0;
        /// <summary>
        /// 公司
        /// </summary>
        public static int COMPANY = 0;
        /// <summary>
        /// 部门
        /// </summary>
        public static int DEPARTMENT = 1;
        /// <summary>
        /// 男
        /// </summary>
        public static int MALE = 1;
        /// <summary>
        /// 女
        /// </summary>
        public static int FEMALE = 0;
        /// <summary>
        /// 未知
        /// </summary>
        public static int GENDER_UNKNOWN = 2;
    }
}
