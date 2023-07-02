//
//  LocationsView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/24/23.
//

import SwiftUI

struct LocationsView: View {
    @Binding var showModal: Bool
    @Binding var selectedManeuver: ManeuverNames?
    @Binding var maneuverDifficulty: Int?

    var body: some View {
        VStack {
            NasaTextView(text: "Select Maneuver", size: 20)
                .padding()
            List {
                ForEach(ManeuverNames.allCases, id: \.self) { maneuver in
                    let location = Location(name: maneuver)
                    Section(header: NasaTextView(text: "\(maneuver.rawValue)", size: 14)) {
                        ForEach(location.manueverDifficulty.sorted(by: { $0.key.rawValue < $1.key.rawValue }), id: \.key) { maneuver, difficulty in
                            Button(action: {
                                selectedManeuver = maneuver
                                maneuverDifficulty = difficulty
                                showModal.toggle()
                            }) {
                                HStack {
                                    Text(maneuver.rawValue)
                                    Spacer()
                                    Image(systemName: "drop")
                                        .font(.system(size: 20))
                                    Text(String(difficulty))
                                }
                            }
                            .font(.custom("NasalizationRg-Regular", size: 17))
                        }
                    }
                }
            }
        }
        .foregroundColor(.black)
    }
}



//#Preview {
//    LocationsView(showModal: .constant(false), selectedManeuver: .constant(.EarthOrbit), maneuverDifficulty: .constant(8))
//}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(showModal: .constant(false), selectedManeuver: .constant(.EarthOrbit), maneuverDifficulty: .constant(8))
    }
}
