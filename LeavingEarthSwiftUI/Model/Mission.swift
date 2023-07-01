//
//  Mission.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Mission {
    let name: String
    let type: MissionType
    let destination: String
    let spacecraft: Spacecraft
    let missionCost: Int
    let timeRequired: Int
    let hazards: [Hazard]
    let difficulty: MissionDifficulty
    let reward: Int
    var accomplished: Bool
}

enum MissionType {
    case probe
    case survey
    case sampleReturn
    case mannedSpaceFlight
    case spaceStation
    case extraterrestrialLife
}

enum MissionDifficulty {
    case easy, medium, hard
}
