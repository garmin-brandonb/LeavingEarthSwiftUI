//
//  TestViewFile.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 5/4/23.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var data: DataItem
}

struct DataItem: Identifiable, Hashable {
    let id = UUID()
    var value: String
}

struct SectionData: Identifiable {
    let id = UUID()
    var title: String
    var items: [Item]
}
