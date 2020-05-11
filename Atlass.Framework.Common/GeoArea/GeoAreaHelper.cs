using System;
using System.Collections.Generic;
using System.Text;

namespace Atlass.Framework.Common.GeoArea
{
    public class locations
    {
        public string lat;
        public string lng;
    }
    public class GeoAreaHelper
    {
        public static bool isPointInPolygon(locations point, List<locations> pts)
        {

            //检查类型
            if (point == null || pts == null)
                return false;

            var N = pts.Count;
            var boundOrVertex = true; //如果点位于多边形的顶点或边上，也算做点在多边形内，直接返回true
            var intersectCount = 0;//cross points count of x 
            var precision = 2e-10; //浮点类型计算时候与0比较时候的容差
            locations p1, p2;//neighbour bound vertices
            var p = point; //测试点
            p1 = pts[0];//left vertex        
            for (var i = 1; i <= N; ++i)
            {//check all rays            
                if (p.lat.Equals(p1.lat) && p.lng.Equals(p1.lng))
                {
                    return boundOrVertex;//p is an vertex
                }

                p2 = pts[i % N];//right vertex            
                if (double.Parse(p.lat) < Math.Min(double.Parse(p1.lat), double.Parse(p2.lat)) || double.Parse(p.lat) > Math.Max(double.Parse(p1.lat), double.Parse(p2.lat)))
                {//ray is outside of our interests                
                    p1 = p2;
                    continue;//next ray left point
                }

                if (double.Parse(p.lat) > Math.Min(double.Parse(p1.lat), double.Parse(p2.lat)) && double.Parse(p.lat) < Math.Max(double.Parse(p1.lat), double.Parse(p2.lat)))
                {//ray is crossing over by the algorithm (common part of)
                    if (double.Parse(p.lng) <= Math.Max(double.Parse(p1.lng), double.Parse(p2.lng)))
                    {//x is before of ray                    
                        if (double.Parse(p1.lat) == double.Parse(p2.lat) && double.Parse(p.lng) >= Math.Min(double.Parse(p1.lng), double.Parse(p2.lng)))
                        {//overlies on a horizontal ray
                            return boundOrVertex;
                        }

                        if (double.Parse(p1.lng) == double.Parse(p2.lng))
                        {//ray is vertical                        
                            if (double.Parse(p1.lng) == double.Parse(p.lng))
                            {//overlies on a vertical ray
                                return boundOrVertex;
                            }
                            else
                            {//before ray
                                ++intersectCount;
                            }
                        }
                        else
                        {//cross point on the left side                        
                            var xinters = (double.Parse(p.lat) - double.Parse(p1.lat)) * (double.Parse(p2.lng) - double.Parse(p1.lng)) / (double.Parse(p2.lat) - double.Parse(p1.lat)) + double.Parse(p1.lng);//cross point of lng                        
                            if (Math.Abs(double.Parse(p.lng) - xinters) < precision)
                            {//overlies on a ray
                                return boundOrVertex;
                            }

                            if (double.Parse(p.lng) < xinters)
                            {//before ray
                                ++intersectCount;
                            }
                        }
                    }
                }
                else
                {//special case when ray is crossing through the vertex                
                    if (p.lat == p2.lat && double.Parse(p.lng) <= double.Parse(p2.lng))
                    {//p crossing over p2                    
                        var p3 = pts[(i + 1) % N]; //next vertex                    
                        if (double.Parse(p.lat) >= Math.Min(double.Parse(p1.lat), double.Parse(p3.lat)) && double.Parse(p.lat) <= Math.Max(double.Parse(p1.lat), double.Parse(p3.lat)))
                        {//p.lat lies between p1.lat & p3.lat
                            ++intersectCount;
                        }
                        else
                        {
                            intersectCount += 2;
                        }
                    }
                }
                p1 = p2;//next ray left point
            }

            if (intersectCount % 2 == 0)
            {//偶数在多边形外
                return false;
            }
            else
            { //奇数在多边形内
                return true;
            }

        }
    }
}
