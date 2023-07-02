//
//  ContentView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 5/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var locations: [LocationData] = [LocationData()]
    @State private var componentData: ComponentData = ComponentData()
    
    var body: some View {
        let gameData = GameData(locations: locations)
        
        VStack {
            Text("""
                Leaving Earth
                Mission Planner
                """)
                .font(.custom("NasalizationRg-Regular", size: 17))
                .multilineTextAlignment(.center)
            List {
                ForEach(0..<locations.count, id: \.self) { locationIndex in
                    Section(header: LocationsSelectionView(locationData: $locations[locationIndex])) {
                        ForEach(0..<locations[locationIndex].components.count, id: \.self) { componentIndex in
                            ComponentSelectionView(componentData: $locations[locationIndex].components[componentIndex])
                        }
                        VStack {
                            HStack {
                                Text("Total")
                                Image(systemName: "scalemass.fill")
                                Text("\(gameData.totalMass)")
                            }
                            HStack {
                                Text("Total")
                                Image(systemName: "arrowshape.up.fill")
                                Text("\(gameData.totalThrust)")
                            }
                            HStack {
                                Text("Required")
                                Image(systemName: "arrowshape.up.fill")
                                Text("\(gameData.thrustRequired(totalMass: gameData.totalMass, maneuverDifficulty: gameData.maneuverDifficulty))")
                            }
                        }
                            .font(.custom("NasalizationRg-Regular", size: 16))
                        Button {
                            locations[locationIndex].components.append(ComponentData())
                        } label: {
                            AddButtonView(systemName: "plus.circle")
                        }
                    }
                }
            }
            Button("Add Maneuver") {
                locations.append(LocationData())
            }
            .font(.custom("NasalizationRg-Regular", size: 17))
            .foregroundColor(.black)
        }
    }
}

//#Preview {
//    ContentView()
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

