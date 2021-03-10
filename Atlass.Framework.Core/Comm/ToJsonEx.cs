using System;
using System.Collections.Generic;
using System.Text;
using Atlass.Framework.Common;
using Atlass.Framework.ViewModels;
using Atlass.Framework.ViewModels.Common;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Atlass.Framework.Core.Comm
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
        public static string ToJson(this BootstrapGridDto grid)
        {
            return JsonConvert.SerializeObject(grid, JsonSettings);
        }
        public static string ToJson(this ResultAdaptDto resultAdaptDto)
        {
            return JsonConvert.SerializeObject(resultAdaptDto, JsonSettings);
        }
        public static string ToJson(this BootstrapGridDto grid, string datetimeformats)
        {
            var timeConverter = new IsoDateTimeConverter { DateTimeFormat = datetimeformats };
            return JsonConvert.SerializeObject(grid, Formatting.Indented, timeConverter);
        }
        public static string ToJson(this ResultAdaptDto resultAdaptDto, string datetimeformats)
        {
            var timeConverter = new IsoDateTimeConverter { DateTimeFormat = datetimeformats };
            return JsonConvert.SerializeObject(resultAdaptDto, Formatting.Indented, timeConverter);
        }
    }
}
