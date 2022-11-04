//
//  ControlsViewModel.swift
//  CarControlApp
//
//  Created by Berkay Disli on 2.11.2022.
//

import Foundation

class ControlsViewModel: ObservableObject {
    @Published var quickShortcuts: [Controls] = [.charging, .fan, .media, .chargingPort]
    @Published var recentActions: [Controls] = [.trunk, .fan, .summon]
    @Published var allSettings: [Controls] = [.controls, .climate, .location, .security, .updates]
    #warning("->All Settings have to be a higher hierarchy struct")
}
