//
//  ContentView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 5/2/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var locations: [LocationData] = [LocationData()]

    var body: some View {
        VStack {
            Text("Leaving Earth Mission Planner")
                .font(.custom("NasalizationRg-Regular", size: 17))
            List {
                ForEach(0..<locations.count, id: \.self) { locationIndex in
                    Section(header: LocationsSelectionView(locationData: $locations[locationIndex])) {
                        ForEach(0..<locations[locationIndex].components.count, id: \.self) { componentIndex in
                            ComponentSelectionView(componentData: $locations[locationIndex].components[componentIndex])
                        }
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
        }
    }
}

#Preview {
    ContentView()
}
