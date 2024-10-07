//
//  SideMenuHeaderView.swift
//  SideMenu_Hamberger_oct2024
//
//  Created by mac on 04/10/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(Color.blue)
                .cornerRadius(8)
                
            VStack(alignment: .leading) {
                Text("Prashanth kumar")
                    .foregroundStyle(.primary)
                    .font(.callout)
                
                Text("Prashanthkp@gamil.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
