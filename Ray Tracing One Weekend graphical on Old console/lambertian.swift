//
//  lambertian.swift
//  Ray Tracing One Weekend graphical on Old console
//
//  Created by comp on 2016-05-19.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

class lambertian : material
{
    var albedo:float3
    
    init (let a:float3)
    {
        albedo=a
    }
    
    override func scatter(r_in: ray, rec: hit_record, inout attenuation: float3, inout scattered: ray) -> Bool
    {
        let target:float3 = rec.p + rec.normal + random_in_unit_sphere()
        scattered = ray(a: rec.p, b: target-rec.p)
        attenuation = albedo
        return true
    }
}