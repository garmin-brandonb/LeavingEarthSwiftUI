//
//  ComponentsView.swift
//  LeavingEarthSwiftUI
//
//  Created by Brandon on 6/26/23.
//

import SwiftUI

struct ComponentsView: View {
    @Binding var showModal: Bool
    @Binding var selectedComponent: String?
    @Binding var mass: Int?
    @Binding var thrust: Int?
    
    var body: some View {
        
        VStack {
            NasaTextView(text: "Select Maneuver", size: 20)
                .padding()
            List {
                // Make into view
                Section(header: NasaTextView(text: ComponentTypes.rocket.rawValue, size: 18)) {
                    ForEach(RocketType.allCases, id: \.self) { rocket in
                        ComponentRowView(name: rocket.rawValue, mass: Rocket(type: rocket).mass, thrust: Rocket(type: rocket).thrust, action: {
                            selectedComponent = rocket.rawValue
                            mass = Rocket(type: rocket).mass
                            thrust = Rocket(type: rocket).thrust
                            showModal.toggle()
                        })
                    }
                }
                
                Section(header: NasaTextView(text: ComponentTypes.capsule.rawValue, size: 18)) {
                    ForEach(CapsuleType.allCases, id: \.self) {capsule in
                        ComponentRowView(name: capsule.rawValue, mass: Capsule(type: capsule).mass, action: {
                            selectedComponent = capsule.rawValue
                            mass = Capsule(type: capsule).mass
                            showModal.toggle()
                        })
                    }
                }
                
                Section(header: NasaTextView(text: ComponentTypes.ionThruster.rawValue, size: 18)) {
                    ComponentRowView(name: ComponentTypes.ionThruster.rawValue, mass: IonThruster(type: .ionThruster).mass, action: {
                        selectedComponent = ComponentTypes.ionThruster.rawValue
                        mass = IonThruster(type: .ionThruster).mass
                        showModal.toggle()
                    })
                }
                
                Section(header: NasaTextView(text: ComponentTypes.probe.rawValue, size: 18)) {
                    ComponentRowView(name: ComponentTypes.probe.rawValue, mass: Probe(type: .probe).mass, action: {
                        selectedComponent = ComponentTypes.probe.rawValue
                        mass = Probe(type: .probe).mass
                        showModal.toggle()
                    })
                }
                
                Section(header: NasaTextView(text: ComponentTypes.sample.rawValue, size: 18)) {
                    ComponentRowView(name: ComponentTypes.sample.rawValue, mass: Sample(type: .mars).mass, action: {
                        selectedComponent = ComponentTypes.sample.rawValue
                        mass = Sample(type: .mars).mass
                        showModal.toggle()
                    })
                }
                
                Section(header: NasaTextView(text: ComponentTypes.supplies.rawValue, size: 18)) {
                    ComponentRowView(name: ComponentTypes.supplies.rawValue, mass: Supplies().mass, action: {
                        selectedComponent = ComponentTypes.supplies.rawValue
                        mass = Supplies().mass
                        showModal.toggle()
                    })
                }
                
            }
        }
    }
}

#Preview {
    ComponentsView(showModal: .constant(false), selectedComponent: .constant("test"), mass: .constant(2), thrust: .constant(5))
}
