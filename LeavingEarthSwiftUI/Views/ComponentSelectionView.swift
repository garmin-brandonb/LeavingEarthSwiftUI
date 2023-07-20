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
    @Binding var location: LocationData

    var body: some View {
        HStack {
            if componentData.isComponentSelected {
                ComponentRowView(name: componentData.selectedComponent ?? "", mass: componentData.mass ?? 0, thrust: componentData.thrust ?? 0, action: {})
            } else {
                AddButtonView(systemName: "plus.circle", text: "Select Component") {
                    componentData.showComponentsModal = true
                    componentData.isComponentSelected = true
                    location.components.append(ComponentData())
                }
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
        ComponentSelectionView(componentData: .constant(ComponentData(selectedComponent: "Juno", isComponentSelected: false, mass: 9, thrust: 80)), location: .constant(LocationData()))
    }
}
