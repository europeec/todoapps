//
//  SectionView.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

struct SectionView: View {
    @Binding var isExpanded: Bool

    var title: String
    var count: Int
    
    var body: some View {
        VStack {
            TitleView(isExpanded: $isExpanded, title: title)
        }.padding()
    }
}
