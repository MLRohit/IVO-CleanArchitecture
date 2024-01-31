//
//  String+Extensions.swift
//  SwiftUILogin
//
//  Created by Rohit Lama on 31/01/2024.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
}
