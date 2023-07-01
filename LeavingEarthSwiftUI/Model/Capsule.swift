//
//  Capsule.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Capsule {
    let type: CapsuleType
//    let astronaut: Astronaut
    
    var mass: Int {
        switch type {
        case .aldrin:
            return 3
        case .eagle:
            return 1
        case .apollo:
            return 3
        case .vostok:
            return 2
        }
    }
    
    var cost: Int {
        switch type {
        case .aldrin:
            return 4
        case .eagle:
            return 4
        case .apollo:
            return 4
        case .vostok:
            return 2
        }
    }
   
    var seats: Int {
        switch type {
        case .aldrin:
            return 8
        case .eagle:
            return 2
        case .apollo:
            return 3
        case .vostok:
            return 1
        }
    }
    
}

enum CapsuleType: String, CaseIterable {
    case vostok = "Vostok"
    case eagle = "Eagle"
    case apollo = "Apollo"
    case aldrin = "Aldrin"
}
