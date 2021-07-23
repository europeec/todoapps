//
//  AddScreenView.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

struct AddScreenView: View {
    @Binding var show: Bool
    @State var title = ""
        
    var body: some View {
        if (show) {
            VStack(alignment: .center, spacing: 40) {
                VStack {
                    Text("Добавление задачи")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Divider()
                        .frame(width: 300)
                }
                
                TextField("Название", text: $title, onCommit:  {
                    print(title)
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                
                SaveButton(title: $title, show: $show)
            }.padding(20)
            .frame(width: 360)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            
        }
    }
}

struct SaveButton: View {
    @Binding var title: String
    @Binding var show: Bool
    
    let model = ModelData.shared
    var body: some View {
        Text("Сохранить")
            .font(.headline)
            .fontWeight(.bold)
            .padding()
            .padding(.horizontal)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(20)
            .onTapGesture {
                if (!title.isEmpty) {
                    model.addNew(title: title)
                    title = ""
                }
                withAnimation {
                    show.toggle()
                }
            }
    }
}
