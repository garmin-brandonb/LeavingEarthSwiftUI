//
//  Probe.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Probe {
    let type: ProbeType
    
    var mass: Int {
        return 1
    }
    
    var cost: Int {
        return 2
    }
}

enum ProbeType {
    case probe
}
