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
    
    var body: some View {
        GeometryReader {
            geometry in
            //            let colWidth = geometry.size.width / 3
            
            TabView {
                NavigationView {
                    VStack() {
                        // NAV
                        SearchBar(text: self.$searchText)
                        List {
                            ForEach(self.cars.filter {
                                self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                            }, id: \.self) { car in
                                Text(car)
                            }
                        }
                        .navigationBarTitle(Text("Vilnius"))
                    }
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                NavigationView {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<10) {
                                Text("Item \($0)")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 200)
                                    .background(Color.red)
                            }
                        }
                    }
                    .frame(height: 350)
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Objects")
                }
                
                NavigationView {
                    VStack {
                        Text("asd")
                    }
                }
                .tabItem {
                    Image(systemName: "camera")
                    Text("Camera")
                }
                
                NavigationView {
                    VStack {
                        Text("asd")
                    }
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
    }
}
