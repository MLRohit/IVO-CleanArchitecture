//
//  User.swift
//  SwiftUILogin
//
//  Created by Rohit Lama on 31/01/2024.
//

import Foundation

struct User: Identifiable {
    
    let id = UUID()
    let username: String
    let password: String
    
}
