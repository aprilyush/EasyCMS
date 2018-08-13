using System;
using System.Collections.Generic;
using System.Text;
using JWT;
using JWT.Algorithms;
using JWT.Serializers;

namespace Animal.Adoption.Utils.JWT
{
    public class JwtHelper
    {
        private const string secret = "QaP1AF8utIarcBqdhYTZpVGbiNQ9M6IL.altas";
        private static IDateTimeProvider _provider = null;
        private static IJwtAlgorithm _algorithm = null;
        private static IJsonSerializer _serializer = null;
        private static IBase64UrlEncoder _urlEncoder = null;
        static JwtHelper()
        {
            _provider = new UtcDateTimeProvider();
            _algorithm = new HMACSHA256Algorithm();
            _serializer = new JsonNetSerializer();
            _urlEncoder = new JwtBase64UrlEncoder();
        }
        public static string GetToken()
        {
            
            var now = _provider.GetNow().AddHours(2);

            //var unixEpoch = JwtValidator; // 1970-01-01 00:00:00 UTC
            var secondsSinceEpoch = 5000;
            //Math.Round((now - unixEpoch).TotalSeconds);
            var payload = new Dictionary<string, object>
            {
                //{ "claim1", 0 },
                //{ "claim2", "claim2-value" },
                {"exp",secondsSinceEpoch }
            };

            IJwtEncoder encoder = new JwtEncoder(_algorithm, _serializer, _urlEncoder);

           // TokenDto tokenModel = new TokenDto();

            //tokenModel.token = encoder.Encode(payload, secret);
           // tokenModel.expire = secondsSinceEpoch;
            return encoder.Encode(payload, secret);
        }

        public static bool ValidateToken(string token)
        {
 
            IJwtValidator validator = new JwtValidator(_serializer, _provider);
            
            IJwtDecoder decoder = new JwtDecoder(_serializer, validator, _urlEncoder);
            try
            {
                decoder.Decode(token, secret, verify: true);
            }
            catch
            {
                return false;
            }

            return true;
        }
    }
}
