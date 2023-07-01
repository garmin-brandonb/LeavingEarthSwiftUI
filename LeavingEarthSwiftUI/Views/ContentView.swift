//
//  ContentView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 5/2/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var showLocationModal = false
    @State private var showComponentsModal = false
    @State private var selectedLocation: ManeuverNames? = nil
    @State private var selectedComponent: String? = nil
    @State private var maneuverDifficulty: Int? = nil
    @State private var mass: Int? = nil
    @State private var thrust: Int? = nil
    @State private var isLocationSelected: Bool = false
    @State private var isComponentSelected: Bool = false
    @State private var locationData: [LocationData] = [LocationData()]
    @State private var componentParameters: [ComponentData] = [ComponentData()]
    @State private var sections: [[ComponentData]] = [[ComponentData()]]
//    @State private var sections: [[ObservableObject]] = [[LocationData(), ComponentData()]]

    
    var body: some View {
        VStack {
            Text("Leaving Earth Mission Planner")
                .font(.custom("NasalizationRg-Regular", size: 17))
            List {
                ForEach(0..<sections.count, id: \.self) { sectionIndex in
                    Section(header: LocationsSelectionView(locationData: $locationData[sectionIndex]))
                    {
                        ForEach(0..<sections[sectionIndex].count, id: \.self) { index in
                            ComponentSelectionView(componentData: $sections[sectionIndex][index])
                        }
                        Button {
                            sections[sectionIndex].append(ComponentData())
                        } label: {
                            AddButtonView(systemName: "plus.circle")
                        }
                    }
                }
            }
            Button("Add Maneuver") {
                sections.append([ComponentData()])
            }
            .font(.custom("NasalizationRg-Regular", size: 17))
        }
    }
}

#Preview {
    ContentView()
}
