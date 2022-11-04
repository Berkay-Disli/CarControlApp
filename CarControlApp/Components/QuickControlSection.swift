//
//  QuickControlSection.swift
//  CarControlApp
//
//  Created by Berkay Disli on 4.11.2022.
//

import SwiftUI

struct QuickControlSection: View {
    let title: String
    let editable: Bool
    let controlsList: [Controls]
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                if editable {
                    Text("Edit")
                        .foregroundColor(.gray)
                }
            }
            
            HStack(alignment: .top, spacing: 24) {
                ForEach(controlsList, id:\.self) { item in
                    SmallIconButtonWithText(text:item.data.title, iconName: item.data.iconName)
                }
            }
        }
        .padding(.horizontal).padding(.top, 12)
        
        Divider()
            .padding(.top)
    }
}

struct QuickControlSection_Previews: PreviewProvider {
    static var previews: some View {
        QuickControlSection(title: "Ahahd", editable: true, controlsList: [.updates, .security, .location])
    }
}
