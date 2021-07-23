//
//  TitleView.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

struct TitleView: View {
    @Binding var isExpanded: Bool
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(isExpanded ? .bold : .medium)
                .animation(nil)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .animation(nil)
                .rotationEffect(isExpanded ? Angle(degrees: 90) : .zero)
                .animation(.spring())
        }.onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                isExpanded.toggle()
            }
        }.padding(.vertical, 10)
    }
}
