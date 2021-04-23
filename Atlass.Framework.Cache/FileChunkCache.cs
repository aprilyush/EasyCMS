using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atlass.Framework.Cache
{
    public class FileChunkCache
    {
        private static ConcurrentDictionary<string, bool> ChunkCache = new ConcurrentDictionary<string, bool>();

        /// <summary>
        /// 添加分片
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static void AddChunkId(string id)
        {
            ChunkCache[id] = true;
        }

        /// <summary>
        /// 移除分片
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static void RemoveChunkId(string id)
        {
            if (ChunkCache.ContainsKey(id))
            {
                ChunkCache.TryRemove(id, out bool value);
            }
           
        }

        /// <summary>
        /// 是否存在分片
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool ExistChunk(string id)
        {
            return ChunkCache.ContainsKey(id);
        }
    }
}
