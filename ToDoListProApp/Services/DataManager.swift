//
//  DataManager.swift
//  ToDoListProApp
//
//  Created by Анна on 30.04.2024.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    private let storageManager = StorageManager.shared
    
    private init() {}
    
    func createTempData(completion: @escaping () -> Void) {
        let shoppingList = TaskList(value: ["Shopping List", Date()])
        let moviesList = TaskList(value: ["Movies List", Date()])
        
        let milk = Task(value: ["Milk", "2L"])
        let apples = Task(value: ["Apples", "2Kg"])
        let bread = Task(value: ["title": "Bread", "isComplete": true])
        
        let firstFilm = Task(value: ["Best film ever"])
        let secondFilm = Task(value: ["The best of the best", "Must have", Date(), false])
        
        shoppingList.tasks.insert(contentsOf: [milk, apples, bread], at: 0)
        moviesList.tasks.insert(contentsOf: [firstFilm, secondFilm], at: 0)
        
        DispatchQueue.main.async { [unowned self] in
            storageManager.save([shoppingList, moviesList])
            completion()
        }
    }
}
