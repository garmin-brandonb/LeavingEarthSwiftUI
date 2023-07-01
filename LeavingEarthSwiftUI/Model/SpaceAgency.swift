//
//  SpaceAgency.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

// Player data
struct SpaceAgency {
    let name: String
    var score: Int
    var funds: Int
    var advancements: [Advancement]
    var spacecrafts: [Spacecraft]
    var missions: [Mission]
}
