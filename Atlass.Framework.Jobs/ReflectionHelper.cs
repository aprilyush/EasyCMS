using System;
using System.Linq.Expressions;
using System.Reflection;
namespace Atlass.Framework.Jobs
{
    public class ReflectionHelper
    {
        //public static T Instance<T>(string assemblyName,string className)
        //{
        //    string fullClassName = $"{assemblyName}.{className}";
        //    Assembly assembly = Assembly.Load(assemblyName);
        //    Type classType = Type.GetType(fullClassName);
        //    object classInstance= Activator.CreateInstance(classType, null);
        //    return (T)classInstance;

        //}

        public static T Instance<T>(string assemblyName, string className)
        {
            try
            {
                Type classType = Type.GetType($"{assemblyName}.{className}");
                Func<T> classFunc = Expression.Lambda<Func<T>>(Expression.New(classType)).Compile();
                return classFunc();
            }
            catch
            {
                Type classType = Type.GetType($"{assemblyName}.{className}");
                object classInstance = Activator.CreateInstance(classType, true);
                return (T)classInstance;
            }


        }
    }

    /// <summary>
    /// 来自Hprose 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public static class Factory<T>
    {
        private static readonly Func<string,string, T> constructor = GetConstructor();
        private static Func<string, string, T> GetConstructor()
        {
            try
            {
                return Expression.Lambda<Func<string, string, T>>(Expression.New(typeof(T))).Compile();
            }
            catch
            {
#if NET35_CF
                var ctor = typeof(T).GetConstructor(new Type[0]);
                return () => (T)ctor.Invoke(new object[0]);
#else
                return (string assemblyName, string className) => (T)Activator.CreateInstance(typeof(T), true);
#endif
            }
        }
        public static T New(string assemblyName, string className)
        {
            return constructor( assemblyName, className);
        }
    }
}
