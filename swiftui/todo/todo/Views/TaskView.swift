//
//  TaskView.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

struct TaskView: View {
    @Binding var data: [SectionData]
    
    let model = ModelData.shared
    
    var title: String
    var done: Bool
    var index: Int
    
    var body: some View {
        HStack {
            if (done) {
                Image(systemName: "square.dashed.inset.fill")
                    .foregroundColor(.green)
                    .font(.title)
            } else {
                Image(systemName: "square.dashed")
                    .font(.title)
            }
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
        }.onTapGesture {
            withAnimation {
                model.tapOnTask(done: done, title: title, index: index)
            }
        }
    }
}
