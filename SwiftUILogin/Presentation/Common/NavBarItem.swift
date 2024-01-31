//
//  NavBarItem.swift
//  SwiftUILogin
//
//  Created by Rohit Lama on 31/01/2024.
//

import SwiftUI
import PagerTabStripView

struct NavBarItem<SelectionType>: View where SelectionType: Hashable {
    
    // MARK: - Properties
    
    @EnvironmentObject private var pagerSettings: PagerSettings<SelectionType>
    var title: String
    @Binding var selection: SelectionType
    let tag: SelectionType
    
    // MARK: - Initializer
    
    init(title: String, selection: Binding<SelectionType>, tag: SelectionType) {
        self.tag = tag
        self.title = title
        _selection = selection
    }
    
    // MARK: - Body
    
    @MainActor var body: some View {
        VStack {
            Text(title)
                .font(.custom(.semiBold, size: 20))
                .foregroundColor(Color(.systemGray).interpolateTo(color: Color(.systemBlue),
                                                                  fraction: pagerSettings.transition.progress(for: tag)))
        }
        .animation(.easeInOut, value: selection)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
