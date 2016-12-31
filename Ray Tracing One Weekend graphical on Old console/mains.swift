//
//  main.swift
//  Ray tracing One Weekend
//
//  Created by Surien on 2016-05-13.
//  Copyright © 2016 Surien. All rights reserved.
//

import Foundation
import simd



func color (r:ray, world:hitable, depth:Int) -> float3
{
    //var rec: hit_record = hit_record(Normal(0,0,0),0)
   //var t:Float = hit_sphere(vec3(e0: 0,e1: 0,e2: -1), radius: 0.5, r: r)
var rec = hit_record()
    if (world.hit(r,t_min: 0.001,t_max: Float.infinity,rec: &rec))
    {
        var scattered = ray()
        var attenuation = float3()
        if (depth < 50
            && rec.mat_ptr.scatter(r,rec: rec, attenuation: &attenuation, scattered: &scattered))
        {
            return attenuation*color(scattered, world: world, depth: depth + 1)
        }
        else
        {
            return float3(0,0,0)
        }
        
    }
    else
    {
    let unit_direction = normalize(r.direction())
    let t = 0.5*(unit_direction.y + 1.0)
    return (1.0-t)*float3(1.0,1.0,1.0) + t*float3(0.5, 0.7, 1.0)
    }
    
    
}

/*func reflect (let v:float3, let n:float3) -> float3
{
    return v - 2*dot(v,n)*n
}
*/
func refract (let v:float3, let n:float3, ni_over_nt:Float, inout refracted:float3) -> Bool
{
var uv:float3 = normalize(v)
    var dt:Float = dot(uv,n)
    var discriminant = 1.0 - ni_over_nt*ni_over_nt*(1.0-dt*dt)
    if discriminant>0
    {
        refracted = ni_over_nt*(uv - n*dt) - n*sqrt(discriminant)
        return true
    }
    else
    {
        return false
    }
}

func schlick (cosine:Float, ref_idx:Float) ->Float
{
    var r0:Float = (1-ref_idx)/(1+ref_idx)
    r0 = r0*r0
    return r0 + (1-r0)*pow((1-cosine),5)
}

/*func hit_sphere (let center:vec3, radius:Float, let r:ray) -> Float
{
    let oc = r.orgin() - center
    let a = dot(r.direction(), v2: r.direction())
    let b = 2.0 * dot(oc,v2: r.direction())
    let c = dot (oc,v2: oc) - radius*radius
    let discriminant = b*b - 4*a*c
    
    if (discriminant < 0)
    {
        return -1.0
    }
    else
    {
        return (-b - sqrt(discriminant))/(2.0*a)
    }
}*/

var nx = 200
var ny = 100

/*print("P3\n\(nx) \(ny)\n255")

var lower_left_corner = vec3(e0: -2.0,e1: -1.0,e2: -1.0)
var horizontal = vec3(e0: 4.0,e1: 0.0, e2: 0.0)
var vertical = vec3(e0: 0.0,e1: 2.0,e2: 0.0)
var orgin = vec3(e0: 0.0, e1: 0.0, e2: 0.0)


for var j:Int = ny-1; j>=0; j-=1
{
    for var i:Int = 0; i<nx; i+=1
    {
        var u = Float(i)/Float(nx)
        var v = Float(j)/Float(ny)
        var r = ray(a: orgin, b: lower_left_corner + u*horizontal + v*vertical)
        var col = color(r)
        var ir:Int = Int(255.99*col.e[0])
        var ig:Int = Int(255.99*col.e[1])
        var ib:Int = Int(255.99*col.e[2])
        print ("\(ir) \(ig) \(ib)")
    }
}


let width = 800
let height = 400
var pixelSet = makePixelSet(width, height)
var image = imageFromPixels(pixelSet)

*/
