//
//  metal.swift
//  Ray Tracing One Weekend graphical on Old console
//
//  Created by comp on 2016-05-19.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

class metal: material
{
    var albedo:float3
    var fuzz:Float
    init (let a:float3, let f:Float)
    {
        albedo = a
        if f<1
        {
        fuzz = f
        }
        else
        {
            fuzz=1
        }
        
    }
    override func scatter(r_in: ray, rec: hit_record, inout attenuation: float3, inout scattered: ray) -> Bool {
        
        var reflected:float3 = reflect(normalize(r_in.direction()),n: rec.normal)
        scattered = ray (a: rec.p,b: reflected + fuzz*random_in_unit_sphere())
        attenuation = albedo
        return dot(scattered.direction(),rec.normal) > 0
    }
}