//
//  NasaTextView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/26/23.
//

import SwiftUI

struct NasaTextView: View {
    var text: String
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.custom("NasalizationRg-Regular", size: size))
    }
}

#Preview {
    NasaTextView(text: "NASA", size: 30)
}

