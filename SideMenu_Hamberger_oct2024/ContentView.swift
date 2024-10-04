//
//  ContentView.swift
//  SideMenu_Hamberger_oct2024
//
//  Created by mac on 03/10/24.
//

import SwiftUI

enum Screen {
    case screen1
    case screen2
    case screen3
    case screen4
}

struct ContentView: View {
    @State var showMenu = false
    @State var screenNumber: Screen?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack {
                Color.yellow
                    .ignoresSafeArea(edges: .all)
                
                switch screenNumber {
                case .screen1:
                    Text("screen 1")
                case .screen2:
                    Text("screen 2")
                case .screen3:
                    Text("screen 3")
                case .screen4:
                    Text("screen 4")
                case nil:
                    Text("Home")
                }
            }
            
            MenuButton {
                showMenu.toggle()
            }
            
            List {
                Section {
                    CustomButton(title: "Item 1") {
                        screenNumber = .screen1
                    }
                    
                    CustomButton(title: "Item 2") {
                        screenNumber = .screen2
                    }
                } header: {
                    Text("Section 1")
                        .foregroundStyle(.white)
                }
                
                Section {
                    CustomButton(title: "Item 3") {
                        screenNumber = .screen3
                    }
                    
                    CustomButton(title: "Item 4") {
                        screenNumber = .screen4
                    }
                } header: {
                    Text("Section 2")
                        .foregroundStyle(.white)
                }
            }
            .scrollContentBackground(.hidden)
            .background(.indigo)
            .frame(width: 200)
            .offset(x: showMenu ? 0 : -200)
            .animation(.easeInOut(duration: 0.5), value: showMenu)
        }
        .onTapGesture {
            showMenu = false
        }
    }
}

#Preview {
    ContentView()
}


struct CustomButton: View {
    let title: String
    var action: ()-> Void
    
    var body: some View {
        Button(title) {
            action()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct MenuButton: View {
    var action: ()-> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: "line.3.horizontal")
        })
        .font(.title)
        .padding()
    }
}
