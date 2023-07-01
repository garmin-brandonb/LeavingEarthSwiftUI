//
//  AddButtonView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/30/23.
//

import SwiftUI

struct AddButtonView: View {
    var systemName: String
    
    var body: some View {
        
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 14, height: 14)
    }
}

#Preview {
    AddButtonView(systemName: "plus.circle")
}


