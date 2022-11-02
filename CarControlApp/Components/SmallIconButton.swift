//
//  SmallIconButton.swift
//  CarControlApp
//
//  Created by Berkay Disli on 2.11.2022.
//

import SwiftUI

struct SmallIconButton: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .padding(12)
            .font(.title3)
            .foregroundColor(.white)
            .background(.gray.opacity(0.2))
            .clipShape(Circle())
    }
}

struct SmallIconButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallIconButton(iconName: "lock.fill")
    }
}
