//
//  LocationsSelectionView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 7/1/23.
//

import SwiftUI

struct LocationData: Identifiable {
    var id = UUID()
    var showLocationModal: Bool = false
    var isLocationSelected: Bool = false
    var maneuverDifficulty: Int? = nil
    var selectedLocation: ManeuverNames? = nil
//    var components: [ComponentData] = []
    var components: [ComponentData] = [ComponentData()] 
}

struct LocationsSelectionView: View {
    @Binding var locationData: LocationData
    
    var body: some View {
        HStack {
            Button(locationData.selectedLocation?.rawValue ?? "Select Maneuver") {
                locationData.showLocationModal = true
                locationData.isLocationSelected = true
            }
            .font(.custom("NasalizationRg-Regular", size: 17))
            Spacer()
            if locationData.isLocationSelected {
                Image(systemName: "drop")
                    .font(.system(size: 20))
                NasaTextView(text: String(locationData.maneuverDifficulty ?? 0), size: 20)
            }
        }
        .sheet(isPresented: $locationData.showLocationModal, content: {
            LocationsView(showModal: $locationData.showLocationModal, selectedManeuver: $locationData.selectedLocation, maneuverDifficulty: $locationData.maneuverDifficulty)
        })
    }
}

#Preview {
    LocationsSelectionView(locationData: .constant(LocationData()))
}
