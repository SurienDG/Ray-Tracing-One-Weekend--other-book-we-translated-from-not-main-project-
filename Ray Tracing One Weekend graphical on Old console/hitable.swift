//
//  hitable.swift
//  Ray tracing One Weekend
//
//  Created by Surien on 2016-05-14.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

struct hit_record
{
    var t:Float
    var p:float3
    var normal:float3
    var mat_ptr:material
    init() {
        t = 0.0
        p = float3(0.0, 0.0, 0.0)
        normal = float3(0.0, 0.0, 0.0)
        mat_ptr = metal(a: float3(0.0, 0.0, 0.0), f:Float())
    }
    
}

class hitable
{
    func hit(let r:ray, let t_min:Float, let t_max:Float, inout rec:hit_record) -> Bool
    {
        
        return Bool(0)
    }
    
}

class sphere: hitable
{
    var center:float3 = float3()
    var radius:Float = Float(0.0)
    var mat:material
    init(cen:float3, r:Float, m:material)
        {
            center=cen
            radius=r
            mat=m
            
        }
    
    
    override func hit (let r:ray, t_min:Float, t_max:Float, inout rec:hit_record)->Bool
    {
        var oc:float3 = r.orgin() - center
        var a:Float = dot(r.direction(),r.direction())
        var b:Float = dot(oc,r.direction())
        var c:Float = dot(oc,oc) - radius*radius
        var discriminant:Float = b*b - a*c
        if (discriminant > 0)
        {
            var temp = (-b - sqrt(discriminant) ) / a
            if temp < t_min {
                temp = (-b + sqrt(discriminant) ) / a
            }
           // temp = (-b + sqrt(b*b - a*c))/a
            if (temp < t_max && temp>t_min)
            {
                rec.t = temp
                rec.p = r.point_at_parameter(rec.t)
                rec.normal = (rec.p - center)/float3(radius)
                rec.mat_ptr = mat
                return true
            }
            
        }
        return false
  }}


    