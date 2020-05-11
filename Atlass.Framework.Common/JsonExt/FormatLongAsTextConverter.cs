using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Atlass.Framework.Common
{
    public class FormatLongAsTextConverter: JsonConverter
    {
        //public override bool CanRead => false;
        //public override bool CanWrite => true;
        //public override bool CanConvert(Type type) => type == typeof(long);
        public override bool CanConvert(Type type)
        {
            return typeof (long).Equals(type);
        }
        public override void WriteJson(
            JsonWriter writer, object value, JsonSerializer serializer)
        {
            long number = (long)value;
            writer.WriteValue(number.ToString(CultureInfo.InvariantCulture));
        }

        public override object ReadJson(
            JsonReader reader, Type type, object existingValue, JsonSerializer serializer)
        {
            throw new NotSupportedException();
        }

        public override bool CanRead
        {
            get { return false; }
        }

        public override bool CanWrite
        {
            get { return true; }
        }
    }
}
