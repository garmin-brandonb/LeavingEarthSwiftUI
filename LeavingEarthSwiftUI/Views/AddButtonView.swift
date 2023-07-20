//
//  AddButtonView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/30/23.
//

import SwiftUI

struct AddButtonView: View {
    var systemName: String
    var text: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            HStack {
                Image(systemName: systemName)
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 14, height: 14)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                NasaTextView(text: text, size: 17)
                    .foregroundColor(.black)
            }
        }
    }
}

//#Preview {
//    AddButtonView(systemName: "plus.circle")
//}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(systemName: "plus.circle", text: "Add Component", action: {})
    }
}

