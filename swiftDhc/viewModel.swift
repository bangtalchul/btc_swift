//
//  viewModel.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/27.
//

import Foundation

struct Student: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}

class MainView2Model: ObservableObject {
    
    @Published var students = [
        Student(name: "김철수", score: 100),
        Student(name: "김영희", score: 90),
        Student(name: "이영수", score: 80),
        Student(name: "이영희", score: 70),
        Student(name: "박철수", score: 60),
        Student(name: "박영희", score: 50),
        Student(name: "최철수", score: 40),
        Student(name: "최영희", score: 30),
        Student(name: "정철수", score: 20),
        Student(name: "정영희", score: 10),
    ]
    
}


