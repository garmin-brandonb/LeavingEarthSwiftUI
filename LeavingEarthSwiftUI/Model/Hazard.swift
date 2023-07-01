//
//  Hazard.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Hazard {
    let type: HazardType
    let probability: Double
    let severity: Int
    let effect: String
}

enum HazardType {
    case radiation, micrometeoroids, weather, technicalFailure
}


