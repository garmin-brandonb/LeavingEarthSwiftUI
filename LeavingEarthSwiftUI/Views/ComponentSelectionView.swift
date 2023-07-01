//
//  ComponentSelectionView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/30/23.
//

import SwiftUI

struct ComponentParameters {
    var selectedComponent: String? = nil
    var showComponentsModal: Bool = false
    var isComponentSelected: Bool = false
    var mass: Int? = nil
    var thrust: Int? = nil
}

struct ComponentSelectionView: View {
    @Binding var componentParameters: ComponentParameters

    var body: some View {
        HStack {
            ComponentRowView(name: componentParameters.selectedComponent ?? "Select Component", action: {
                componentParameters.showComponentsModal = true
                componentParameters.isComponentSelected = true
            })
            if componentParameters.isComponentSelected {
                ComponentRowView(mass: componentParameters.mass ?? 0, thrust: componentParameters.thrust ?? 0, action: {})
            }
        }
        .sheet(isPresented: $componentParameters.showComponentsModal, content: {
            ComponentsView(showModal: $componentParameters.showComponentsModal, selectedComponent: $componentParameters.selectedComponent, mass: $componentParameters.mass, thrust: $componentParameters.thrust)
        })
    }
}


#Preview {
    ComponentSelectionView(componentParameters: .constant(ComponentParameters()))
}
