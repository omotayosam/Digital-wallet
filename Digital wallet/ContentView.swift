//
//  ContentView.swift
//  Digital wallet
//
//  Created by omotayo ayomide on 14/04/2024.
//

import SwiftUI

struct ContentView: View {
    // State variable to keep track of the selected tab
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                // Tab 1
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(selectedTab == 0 ? .customPurple : .gray)
                    }
                    .tag(0)
                
                // Tab 2
                Text("Tab 2")
                    .tabItem {
                        Image(systemName: "circle.grid.2x2")
                            .foregroundColor(selectedTab == 1 ? .customPurple : .gray)
                        
                    }
                    .tag(1)
                
                // Tab 3
                Text("Tab 3")
                    .tabItem {
                        Image(systemName: "chart.pie")
                            .foregroundColor(selectedTab == 2 ? .customPurple : .gray)
                        
                    }
                    .tag(2)
                Text("Tab 4")
                    .tabItem {
                        Image(systemName: "gear")
                            .foregroundColor(selectedTab == 3 ? .customPurple : .gray)
                        
                    }
                    .tag(3)
            }
            .onAppear(){
                UITabBar.appearance().backgroundColor = .white
            }
            .tint(.customPurple)
            
            //.navigationBarTitle("Bottom Navigation")
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
