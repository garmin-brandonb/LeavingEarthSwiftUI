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
            .font(.custom("NasalizationRg-Regular", size: 16))
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "scalemass.fill")
                    Text("\(gameData.totalMass)")
                    Text("(\(gameData.totalPayload)) Payload")
                        .padding(.horizontal, 5)
                }
                HStack {
//                    Image(systemName: "arrowshape.up.fill")
                    Image(systemName: "arrowshape.left.fill")
                        .rotationEffect(Angle(degrees: 90))
                    Text("\(gameData.totalThrust)")
                }
                HStack {
//                    Image(systemName: "arrowshape.up.fill")
                    Image(systemName: "arrowshape.left.fill")
                        .rotationEffect(Angle(degrees: 90))
                    Text("\(gameData.thrustRequired(totalMass: gameData.totalMass, maneuverDifficulty: gameData.maneuverDifficulty))")
                }
            }
            .font(.custom("NasalizationRg-Regular", size: 16))
        }
    }
}

struct GameDataView_Previews: PreviewProvider {
    static var previews: some View {
        GameDataView(gameData: GameData(location: LocationData(selectedLocation: .EarthOrbit)))
    }
}
