//
//  GameDataView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 7/5/23.
//

import SwiftUI

struct GameDataView: View {
    var gameData: GameData
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total")
                Text("Total")
                Text("Required")
            }
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "scalemass.fill")
                    Text("\(gameData.totalMass)")
                }
                HStack {
                    Image(systemName: "arrowshape.up.fill")
                    Text("\(gameData.totalThrust)")
                }
                HStack {
                    Image(systemName: "arrowshape.up.fill")
                    Text("\(gameData.thrustRequired(totalMass: gameData.totalMass, maneuverDifficulty: gameData.maneuverDifficulty))")
                }
            }
        }
    }
}

struct GameDataView_Previews: PreviewProvider {
    static var previews: some View {
        GameDataView(gameData: GameData(location: LocationData(selectedLocation: .EarthOrbit)))
    }
}
