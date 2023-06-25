//
//  Dunya_GezginiApp.swift
//  Dunya_Gezgini
//
//  Created by Yunus Emre BOLGÖNÜL on 8.05.2023.
//

import SwiftUI

@main
struct Dunya_GezginiApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        HStack {
                            Image(systemName:"thermometer.medium")
                            Text("Conversion")
                        }
                    }
                MapView()
                    .tabItem {
                        HStack {
                            Image(systemName:"map.fill")
                            Text("Map")
                        }
                    }
            }
            .accentColor(.red)
        }
    }
}

