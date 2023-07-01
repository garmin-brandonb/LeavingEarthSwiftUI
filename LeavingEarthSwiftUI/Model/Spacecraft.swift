//
//  Spacecraft.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Spacecraft {
    //    let spaceAgency: SpaceAgency
    
    let component: Components
    
    func spacecraftCalculations(component: Components) -> (spacecraftMass: Int, spacecraftCost: Int, spacecraftThrust: Int) {
        var spacecraftMass: Int = 0
        var spacecraftCost: Int = 0
        var spacecraftThrust: Int = 0
        
        for rocket in component.rocket {
            spacecraftMass += rocket.mass
            spacecraftCost += rocket.cost
            spacecraftThrust += rocket.thrust
        }
        
        for ionThruster in component.ionThruster {
            spacecraftMass += ionThruster.mass
            spacecraftCost += ionThruster.cost
        }
        
        
        spacecraftMass += component.capsule.mass
        spacecraftCost += component.capsule.cost
        
        
        for sample in component.sample {
            spacecraftMass += sample.mass
        }
        
        spacecraftMass += component.probe.mass
        spacecraftCost += component.probe.cost
        
        
        return (spacecraftMass, spacecraftCost, spacecraftThrust)
    }
    
    var mass: Int {
        return spacecraftCalculations(component: component).spacecraftMass
    }
    
    var cost: Int {
        return spacecraftCalculations(component: component).spacecraftCost
    }
    
    var thrust: Int {
        return spacecraftCalculations(component: component).spacecraftThrust
    }
    
}
