//
//  gameData.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 7/1/23.
//

import Foundation

struct GameData {
    var location: LocationData
        
    var totalMass: Int {
        var sum = 0
            for component in location.components {
                sum += component.mass ?? 0
            }
        return sum
    }
    
    var totalThrust: Int {
        var sum = 0
            for component in location.components {
                sum += component.thrust ?? 0
            }
        return sum
    }
    
    var maneuverDifficulty: Int {
        var value: Int = 0
            value = location.maneuverDifficulty ?? 0
        return value
    }
    
    
    func thrustRequired(totalMass: Int, maneuverDifficulty: Int) -> Int {
        return totalMass * maneuverDifficulty
    }
    
}


