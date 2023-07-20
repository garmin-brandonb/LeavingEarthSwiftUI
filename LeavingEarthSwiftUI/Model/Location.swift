//
//  Location.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Location {
    let name: ManeuverNames
    
    func getLocationData(name:ManeuverNames) -> (difficulty: [ManeuverNames: Int], time: [ManeuverNames: Int]) {
        var difficulty: [ManeuverNames:Int] = [:]
        var time: [ManeuverNames:Int] = [:]
        //var hazards: Hazard? = nil
        //var exploration: ExplorationType? = nil
        
        switch name {
        case .Earth:
            difficulty = [ManeuverNames.EarthOrbit: 8,
                          ManeuverNames.SuborbitalFlight: 3]
            
        case .SuborbitalFlight:
            difficulty = [ManeuverNames.Earth: 0,
                          ManeuverNames.EarthOrbit: 5]
            
        case .EarthOrbit:
            difficulty = [ManeuverNames.Earth: 0,
                          ManeuverNames.LunarOrbit: 3,
                          ManeuverNames.LunarFlyBy:1,
                          ManeuverNames.MarsOrbit: 5,
                          ManeuverNames.MarsFlyBy: 3,
                          ManeuverNames.Inner: 3,
                          ManeuverNames.Outer: 6]
            
            time = [ManeuverNames.LunarOrbit: 1,
                    ManeuverNames.LunarFlyBy: 1,
                    ManeuverNames.MarsOrbit: 3,
                    ManeuverNames.MarsFlyBy: 3,
                    ManeuverNames.Inner: 1,
                    ManeuverNames.Outer: 1]
            
            
            
        case .Moon:
            difficulty = [ManeuverNames.LunarOrbit: 2]
            
        case .LunarFlyBy:
            difficulty = [ManeuverNames.EarthOrbit: 1,
                          ManeuverNames.LunarOrbit: 2,
                          ManeuverNames.Moon: 4,
                          ManeuverNames.Lost: 0]

        case .LunarOrbit:
            difficulty = [ManeuverNames.EarthOrbit: 3,
                          ManeuverNames.Moon: 2]
            
        case .Inner:
            difficulty = [ManeuverNames.EarthOrbit: 3,
                          ManeuverNames.MercuryFlyBy: 5,
                          ManeuverNames.VenusFlyBy: 2,
                          ManeuverNames.VenusOrbit: 3,
                          ManeuverNames.Ceres: 5,
                          ManeuverNames.MarsOrbit: 4]
            
        case .VenusFlyBy:
            difficulty = [ManeuverNames.VenusOrbit: 1,
                          ManeuverNames.Venus: 1,
                          ManeuverNames.Lost: 0]
            
        case .VenusOrbit:
            difficulty = [ManeuverNames.Inner: 3,
                          ManeuverNames.Outer: 9,
                          ManeuverNames.Venus: 0]
            
        case .Venus:
            difficulty = [ManeuverNames.VenusOrbit: 6]
            
        case .Ceres:
            difficulty = [ManeuverNames.Inner: 5,
                          ManeuverNames.Outer: 3]
            
        case .MarsFlyBy:
            difficulty = [ManeuverNames.MarsOrbit: 3,
                          ManeuverNames.Mars: 3,
                          ManeuverNames.Lost: 0]
            
        case .MarsOrbit:
            difficulty = [ManeuverNames.Mars: 0,
                          ManeuverNames.Phobos: 1,
                          ManeuverNames.Outer: 5,
                          ManeuverNames.Inner: 4,
                          ManeuverNames.EarthOrbit: 5]
            
        case .Mars:
            difficulty = [ManeuverNames.MarsOrbit: 3]
            
        case .Phobos:
            difficulty = [ManeuverNames.MarsOrbit: 1]
            
        case .MercuryFlyBy:
            difficulty = [ManeuverNames.MercuryOrbit: 2,
                          ManeuverNames.Mercury: 4,
                          ManeuverNames.Lost: 0]
            
        case .MercuryOrbit:
            difficulty = [ManeuverNames.Mercury: 2,
                          ManeuverNames.Inner: 7]
            
        case .Mercury:
            difficulty = [ManeuverNames.MercuryOrbit: 2]
            
        case .Outer:
            difficulty = [ManeuverNames.Outer: 0]
            
        case .Lost:
            difficulty = [ManeuverNames.Lost: 0]
        }
        
        return (difficulty, time)
        
    }
    
    var manueverDifficulty: [ManeuverNames:Int] {
        return getLocationData(name: name).difficulty
    }
    
    var maneuverTime: [ManeuverNames: Int] {
        return getLocationData(name: name).time
    }
    
}

enum ExplorationType {
    case emtpy, spacecraftDestroyed, minerals, supplies, sicknessRadiation, life, alienOrigin
}

enum ManeuverNames: String, CaseIterable {
    case Earth = "Earth"
    case SuborbitalFlight = "Suborbital Flight"
    case EarthOrbit = "Earth Orbit"
    case LunarFlyBy = "Lunar Fly-By"
    case LunarOrbit = "Lunar Orbit"
    case Moon = "Moon"
    case Inner = "Inner"
    case Outer = "Outer"
    case VenusFlyBy = "Venus Fly-By"
    case MarsOrbit = "Mars Orbit"
    case MarsFlyBy = "Mars Fly-By"
    case Mars = "Mars"
    case Ceres = "Ceres"
    case VenusOrbit = "Venus Orbit"
    case Venus = "Venus"
    case Phobos = "Phobos"
    case MercuryFlyBy = "Mercury Fly-By "
    case MercuryOrbit = "Mercury Orbit"
    case Mercury = "Mercury"
    case Lost = "Lost"
}
