//
//  ContentView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 5/2/23.
//

import SwiftUI

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
    @State private var componentParameters: [ComponentParameters] = [ComponentParameters()]
    @State private var sections: [[ComponentParameters]] = [[ComponentParameters()]]
        

    
    var body: some View {
        VStack {
            Text("Leaving Earth Mission Planner")
                .font(.custom("NasalizationRg-Regular", size: 17))
            List {
                ForEach(0..<sections.count, id: \.self) { sectionIndex in
                    Section(header:
                                HStack {
                        Button(selectedLocation?.rawValue ?? "Select Maneuver") {
                            showLocationModal = true
                            isLocationSelected = true
                        }
                        .font(.custom("NasalizationRg-Regular", size: 17))
                        Spacer()
                        if isLocationSelected {
                            Image(systemName: "drop")
                                .font(.system(size: 20))
                            NasaTextView(text: String(maneuverDifficulty ?? 0), size: 20)
                        }
                    })
                    {
                        ForEach(0..<sections[sectionIndex].count, id: \.self) { index in
                            ComponentSelectionView(componentParameters: $sections[sectionIndex][index])
                        }
                        Button {
                            sections[sectionIndex].append(ComponentParameters())
                        } label: {
                            AddButtonView(systemName: "plus.circle")
                        }
                }
                }
            }
            Button("Add Maneuver") {
                sections.append([ComponentParameters(isComponentSelected: false)])
            }
            .font(.custom("NasalizationRg-Regular", size: 17))
        }
        .sheet(isPresented: $showLocationModal, content: {
            LocationsView(showModal: $showLocationModal, selectedManeuver: $selectedLocation, maneuverDifficulty: $maneuverDifficulty)
        })
        .sheet(isPresented: $showComponentsModal, content: {
            ComponentsView(showModal: $showComponentsModal, selectedComponent: $selectedComponent, mass: $mass, thrust: $thrust)
        })
    }
}

#Preview {
    ContentView()
}
