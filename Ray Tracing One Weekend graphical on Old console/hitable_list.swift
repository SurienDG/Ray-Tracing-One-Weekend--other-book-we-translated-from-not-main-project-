//
//  hitable_list.swift
//  Ray tracing One Weekend
//
//  Created by Surien on 2016-05-16.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

class hitable_list:hitable
{
    var list=[hitable]()
    var list_size:Int
    
   
    init( l: [hitable],n:Int)
    {
        list = l
        list_size = n
        
        
    }
    override func hit(r:ray,t_min:Float,t_max:Float, inout rec:hit_record) -> Bool
    {
                var hit_anything:Bool = false
        
               for i in 0..<list_size
        {
            if (list[i].hit(r,t_min: t_min,t_max: t_max,rec: &rec))
            {
                hit_anything = true
               
            }
        }
        return hit_anything
    }
    
}

func random_in_unit_sphere() -> float3
{
    var p:float3
    repeat
    {
    p=2.0 * float3(Float(drand48()),Float(drand48()),Float(drand48())) - float3(1,1,1)
    }while (dot(p,p) >= 1.0)
    return p
}