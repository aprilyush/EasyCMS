using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.Extends
{
   public class LetterHelper
    {
       private static string[] letters=new string[]{"A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z"};
        private static string facyotyCode = "F";
        private static int startYear = 2005;
        private static int count = 24;
        public static string GetLetterByYear(int year,string farmCode,string tagType)
        {
            var yearDiff = year - startYear;
            //前缀
            var preCode= $"{farmCode}{facyotyCode}{tagType}";
            int index = 0;
            if (yearDiff == count)
            {
                index = 0;
               
            }else  if (yearDiff < count)
            {
                index = yearDiff;
                //return $"{preCode}{letters[yearDiff]}";
            }else if (yearDiff > count)
            {
               index = yearDiff % count;
               // return $"{preCode}{letters[remainder]}";
            }
            return $"{preCode}{letters[index]}";
        }
    }
}
