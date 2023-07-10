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
                        .onDelete { offsets in
                            onDelete(offsets: offsets, locationIndex: locationIndex)
                        }
                        
                        Button {
                            locations[locationIndex].components.append(ComponentData())
                        } label: {
                            AddButtonView(systemName: "plus.circle")
                        }
                        
                        if locationIndex >= 1 {
                            GameDataView(gameData: GameData(location: locations[locationIndex], totalPayload: addPayload(locationIndex: locationIndex)))
                        } else {
                            GameDataView(gameData: GameData(location: locations[locationIndex]))
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
    
    
    private func addPayload(locationIndex: Int) -> Int {
        var payloadMass: Int = 0
        
        for index in 0..<locationIndex {
            payloadMass += GameData(location: locations[index]).totalMass
        }
        return payloadMass
    }
    
    
    private func onDelete(offsets: IndexSet, locationIndex: Int) {
        locations[locationIndex].components.remove(atOffsets: offsets)
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

