//
//  ContentView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //    init() {
    //        //Use this if NavigationBarTitle is with Large Font
    //        UINavigationBar.appearance().backgroundColor = UIColor(red: 118/255, green: 118/225, blue: 128/225, alpha: 0.12)
    //
    //        //Use this if NavigationBarTitle is with displayMode = .inline
    //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    //    }
    
    let cars = ["Subaru WRX", "Tesla Model 3",
                "Porsche 911", "Renault Zoe", "DeLorean"]
    @State private var searchText : String = ""
    @State private var modelData = ModelData()
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        
        
        GeometryReader {
            geometry in
            //            let colWidth = geometry.size.width / 3
            
            TabView {
                NavigationView {
                    VStack() {
                        CategoryHome()
                            .tabItem {
                                Image(systemName: "star")
                                Text("Featured")
                        }
                        .tag(Tab.featured)
                        .environmentObject(ModelData())
                            
                            
                        .navigationBarTitle(Text("Vilnius"))
                    }
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                NavigationView {
                    LandmarkList()
                        .environmentObject(ModelData())
                        .navigationBarTitle("Objects")
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Objects")
                }
                
                NavigationView {
                    ARViewContainer()
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
                .navigationBarTitle(Text("Object map"), displayMode: .inline)
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
            .environmentObject(ModelData())
    }
}
