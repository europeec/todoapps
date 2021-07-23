//
//  AddButton.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

struct AddButton: View  {
    @Binding var show: Bool
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                show.toggle()
            }
        }, label: {
            Image(systemName: "plus.circle")
                .font(.title)
        })
    }
}

