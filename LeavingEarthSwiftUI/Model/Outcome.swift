//
//  Outcome.swift
//  LeavingEarth
//
//  Created by Brandon on 3/3/23.
//

import Foundation

struct Outcome {
    let outcome: OutcomeType
    let cost: Int
    let outcomeEffect: String
}

enum OutcomeType {
    case majorFailure, minorFailure, Success
}


