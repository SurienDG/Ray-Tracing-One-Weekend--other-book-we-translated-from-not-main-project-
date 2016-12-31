//
//  ray.swift
//  Ray tracing One Weekend
//
//  Created by Surien on 2016-05-13.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

class ray
{
    
    var A:float3
    var B:float3
    
    init ()
    {
        A=float3()
        B=float3()
    }
    
    init (let a:float3, let b:float3)
    {
        A=a
        B=b
    }
    func orgin () -> float3
    {
        return A
    }
    func direction () -> float3
    {
        return B
    }
    func point_at_parameter (t:Float) -> float3
    {
        return A + t*B
    }
}
