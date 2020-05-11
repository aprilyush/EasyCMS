using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Atlass.Framework.Common.GeoArea
{
    public class location
    {
        public double lat;
        public double lng;
    }

    public class GpsPolygonHelper
    {
        /// <summary>
        /// 坐标点是否在多边形内判断
        /// </summary>
        /// <param name="point"></param>
        /// <param name="pts"></param>
        /// <returns></returns>
        public static bool IsPointInPolygon(location point, List<location> pts)
        {

            //检查类型
            if (point == null || pts == null)
                return false;

            var N = pts.Count;
            var boundOrVertex = true; //如果点位于多边形的顶点或边上，也算做点在多边形内，直接返回true
            var intersectCount = 0; //cross points count of x 
            var precision = 2e-10; //浮点类型计算时候与0比较时候的容差
            location p1, p2; //neighbour bound vertices
            var p = point; //测试点
            p1 = pts[0]; //left vertex        
            for (var i = 1; i <= N; ++i)
            {
//check all rays            
                if (p.lat.Equals(p1.lat) && p.lng.Equals(p1.lng))
                {
                    return boundOrVertex; //p is an vertex
                }

                p2 = pts[i % N]; //right vertex            
                if (p.lat < Math.Min(p1.lat, p2.lat) || p.lat > Math.Max(p1.lat, p2.lat))
                {
//ray is outside of our interests                
                    p1 = p2;
                    continue; //next ray left point
                }

                if (p.lat > Math.Min(p1.lat, p2.lat) && p.lat < Math.Max(p1.lat, p2.lat))
                {
//ray is crossing over by the algorithm (common part of)
                    if (p.lng <= Math.Max(p1.lng, p2.lng))
                    {
//x is before of ray                    
                        if (p1.lat == p2.lat && p.lng >= Math.Min(p1.lng, p2.lng))
                        {
//overlies on a horizontal ray
                            return boundOrVertex;
                        }

                        if (p1.lng == p2.lng)
                        {
//ray is vertical                        
                            if (p1.lng == p.lng)
                            {
//overlies on a vertical ray
                                return boundOrVertex;
                            }
                            else
                            {
//before ray
                                ++intersectCount;
                            }
                        }
                        else
                        {
//cross point on the left side                        
                            var xinters =
                                (p.lat - p1.lat) * (p2.lng - p1.lng) / (p2.lat - p1.lat) +
                                p1.lng; //cross point of lng                        
                            if (Math.Abs(p.lng - xinters) < precision)
                            {
//overlies on a ray
                                return boundOrVertex;
                            }

                            if (p.lng < xinters)
                            {
//before ray
                                ++intersectCount;
                            }
                        }
                    }
                }
                else
                {
//special case when ray is crossing through the vertex                
                    if (p.lat == p2.lat && p.lng <= p2.lng)
                    {
//p crossing over p2                    
                        var p3 = pts[(i + 1) % N]; //next vertex                    
                        if (p.lat >= Math.Min(p1.lat, p3.lat) && p.lat <= Math.Max(p1.lat, p3.lat))
                        {
//p.lat lies between p1.lat & p3.lat
                            ++intersectCount;
                        }
                        else
                        {
                            intersectCount += 2;
                        }
                    }
                }
                p1 = p2; //next ray left point
            }

            if (intersectCount % 2 == 0)
            {
//偶数在多边形外
                return false;
            }
            else
            {
                //奇数在多边形内
                return true;
            }

        }

        #region 依据地图上的经纬度坐标计算某个点到多边形各边的距离
        //地球半径，单位米
        private const double EARTH_RADIUS = 6378137;

        /// <summary>
        /// 判断是否在误差范围内
        /// </summary>
        /// <param name="point"></param>
        /// <param name="points"></param>
        /// <param name="limitDistance"></param>
        /// <returns></returns>
        public static bool InLimitDistance(location point, List<location> points, double limitDistance)
        {
            List<double> distance=new List<double>();
            var len = points.Count;
            var maxIndex = len - 1;
            for (int i = 0; i < len; i++)
            {
                //多边形中当前点
                var currentPoint = points[i];
                var nearPoint = maxIndex == i ? points[0] : points[i + 1];
                double a, b, c;
                a = GetDistance(point, currentPoint);//经纬坐标系中求两点的距离公式
                b = GetDistance(point, nearPoint);//经纬坐标系中求两点的距离公式
                c = GetDistance(currentPoint, nearPoint);//经纬坐标系中求两点的距离公式
                if (b * b >= c * c + a * a)
                {
                    distance.Add(c);
                    continue;
                  
                }
                 if (c * c >= b * b + a * a)
                {
                    distance.Add(b);
                    continue;
                }

                double l = (a + b + c) / 2;     //周长的一半
                double s = Math.Sqrt(l * (l - a) * (l - b) * (l - c));  //海伦公式求面积 
                distance.Add(2 * s / a);
            }

            if (!distance.Any())
            {
                return false;
            }

            var count = distance.Where(s => s < limitDistance).Count();
            if (count > 0) return true;
            return false;
        }
        /// <summary>
        /// 计算两点位置的距离，返回两点的距离，单位：米
        /// 该公式为GOOGLE提供，误差小于0.2米
        /// </summary>
        /// <param name="lng1">第一点经度</param>
        /// <param name="lat1">第一点纬度</param>        
        /// <param name="lng2">第二点经度</param>
        /// <param name="lat2">第二点纬度</param>
        /// <returns></returns>
        private static double GetDistance(location point1, location point2)
        {
            double radLat1 = Rad(point1.lat);
            double radLng1 = Rad(point1.lng);
            double radLat2 = Rad(point2.lat);
            double radLng2 = Rad(point2.lng);
            double a = radLat1 - radLat2;
            double b = radLng1 - radLng2;
            double result = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) + Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2))) * EARTH_RADIUS;
            return result;
        }

        /// <summary>
        /// 经纬度转化成弧度
        /// </summary>
        /// <param name="d"></param>
        /// <returns></returns>
        private static double Rad(double d)
        {
            return (double)d * Math.PI / 180d;
        }
        #endregion

    }
}
