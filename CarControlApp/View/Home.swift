//
//  Home.swift
//  CarControlApp
//
//  Created by Berkay Disli on 2.11.2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").ignoresSafeArea()
                
                // MARK: Main Stack
                VStack(spacing: 0) {
                    // Header
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("Renault")
                                .font(.system(size: 19))
                            
                            Text("Megane E-Tech")
                                .font(.system(size: 33))
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 12) {
                            Button {
                                
                            } label: {
                                SmallIconButton(iconName: "lock.fill")
                            }
                            
                            Button {
                                
                            } label: {
                                SmallIconButton(iconName: "gearshape")
                            }

                        }
                    }
                    .padding()
                    
                    Divider()
                        .padding(.bottom, 4)
                        
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            // Car Main Info View
                            VStack {
                                HStack(alignment: .bottom) {
                                    // Battery
                                    HStack {
                                        Image(systemName: "battery.75")
                                        Text("432 KM ")
                                            .fontWeight(.medium)
                                    }
                                    .foregroundColor(.green)
                                    
                                    Spacer()
                                    
                                    // Current State
                                    VStack(alignment: .trailing) {
                                        Text("Parked")
                                            .fontWeight(.medium)
                                        Text("Last check: 3 min ago")
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal)
                                
                                Image("renault")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width, height: 250)
                                    .offset(x: 18)
                            }
                            .padding(.top, 12)
                            
                            Divider()
                            
                            // Quick Controls
                            QuickControlSection(title: "Quick Shortcuts", editable: true)
                            
                            Divider()
                                .padding(.top)
                            
                            // Recent Actions
                            QuickControlSection(title: "Recent Actions", editable: false)
                            
                            Spacer()
                        }
                    }
                }
                .foregroundColor(Color("fg"))
            }
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct QuickControlSection: View {
    let title: String
    let editable: Bool
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
                ForEach(1...4, id:\.self) { item in
                    SmallIconButtonWithText(text: "Media Controls", iconName: "play.fill")
                }
            }
        }
        .padding(.horizontal).padding(.top, 12)
    }
}
