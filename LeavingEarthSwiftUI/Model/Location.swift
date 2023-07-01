//
//  Location.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Location {
    let name: ManeuverNames
    
    func getLocationData(name:ManeuverNames) -> [ManeuverNames:Int] {
        var difficulty: [ManeuverNames:Int]
        //var time: Int
        //var hazards: Hazard? = nil
        //var exploration: ExplorationType? = nil
        
        switch name {
        case .Earth:
            difficulty = [ManeuverNames.EarthOrbit: 8,
                                  ManeuverNames.SuborbitalFlight: 3]
            return difficulty
            
        case .SuborbitalFlight:
            difficulty = [ManeuverNames.Earth: 0,
                                  ManeuverNames.EarthOrbit: 5]
            return difficulty
            
        case .EarthOrbit:
            difficulty = [ManeuverNames.Earth: 0,
                                  ManeuverNames.LunarOrbit: 3,
                                  ManeuverNames.LunarFlyBy:1,
                                  ManeuverNames.MarsOrbit: 5,
                                  ManeuverNames.MarsFlyBy: 3,
                                  ManeuverNames.Inner: 3,
                                  ManeuverNames.Outer: 6]
            return difficulty
            
        case .Moon:
            difficulty = [ManeuverNames.LunarOrbit: 2]
            return difficulty
            
        case .LunarFlyBy:
            difficulty = [ManeuverNames.EarthOrbit: 1,
                                  ManeuverNames.LunarOrbit: 2,
                                  ManeuverNames.Moon: 4,
                                  ManeuverNames.Lost: 0]
            return difficulty

        case .LunarOrbit:
            difficulty = [ManeuverNames.EarthOrbit: 3,
                                  ManeuverNames.Moon: 2]
            return difficulty
            
        case .Inner:
            difficulty = [ManeuverNames.EarthOrbit: 3,
                                  ManeuverNames.MercuryFlyBy: 5,
                                  ManeuverNames.VenusFlyBy: 2,
                                  ManeuverNames.VenusOrbit: 3,
                                  ManeuverNames.Ceres: 5,
                                  ManeuverNames.MarsOrbit: 4]
            return difficulty
            
        case .VenusFlyBy:
            difficulty = [ManeuverNames.VenusOrbit: 1,
                                  ManeuverNames.Venus: 1,
                                  ManeuverNames.Lost: 0]
            return difficulty
            
        case .VenusOrbit:
            difficulty = [ManeuverNames.Inner: 3,
                                  ManeuverNames.Outer: 9,
                                  ManeuverNames.Venus: 0]
            return difficulty
            
        case .Venus:
            difficulty = [ManeuverNames.VenusOrbit: 6]
            return difficulty
            
        case .Ceres:
            difficulty = [ManeuverNames.Inner: 5,
                                  ManeuverNames.Outer: 3]
            return difficulty
            
        case .MarsFlyBy:
            difficulty = [ManeuverNames.MarsOrbit: 3,
                                  ManeuverNames.Mars: 3,
                                  ManeuverNames.Lost: 0]
            return difficulty
            
        case .MarsOrbit:
            difficulty = [ManeuverNames.Mars: 0,
                                  ManeuverNames.Phobos: 1,
                                  ManeuverNames.Outer: 5,
                                  ManeuverNames.Inner: 4,
                                  ManeuverNames.EarthOrbit: 5]
            return difficulty
            
        case .Mars:
            difficulty = [ManeuverNames.MarsOrbit: 3]
            return difficulty
            
        case .Phobos:
            difficulty = [ManeuverNames.MarsOrbit: 1]
            return difficulty
            
        case .MercuryFlyBy:
            difficulty = [ManeuverNames.MercuryOrbit: 2,
                                  ManeuverNames.Mercury: 4,
                                  ManeuverNames.Lost: 0]
            return difficulty
            
        case .MercuryOrbit:
            difficulty = [ManeuverNames.Mercury: 2,
                                  ManeuverNames.Inner: 7]
            return difficulty
            
        case .Mercury:
            difficulty = [ManeuverNames.MercuryOrbit: 2]
            return difficulty
            
        case .Outer:
            difficulty = [ManeuverNames.Outer: 0]
            return difficulty
            
        case .Lost:
            difficulty = [ManeuverNames.Lost: 0]
            return difficulty
        }
        
    }
    
    var manueverDifficulty: [ManeuverNames:Int] {
        return getLocationData(name: name)
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
