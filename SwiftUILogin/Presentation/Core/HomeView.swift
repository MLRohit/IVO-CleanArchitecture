//
//  ContentView.swift
//  SwiftUILogin
//
//  Created by Rohit Lama on 30/01/2024.
//

import SwiftUI
import PagerTabStripView

struct HomeView: View {
    
    private enum Page: String {
        case login = "Log in",
             signup = "Sign up"
    }
    
    // MARK: - Properties
    
    @State private var selection: Page = .login
    
    // MARK: - Body
    
    var body: some View {
        PagerTabStripView(selection: $selection) {
            LoginView()
                .pagerTabItem(tag: Page.login) {
                    NavBarItem(title: Page.login.rawValue,
                               selection: $selection,
                               tag: Page.login)
                }
            LoginView()
                .pagerTabItem(tag: Page.signup) {
                    NavBarItem(title: Page.signup.rawValue,
                               selection: $selection,
                               tag: Page.signup)
                }
        }
        .pagerTabStripViewStyle(.barButton(placedInToolbar: false,
                                           tabItemHeight: 40,
                                           indicatorViewHeight: 3,
                                           indicatorView: {
            Rectangle().fill(Color(.systemBlue)).cornerRadius(1)
        }))
    }
    
}

#Preview {
    HomeView()
}


