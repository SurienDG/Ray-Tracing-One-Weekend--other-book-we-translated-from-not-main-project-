//
//  camera.swift
//  Ray Tracing One Weekend graphical on Old console
//
//  Created by Surien on 2016-05-17.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd


func random_in_unit_disk() -> float3
{
    var p:float3
    
    repeat
    {
        p = 2.0*float3(Float(drand48()),Float(drand48()),0) - float3(1,1,0)
    }while (dot(p,p) >= 1.0)
    return p
}

class camera
{
    var origin:float3
    var lower_left_corner:float3
    var vertical:float3
    var horizontal:float3
    var u:float3
    var v:float3
    var w:float3
    var lens_radius:Float
    
    init (lookfrom:float3, lookat:float3, vup:float3, vfov:Float, aspect:Float, aperture:Float, focus_dist:Float)
    {
        
        var theta = vfov*Float(M_PI)/180
        var half_height = tan(theta/2)
        var half_width = aspect*half_height
        lens_radius = aperture/2
        origin = lookfrom
        w = normalize(lookfrom - lookat)
        u = normalize(cross(vup,w))
        v = cross(w,u)
        //lower_left_corner = float3(-half_width,-half_height, -1.0)
        lower_left_corner = origin - half_height*focus_dist*u - half_height*focus_dist*v - focus_dist*w
        horizontal =  2*half_width*focus_dist*u
        vertical = 2*half_height*focus_dist*v
        
    }
    func get_ray(s:Float, t:Float) -> ray
    {
        var rd:float3 = lens_radius*random_in_unit_disk()
        let offset = u*rd.x + v*rd.y
        return ray(a: origin + offset, b: lower_left_corner + s*horizontal + t*vertical - origin - offset)
    }
}