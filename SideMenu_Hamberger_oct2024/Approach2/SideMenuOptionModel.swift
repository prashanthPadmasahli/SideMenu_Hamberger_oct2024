//
//  SideMenuOptionModel.swift
//  SideMenu_Hamberger_oct2024
//
//  Created by mac on 04/10/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard
    case performance
    case profile
    case search
    case notification
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .performance:
            return "Performance"
        case .profile:
            return "Profile"
        case .search:
            return "Search"
        case .notification:
            return "Notification"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .dashboard:
            return "filemenu.and.cursorarrow"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"
        case .notification:
            return "bell"
        }
    }
    
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { self.rawValue }
}
