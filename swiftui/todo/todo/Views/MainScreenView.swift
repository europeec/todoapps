//
//  MainScreenView.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

struct MainScreenView: View {
    @State var inWorkExpanded = true
    @State var needExpanded = true
    @State var doneExpanded = false
    @ObservedObject var model: ModelData = ModelData.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.data.indices) { index in
                    Section(header: TitleView(isExpanded: $model.data[index].isExpanded, title: model.data[index].title)) {
                        
                        if (model.data[index].isExpanded) {
                            ForEach(model.data[index].tasks.indices, id: \.self) { taskIndex in
                                let task = model.data[index].tasks[taskIndex]
                                let done = index == 1
                                
                                TaskView(data: $model.data, title: task, done: done, index: taskIndex)
                            }
                        }
                    }
                }
            }.navigationTitle("TODO?")
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus.circle")
                    .font(.title)
            }))
            .listStyle(InsetListStyle())
            
            
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
