//
//  SmallIconButtonWithText.swift
//  CarControlApp
//
//  Created by Berkay Disli on 2.11.2022.
//

import SwiftUI

struct SmallIconButtonWithText: View {
    let text: String
    let iconName: String
    var body: some View {
        VStack {
            SmallIconButton(iconName: iconName)
            Text(text.capitalized)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(width: 65)
                
        }
    }
}

struct SmallIconButtonWithText_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
