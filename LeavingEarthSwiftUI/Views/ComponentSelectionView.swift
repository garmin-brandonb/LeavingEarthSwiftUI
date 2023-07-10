//
//  ComponentSelectionView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/30/23.
//

import SwiftUI

struct ComponentData: Identifiable {
    var id = UUID()
    var selectedComponent: String? = nil
    var showComponentsModal: Bool = false
    var isComponentSelected: Bool = false
    var mass: Int? = nil
    var thrust: Int? = nil
}

struct ComponentSelectionView: View {
    @Binding var componentData: ComponentData

    var body: some View {
        HStack {
            ComponentRowView(name: componentData.selectedComponent ?? "Select Component", action: {
                componentData.showComponentsModal = true
                componentData.isComponentSelected = true
            })
            if componentData.isComponentSelected {
                ComponentRowView(mass: componentData.mass ?? 0, thrust: componentData.thrust ?? 0, action: {})
            }
        }
        .sheet(isPresented: $componentData.showComponentsModal, content: {
            ComponentsView(showModal: $componentData.showComponentsModal, selectedComponent: $componentData.selectedComponent, mass: $componentData.mass, thrust: $componentData.thrust)
        })
    }
}


//#Preview {
//    ComponentSelectionView(componentData: .constant(ComponentData()))
//}

struct ComponentSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentSelectionView(componentData: .constant(ComponentData(selectedComponent: "Juno", mass: 9, thrust: 80)))
    }
}
