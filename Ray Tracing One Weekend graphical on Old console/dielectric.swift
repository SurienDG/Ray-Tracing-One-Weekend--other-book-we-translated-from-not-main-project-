//
//  dielectric.swift
//  Ray Tracing One Weekend graphical on Old console
//
//  Created by comp on 2016-05-29.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

class dielectric : material
{
    var ref_idx:Float
    
    init(ri:Float)
    {
        ref_idx = ri
    }
    
   override func scatter(r_in: ray, rec: hit_record, inout attenuation: float3, inout scattered: ray) -> Bool
    {
        var outward_normal = float3()
        let reflected = reflect(r_in.direction(),n:rec.normal)
        var ni_over_nt:Float=1
        attenuation = float3(1.0,1.0,1.0)
        var refracted = float3()
        var reflect_prob:Float = 1
        var cosine:Float = 1
        
        if (dot(r_in.direction(),rec.normal)>0)
        {
            outward_normal = -rec.normal
            ni_over_nt = ref_idx
            cosine = ref_idx * dot(r_in.direction(),rec.normal)/length(r_in.direction())
        }
        else
        {
            outward_normal = rec.normal
            ni_over_nt = 1.0/ref_idx
            cosine = -dot(r_in.direction(), rec.normal)/length(r_in.direction())
            
        }
        if (refract(r_in.direction(), n: outward_normal, ni_over_nt: ni_over_nt, refracted: &refracted))
        {
            //refracted=refract(r_in.direction(), n: outward_normal, eta: ni_over_nt  )
            scattered = ray(a: rec.p,b: refracted)
           reflect_prob = schlick(cosine, ref_idx: ref_idx)
        }
        else
        {
           //scattered = ray(a: rec.p, b: reflected)
            reflect_prob = 1.0
           //return false;
        }
        if (Float(drand48()) < reflect_prob)
        {
            scattered = ray(a: rec.p, b: reflected)
        }
        else
        {
            scattered = ray(a: rec.p, b: refracted)
        }
        return true
        
    }
    
}
