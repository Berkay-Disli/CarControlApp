//
//  Controls.swift
//  CarControlApp
//
//  Created by Berkay Disli on 2.11.2022.
//

import Foundation

class Control {
    let title: String
    let iconName: String
    var subtitle: String?
    
    init(title: String, iconName: String, subtitle: String? = nil) {
        self.title = title
        self.iconName = iconName
        self.subtitle = subtitle
    }
}

enum Controls: CaseIterable {
    case charging
    case fan
    case media
    case chargingPort
    case trunk
    case summon
    case controls
    case climate
    case location
    case security
    case updates
    
    var data: Control {
        switch self {
        case .charging:
            return Control(title: "charging", iconName: "bolt.fill")
        case .fan:
            return Control(title: "Fan On", iconName: "fanblades.fill")
        case .media:
            return Control(title: "Media Controls", iconName: "playpause.fill")
        case .chargingPort:
            return Control(title: "Charge Port", iconName: "bolt.car.fill")
        case .trunk:
            return Control(title: "Trunk", iconName: "chevron.up.square.fill")
        case .summon:
            return Control(title: "Summon", iconName: "figure.wave.circle.fill")
        case .controls:
            return Control(title: "Controls", iconName: "car.fill")
        case .climate:
            return Control(title: "Climate", iconName: "fanblades.fill", subtitle: "Interior 22 °C")
        case .location:
            return Control(title: "Location", iconName: "location.fill", subtitle: "Emirgan")
        case .security:
            return Control(title: "Security", iconName: "checkerboard.shield", subtitle: "0 Threats")
        case .updates:
            return Control(title: "Upgrades", iconName: "wand.and.stars", subtitle: "Available")
        }
    }
    
}
