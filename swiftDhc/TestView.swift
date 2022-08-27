//
//  TestView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/27.
//

import SwiftUI

 struct TestView: View {
    @State var students = [
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

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (spacing: 20) {
                    ForEach($students) { $student in
                        HStack {
                            
                            Text("\($student.wrappedValue.name)의 점수 = \($student.wrappedValue.score)점입니다.")
                            Spacer()
                            NavigationLink {
                                EditView(student: $student)
                            } label: {
                                Text("점수 수정")
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}

 struct EditView: View {
    
    @Binding var student: Student
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("\(student.name)의 점수 수정하기")
            TextField("", value: $student.score, formatter: NumberFormatter())
                .frame(width: 50, height: 20)
                .border(.gray, width: 1)
            Spacer()
        }
    }
}

    

 struct Student: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}

//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}



struct Previews_TestView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
