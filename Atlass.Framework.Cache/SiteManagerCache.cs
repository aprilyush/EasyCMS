using Atlass.Framework.Models;
using Atlass.Framework.Models.BaseData;
using EasyCaching.Core;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace Atlass.Framework.Cache
{
    public static class SiteManagerCache
    {
        private static ConcurrentDictionary<string,cms_site> SiteDic;
        private static ConcurrentDictionary<string, cms_upload_set> UploadSetDic;
        private static ConcurrentDictionary<int, cms_ad> AdDic;
        static SiteManagerCache()
        {
            SiteDic = new ConcurrentDictionary<string, cms_site>();
            UploadSetDic = new ConcurrentDictionary<string, cms_upload_set>();
            AdDic = new ConcurrentDictionary<int, cms_ad>();
        }

        #region 站点基本信息
        /// <summary>
        /// 获取站点缓存信息
        /// </summary>
        /// <returns></returns>
        public static cms_site GetSiteInfo()
        {
            if (SiteDic.ContainsKey("cms_site"))
            {
                return SiteDic["cms_site"];
            }

            return new cms_site();
        }
       
        /// <summary>
        /// 设置站点缓存信息
        /// </summary>
        /// <param name="siteInfo"></param>
        public static void SetSiteInfo(cms_site siteInfo)
        {
            if (SiteDic.ContainsKey("cms_site"))
            {
                SiteDic["cms_site"] = siteInfo;
                return;
            }
            SiteDic.TryAdd("cms_site", siteInfo);
        }
        #endregion

        #region 上传设置
        /// <summary>
        /// 获取上传设置
        /// </summary>
        /// <returns></returns>
        public static cms_upload_set GetUploadInfo()
        {
            if (UploadSetDic.ContainsKey("cms_upload_set"))
            {
                return UploadSetDic["cms_upload_set"];
            }

            return new cms_upload_set();
        }

        /// <summary>
        /// 设置上传设置
        /// </summary>
        /// <param name="siteInfo"></param>
        public static void SetUploadInfo(cms_upload_set siteInfo)
        {
            if (UploadSetDic.ContainsKey("cms_upload_set"))
            {
                UploadSetDic["cms_upload_set"] = siteInfo;
                return;
            }
            UploadSetDic.TryAdd("cms_upload_set", siteInfo);
        }
        #endregion

        #region 广告设置
        /// <summary>
        /// 设置广告
        /// </summary>
        /// <param name="dto"></param>
         public static void AddAdvertising(cms_ad dto)
        {
            if (AdDic.ContainsKey(dto.id))
            {
                AdDic[dto.id] = dto;
                return;
            }
            AdDic.TryAdd(dto.id, dto);
        }
        /// <summary>
        /// 移除广告
        /// </summary>
        /// <param name="id"></param>
        public static void RemoveAdvertising(int id)
        {
            if (AdDic.ContainsKey(id))
            {
                AdDic.TryRemove(id,out cms_ad dto);
            }
        }
        #endregion
    }
}
