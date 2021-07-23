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
                    }
                    
                }.navigationTitle("TODO?")
                .navigationBarItems(trailing: AddButton(show: $showAlert))
                .listStyle(InsetListStyle())
                
                
            }.disabled(showAlert)
            .blur(radius: showAlert ? 5 : 0)
            
            
            AddScreenView(show: $showAlert)

            
        }
        }
}

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


struct AddScreenView: View {
    @Binding var show: Bool
    @State var title = ""
    var model = ModelData.shared
    
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
                }.padding(20)
                .frame(width: 360)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
