//
//  ContentView.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import SwiftUI

var testData = ["helo", "hello", "hellou"]

struct ModelData: Identifiable {
    let id = UUID()
    var title: String
    var isExpanded: Bool
    
    var tasks: [String]
}


struct ContentView: View {
    @State var inWorkExpanded = true
    @State var needExpanded = true
    @State var doneExpanded = false
    @State var data = [ModelData(title: "Нужно сделать", isExpanded: false, tasks: testData), ModelData(title: "Сделано", isExpanded: false, tasks: testData)]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.indices) { index in
                    Section(header: TitleView(title: data[index].title, isExpanded: $data[index].isExpanded)) {
                        
                        if (data[index].isExpanded) {
                            ForEach(data[index].tasks.indices, id: \.self) { taskIndex in
                                let task = data[index].tasks[taskIndex]
                                Text(task)
                                    .onTapGesture {
                                        data[index].tasks.remove(at: taskIndex)
                                        data[1].tasks.append(task)
                                    }
                            }
                        }
                    }
                }
            }.navigationTitle("TODO?")
            .listStyle(InsetListStyle())
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SectionView: View {
    var title: String
    var count: Int
    @Binding var isExpanded: Bool
    
    var body: some View {
        VStack {
            TitleView(title: title, isExpanded: $isExpanded)
        }.padding()
    }
}

struct TitleView: View {
    var title: String
    @Binding var isExpanded: Bool
    
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


struct TaskView: View {
    var title: String
    @Binding var done: Bool
    
    var body: some View {
        HStack {
            
        }
    }
}
