//
//  TestView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/30/23.
//

import SwiftUI

struct TestView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]

        var body: some View {
            VStack {
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                }
                Button(action: {
                    items.append("New Item")
                }) {
                    Text("Add Item")
                }
            }
        }
}

#Preview {
    TestView()
}
