using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestJob
{
    public class ReflectionHelper
    {
        public static T Instance<T>(string namespace1, string className)
        {

            Type classType = Type.GetType($"{namespace1}.{className}");
            object classInstance = Activator.CreateInstance(classType, null);
            return (T)classInstance;

        }
    }
}
