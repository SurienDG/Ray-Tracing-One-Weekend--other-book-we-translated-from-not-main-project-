//
//  vec3.swift
//  Ray tracing One Weekend
//
//  Created by Surien on 2016-05-13.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation

class vec3 {
    
    var e = [Float](count: 3, repeatedValue:0)
    
    init ()
    {
        
    }
    
    init (e0:Float, e1:Float, e2:Float)
    {
        e[0] = e0
        e[1] = e1
        e[2] = e2
        
    }
    
    func length () -> Float
    {
        return sqrt(e[0] * e[0] + e[1] * e[1] + e[2] * e[2])
    }
    func squared_length() -> Float
    {
        return (e[0] * e[0] + e[0] * e[0] + e[0] * e[0])
    }
    func make_unit_vector()
    {
        let k:Float = 1.0 / sqrt(e[0] * e[0] + e[1] * e[1] + e[2] * e[2])
        e[0] = k*e[0]
        e[1] = k*e[1]
        e[2] = k*e[2]
    }
    
    func x() -> Float
    {
        return e[0]
    }
    func y() -> Float
    {
        return e[1]
    }
    func z() -> Float
    {
        return e[2]
    }
    func r() -> Float
    {
        return e[0]
    }
    func g() -> Float
    {
        return e[1]
    }
    func b() -> Float
    {
        return e[2]
    }
    
    
    
    
}

func +(let lhs:vec3, let rhs:vec3) -> vec3
{
    return vec3(e0: lhs.e[0] + rhs.e[0], e1: lhs.e[1] + rhs.e[1], e2:lhs.e[2] + rhs.e[2])
}

func -(let lhs:vec3, let rhs:vec3) -> vec3
{
    return vec3(e0: lhs.e[0] - rhs.e[0], e1: lhs.e[1] - rhs.e[1], e2: lhs.e[2] - rhs.e[2])
}

func *(let lhs:vec3, let rhs:vec3) -> vec3
{
    return vec3(e0: lhs.e[0] * rhs.e[0], e1: lhs.e[1] * rhs.e[1], e2: lhs.e[2] * rhs.e[2])
}

func /(let lhs:vec3, let rhs:vec3) -> vec3
{
    return vec3(e0: lhs.e[0]/rhs.e[0], e1: lhs.e[1]/rhs.e[1], e2: lhs.e[2]/rhs.e[2])
}

func *(lhs:Float, rhs:vec3) -> vec3
{
    return vec3(e0: lhs*rhs.e[0],e1: lhs*rhs.e[1], e2: lhs*rhs.e[2])
}

func /(lhs:vec3, rhs:Float) -> vec3
{
    return vec3(e0: lhs.e[0]/rhs, e1: lhs.e[1]/rhs, e2: lhs.e[2]/rhs)
}

func *(lhs:vec3, rhs:Float) -> vec3
{
    return vec3(e0: lhs.e[0]*rhs, e1: lhs.e[1]*rhs, e2: lhs.e[2]*rhs)
}

func dot (let v1:vec3, let v2:vec3) -> Float
{
    return (v1.e[0]*v2.e[0] + v1.e[1]*v2.e[1] + v1.e[2]*v2.e[2])
}
func cross (let v1:vec3, let v2:vec3) -> vec3
{
    return vec3(e0: (v1.e[1]*v2.e[2] - v1.e[2]*v2.e[1]), e1: (-(v1.e[0]*v2.e[2] - v1.e[2]*v2.e[0])),e2: (v1.e[0]*v2.e[1] - v1.e[1]*v2.e[0]))
}

func +=(lhs:vec3, let rhs:vec3)
{
    lhs.e[0] += rhs.e[0]
    lhs.e[1] += rhs.e[1]
    lhs.e[2] += rhs.e[2]
}

func *=(lhs:vec3, let rhs:vec3)
{
    lhs.e[0] *= rhs.e[0]
    lhs.e[1] *= rhs.e[1]
    lhs.e[2] *= rhs.e[2]
}

func /=(lhs:vec3, let rhs:vec3)
{
    lhs.e[0] /= rhs.e[0]
    lhs.e[1] /= rhs.e[1]
    lhs.e[2] /= rhs.e[2]
}
func -=(lhs:vec3, let rhs:vec3)
{
    lhs.e[0] -= rhs.e[0]
    lhs.e[1] -= rhs.e[1]
    lhs.e[2] -= rhs.e[2]
    
}

func *= (lhs:vec3, let rhs:Float)
{
    lhs.e[0] *= rhs
    lhs.e[1] *= rhs
    lhs.e[2] *= rhs
}

func /= (lhs:vec3, let rhs:Float)
{
    lhs.e[0] /= rhs
    lhs.e[1] /= rhs
    lhs.e[2] /= rhs
}

func unit_vector (v:vec3) -> vec3
{
    return v/v.length()
}




