//
//  SideMenuView.swift
//  SideMenu_Hamberger_oct2024
//
//  Created by mac on 04/10/24.
//

import SwiftUI

struct SideMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isShowing: Bool
    @Binding var selectedOption: SideMenuOptionModel
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()   // same as Color.Black
                    .ignoresSafeArea()
                    .opacity(0.3)
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) { option in
                                
                                Button(action: {
                                    selectedOption = option
                                    isShowing = false
                                }, label: {
                                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                                })
                                
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(colorScheme == .dark ? .black : .white)
                    //.background(Color.white)
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .onTapGesture {
            isShowing.toggle()
        }
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedOption: .constant(.dashboard))
}


