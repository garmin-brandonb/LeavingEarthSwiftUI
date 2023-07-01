//
//  Astronaut.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Astronaut {
    let type: AstronautType
    
    var cost: Int {
        return 5
    }
}

enum AstronautType {
    case pilot
    case doctor
    case mechanic
}
