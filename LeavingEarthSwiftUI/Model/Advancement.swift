//
//  Advancement.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Advancement {
    let advancement: AdvancementType
    let cost: Int = 10
    let prerequisites: AdvancementType
    let outcome: Outcome
    
}

enum AdvancementType {
    case junoRocket
    case atlasRocket
    case soyuzeRocket
    case saturnRocket
    case ionThruster
    case rendezvous
    case reentry
    case landing
    case lifeSupport
    case surveying
}


