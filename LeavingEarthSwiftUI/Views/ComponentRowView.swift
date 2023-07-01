//
//  ComponentRowView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/30/23.
//

import SwiftUI

struct ComponentRowView: View {
    
    var name: String?
    var mass: Int?
    var thrust: Int?
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let safeName = name {
                    NasaTextView(text: safeName, size: 18)
                }
                Spacer()
                if thrust == 0 {
                    // don't display anything
                } else {
                    if let safeThrust = thrust {
                        Image(systemName: "arrowshape.up.fill")
                        NasaTextView(text: "\(safeThrust)", size: 16)
                    }
                }
                if let safeMass = mass {
                    Image(systemName: "scalemass.fill")
                    NasaTextView(text: "\(safeMass)", size: 16)
                }
            }
        }
    }
}


#Preview {
    ComponentRowView(name: "Rocket", mass: 2, thrust: 0, action: {})
}
