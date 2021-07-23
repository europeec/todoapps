//
//  Model.swift
//  todo
//
//  Created by Дмитрий Юдин on 23.07.2021.
//

import Foundation
import SwiftUI

class ModelData: ObservableObject {
    static let shared = ModelData()
    
    @Published var data: [SectionData] = [SectionData(title: "Нужно сделать", isExpanded: false, tasks: ["Помыть машину", "Сделать приложение", "Посадить дерево", "Вырасти ребенка", "Сходить в магазин"]), SectionData(title: "Сделано", isExpanded: false, tasks: ["Покушать", "Проснулся", "Сделал git репозиторий"])]
    
    func tapOnTask(done: Bool, title: String, index: Int) {
        if (done) {
            data[1].tasks.remove(at: index)
            data[0].tasks.append(title)
        } else {
            data[0].tasks.remove(at: index)
            data[1].tasks.append(title)
        }
    }
    
    func addNew(title: String) {
        data[0].tasks.append(title)
    }
    
}

struct SectionData: Identifiable {
    let id = UUID()
    var title: String
    var isExpanded: Bool
    
    var tasks: [String]
}
