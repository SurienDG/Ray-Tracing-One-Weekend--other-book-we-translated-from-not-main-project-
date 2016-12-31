//
//  random scene.swift
//  Ray Tracing One Weekend graphical on Old console
//
//  Created by comp on 2016-05-30.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd

func random_scene() -> hitable_list {
    var objects = [hitable]()
    var i:Int = 1
    objects.append(sphere(cen: float3(0, -1000, 0), r: 1000, m: lambertian(a: float3(0.5, 0.5, 0.5))))
    for a in -7..<7 {
        for b in -7..<7 {
            let materialChoice = drand48()
            let center = float3(Float(a) + 0.9 * Float(drand48()), 0.2, Float(b) + 0.9 * Float(drand48()))
            if length(center - float3(4, 0.2, 0)) > 0.9 {
                if materialChoice < 0.8 {   // diffuse
                    let albedo = float3(Float(drand48()) * Float(drand48()), Float(drand48()) * Float(drand48()), Float(drand48()) * Float(drand48()))
                    objects.append(sphere(cen: center, r: 0.2, m: lambertian(a: albedo)))
                    i+=1
                } else if materialChoice < 0.95 {   // metal
                    let albedo = float3(0.5 * (1 + Float(drand48())), 0.5 * (1 + Float(drand48())), 0.5 * (1 + Float(drand48())))
                    objects.append(sphere(cen: center, r: 0.2, m: metal(a: albedo, f: Float(0.5 * drand48()))))
                    i+=1
                } else {    // glass
                    objects.append(sphere(cen: center, r: 0.2, m: dielectric(ri: 1.5)))
                    i+=1
                }
            }
        }
    }
    objects.append(sphere(cen: float3(-3, 0.7, 0), r: 0.7, m: lambertian(a: float3(0.4, 0.2, 0.1))))
    objects.append(sphere(cen: float3(0, 0.7, 0), r: 0.7, m: dielectric(ri: 1.5)))
    i+=1
    
    i+=1
    objects.append(sphere(cen: float3(3, 0.7, 0), r: 0.7, m: metal(a: float3(0.7, 0.6, 0.5), f: 0.0)))
    i+=1
    
    return hitable_list(l: objects, n: i)
}