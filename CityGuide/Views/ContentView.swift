//
//  ContentView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText : String = ""
    @ObservedObject private var modelData = ModelData()
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        
        
        GeometryReader {
            geometry in
            TabView {
                NavigationView {
                    VStack() {
                        CategoryHome()
                            .tabItem {
                                Image(systemName: "star")
                                Text("Featured")
                        }
                        .tag(Tab.featured)
                        .navigationBarTitle(Text("Vilnius"))
                        .environmentObject(ModelData())
                    }
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                NavigationView {
                    LandmarkList()
                     .navigationBarTitle("Objects")
                    }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Objects")
                }
                
                NavigationView {
                    ARContentView()
                        .edgesIgnoringSafeArea(.all)
                }
                .tabItem {
                    Image(systemName: "camera")
                    Text("Camera")
                }
                
                NavigationView {
                    VStack {
                        MapSectionView()
                    }
                .navigationBarTitle(Text("ObjectMap"), displayMode: .inline)
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, Locale(identifier: "lt"))
    }
}
