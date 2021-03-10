
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Data;


namespace Atlass.Framework.Common
{
    public static partial class ToJsonEx
    {
        public static readonly JsonSerializerSettings JsonSettings = new JsonSerializerSettings
        {
            //ContractResolver = new CamelCasePropertyNamesContractResolver(),
            Converters = new List<JsonConverter>
            {
                new IsoDateTimeConverter {DateTimeFormat = "yyyy-MM-dd HH:mm:ss"}
                ,new FormatLongAsTextConverter()
            }
        };

        public static object ToJson(this string Json)
        {
            return Json == null ? null : JsonConvert.DeserializeObject(Json);
        }
        public static string ToJson(this object obj)
        {
           // var timeConverter = new IsoDateTimeConverter { DateTimeFormat = "yyyy-MM-dd HH:mm:ss" };
            //JsonSerializerSettings jsetting = new JsonSerializerSettings();
           // jsetting.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            //jsetting.Converters.Add(new DataLongTypeConverter());
            //jsetting.Converters.Add(new FormatLongAsTextConverter());
                
            //jsetting.DefaultValueHandling = DefaultValueHandling.Include;
            return JsonConvert.SerializeObject(obj, JsonSettings);
        }
        public static string ToJson(this object obj, string datetimeformats)
        {
            var timeConverter = new IsoDateTimeConverter { DateTimeFormat = datetimeformats };
            return JsonConvert.SerializeObject(obj, Formatting.Indented, timeConverter);
        }
        public static T ToObject<T>(this string Json)
        {
            return Json == null ? default(T) : JsonConvert.DeserializeObject<T>(Json);
        }
        public static List<T> ToList<T>(this string Json)
        {
            return Json == null ? null : JsonConvert.DeserializeObject<List<T>>(Json);
        }
        public static DataTable ToTable(this string Json)
        {
            return Json == null ? null : JsonConvert.DeserializeObject<DataTable>(Json);
        }
        public static JObject ToJObject(this string Json)
        {
            return Json == null ? JObject.Parse("{}") : JObject.Parse(Json.Replace("&nbsp;", ""));
        }

        public static Dictionary<string, object> ToDictionary(this string Json)
        {
            return Json == null ? null : JsonConvert.DeserializeObject<Dictionary<string, object>>(Json);
        }
        public static Dictionary<string, object> ToDictionary(this JObject json)
        {
           return new Dictionary<string, object>(json.ToObject<IDictionary<string, object>>(), StringComparer.CurrentCultureIgnoreCase);
        }
    }
}
