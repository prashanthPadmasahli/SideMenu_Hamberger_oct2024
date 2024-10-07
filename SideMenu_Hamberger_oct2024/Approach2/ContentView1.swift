//
//  ContentView1.swift
//  SideMenu_Hamberger_oct2024
//
//  Created by mac on 04/10/24.
//

import SwiftUI

struct ContentView1: View {
    @State var showMenu = false
    @State var selectedOption: SideMenuOptionModel = .dashboard
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedOption) {
                    switch selectedOption {
                    case .dashboard:
                        Text("Dashboard")
                    case .performance:
                        Text("Performance")
                    case .profile:
                        Text("Profile")
                    case .search:
                        Text("Search")
                    case .notification:
                        Text("Notification")
                    }
                }
                SideMenuView(isShowing: $showMenu, selectedOption: $selectedOption)
            }
            .toolbar(showMenu ? .hidden: .visible, for: .navigationBar)
            .navigationTitle(selectedOption.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView1()
}
