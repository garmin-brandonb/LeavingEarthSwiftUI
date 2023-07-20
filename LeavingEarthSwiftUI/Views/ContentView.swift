//
//  ContentView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 5/2/23.
//

import SwiftUI

//struct ContentView: View {
//    @State private var locations: [LocationData] = [LocationData()]
//    @State private var componentData: ComponentData = ComponentData()
//    @State private var showLocationsModal = false
//
//    var body: some View {
//        VStack {
//            Text("""
//                Leaving Earth
//                Mission Planner
//                """)
//            .font(.custom("NasalizationRg-Regular", size: 17))
//            .multilineTextAlignment(.center)
//            List {
//                ForEach(Array(locations.enumerated()), id: \.element.id) { (index, location) in
//                    Section(header: LocationsSelectionView(locationData: $locations[index])) {
//                        ForEach(Array(location.components.enumerated()), id: \.element.id) { (componentIndex, component) in
//                            ComponentSelectionView(componentData: $locations[index].components[componentIndex], location: $locations[index])
//                        }
//                        .onDelete { offsets in
//                            onDeleteComponents(offsets: offsets, locationIndex: index)
//                        }
//
//                        if index >= 1 {
//                            GameDataView(gameData: GameData(location: locations[index], totalPayload: addPayload(locationIndex: index)))
//                        } else {
//                            GameDataView(gameData: GameData(location: locations[index]))
//                        }
//                    }
//                }
//                .onDelete { indexSet in
//                    onDeleteSections(indexSet: indexSet)
//                }
//            }
//            AddButtonView(systemName: "plus.circle", text: "Add Maneuver", action: {
//                locations.append(LocationData())
//                showLocationsModal = true
//            })
//            .sheet(isPresented: $showLocationsModal, content: {
//                if let selectedLocation = $locations.last?.selectedLocation, let maneuverDifficulty = $locations.last?.maneuverDifficulty {
//                    LocationsView(showModal: $showLocationsModal, selectedManeuver: selectedLocation, maneuverDifficulty: maneuverDifficulty)
//                }
//            })
//        }
//    }
//
//    private func addPayload(locationIndex: Int) -> Int {
//        var payloadMass: Int = 0
//
//        for index in 0..<locationIndex {
//            payloadMass += GameData(location: locations[index]).totalMass
//        }
//        return payloadMass
//    }
//
//    private func onDeleteComponents(offsets: IndexSet, locationIndex: Int) {
//        locations[locationIndex].components.remove(atOffsets: offsets)
//    }
//
//    private func onDeleteSections(indexSet: IndexSet) {
//        locations.remove(atOffsets: indexSet)
//    }
//}



struct ContentView: View {
    @State private var locations: [LocationData] = [LocationData()]
    @State private var showLocationsModal = false
    @State private var selectedManeuver: ManeuverNames?
    @State private var maneuverDifficulty: Int?

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
                    Section(header: LocationsSelectionView(locationData: $locations[locationIndex], text: "Select Maneuver")) {
                        ForEach(0..<locations[locationIndex].components.count, id: \.self) { componentIndex in
                            ComponentSelectionView(componentData: $locations[locationIndex].components[componentIndex], location: $locations[locationIndex])
                        }
                        .onDelete { offsets in
                            onDelete(offsets: offsets, locationIndex: locationIndex)
                        }

                        if locationIndex >= 1 {
                            GameDataView(gameData: GameData(location: locations[locationIndex], totalPayload: addPayload(locationIndex: locationIndex)))
                        } else {
                            GameDataView(gameData: GameData(location: locations[locationIndex]))
                        }
                    }
                }
            }
            AddButtonView(systemName: "plus.circle", text: "Add Maneuver", action: {
                locations.append(LocationData())
                showLocationsModal = true
            })

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

