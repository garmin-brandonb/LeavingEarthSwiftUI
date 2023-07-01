//
//  Rocket.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Rocket: Hashable {
    let type: RocketType
    
    var mass: Int {
        switch type {
        case .Juno:
            return 1
        case .Atlas:
            return 4
        case .Soyuz:
            return 9
        case .Saturn:
            return 20
        }
    }
    
    var thrust: Int {
        switch type {
        case .Juno:
            return 4
        case .Atlas:
            return 27
        case .Soyuz:
            return 80
        case .Saturn:
            return 200
        }
    }
    
    var cost: Int {
        switch type {
        case .Juno:
            return 1
        case .Atlas:
            return 5
        case .Soyuz:
            return 8
        case .Saturn:
            return 15
        }
    }
    
    var maxPayload: [Double] {
        switch type {
        case .Juno:
            return [3.0,1.0,0.33]
        case .Atlas:
            return [23.0,9.0,5.0,2.75,1.4,0.5]
        case .Soyuz:
            return [71.0,31.0,17.667,11.0,7.0,4.33,2.429]
        case .Saturn:
            return [180.0,80.0,46.667,30.0,20.0,13.333,8.571,5.0,2.222]
            
        }
    }
}

enum RocketType: String, CaseIterable {
    case Juno = "Juno"
    case Atlas = "Atlas"
    case Soyuz = "Soyuz"
    case Saturn = "Saturn"
}
