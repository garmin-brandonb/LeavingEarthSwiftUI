//
//  Components.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Components {
    // will likely have optionals
    var rocket: [Rocket]
    var ionThruster: [IonThruster]
    var capsule: Capsule
    var sample: [Sample]
    var probe: Probe
    var astronaut: [Astronaut]
    var supplies: [Supplies]
}

enum ComponentTypes: String, CaseIterable {
    case rocket = "Rocket"
    case ionThruster = "Ion Thruster"
    case capsule = "Capsule"
    case sample = "Sample"
    case probe = "Probe"
    case astronaut = "Astronaut"
    case supplies = "Supplies"
}

enum SampleType {
    case venus
    case ceres
    case mars
    case mercury
    case moon
    case phobos
}

enum IonThrusterType: String, CaseIterable {
    case ionThruster = "Ion Thruster"
}


struct IonThruster {
    let type: IonThrusterType
    
    var mass: Int {
        return 1
    }
    
    var cost: Int {
        return 10
    }
    
    var thrust: Int {
        return 5
    }
}


struct Sample {
    let type: SampleType
    
    var mass: Int {
        return 1
    }
}

struct Supplies {
    var mass: Int {
        return 1
    }
}

