//
//  Home.swift
//  CarControlApp
//
//  Created by Berkay Disli on 2.11.2022.
//

import SwiftUI

struct Home: View {
    @StateObject var controlsVM = ControlsViewModel()
    @State private var columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
    @State private var highlightAllSettings = false
    
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
                        ScrollViewReader { scrollProxy in
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
                                    .id("topLine")
                                    
                                    Image("renault")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 250)
                                        .offset(x: 18)
                                }
                                .padding(.top, 12)
                                
                                Divider()
                                
                                // Quick Controls
                                QuickControlSection(title: "Quick Shortcuts", editable: true, controlsList: controlsVM.quickShortcuts)
                                
                                // Recent Actions
                                QuickControlSection(title: "Recent Actions", editable: false, controlsList: controlsVM.recentActions)
                                
                                // All Settings
                                VStack(alignment: .leading) {
                                    HStack(alignment: .center) {
                                        Text("All Settings")
                                            .font(.system(size: 25))
                                            .fontWeight(.medium)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                        
                                    }
                                    
                                    LazyVGrid(columns: columns, spacing: 12) {
                                        ForEach(controlsVM.allSettings, id:\.self) { item in
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                    .fill(highlightAllSettings ? .blue:.gray.opacity(0.2))
                                                    
                                                HStack {
                                                    Image(systemName: item.data.iconName)
                                                        .font(.title)
                                                    
                                                    VStack(alignment: .leading, spacing: 2) {
                                                        Text(item.data.title)
                                                        if let subtitle = item.data.subtitle {
                                                            Text(subtitle.uppercased())
                                                                .font(.caption2)
                                                                .fontWeight(.regular)
                                                                .foregroundColor(highlightAllSettings ? .black:.gray)
                                                        }
                                                    }
                                                    Spacer()
                                                    Image(systemName: "chevron.right")
                                                        .fontWeight(.regular)
                                                        .foregroundColor(.gray)
                                                }
                                                .fontWeight(.medium)
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 100)
                                        }
                                    }
                                }
                                .padding(.horizontal).padding(.top, 12)
                                .padding(.bottom)
                                .id("bottomLine")
                                
                                
                                Spacer()
                            }
                            
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.easeInOut) {
                                        scrollProxy.scrollTo("bottomLine", anchor: .bottom)
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    withAnimation(.easeInOut) {
                                        highlightAllSettings.toggle()
                                    }
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                    withAnimation(.easeInOut) {
                                        highlightAllSettings.toggle()
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    withAnimation(.easeInOut) {
                                        scrollProxy.scrollTo("topLine", anchor: .bottom)
                                    }
                                }
                            }
                            
                            #warning("Add Highlight Settings")
                            
                            
                            
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
