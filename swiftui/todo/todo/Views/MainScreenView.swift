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
    @State var showAlert = false
    
    @ObservedObject var model: ModelData = ModelData.shared
    
    @AppStorage("needGreeting") var needGreeting = true
    
    var body: some View {
        ZStack {
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
                    }.disabled(showAlert || needGreeting)
                    
                }.navigationTitle("TODO?")
                .navigationBarItems(trailing: AddButton(show: $showAlert))
                
                .listStyle(InsetListStyle())
                
                
            }
            .blur(radius: showAlert ? 5 : 0)
            
            if (true) {
                VStack (alignment: .trailing) {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: 100)
                            .foregroundColor(.red)
                            
                    }
                    
                    Spacer()
                }.background(Color.secondary)
            }
            
            AddScreenView(show: $showAlert)
        }
    }
}


struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
