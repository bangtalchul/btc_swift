//
//  CalenderView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/09/12.
//

import SwiftUI

// 달력 + 시간 선택
struct CalenderView: View {
//    @State private var pickDate = Date()
    @Binding var date: Date
    
    let maxDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())!
    
    var body: some View {
        DatePicker("pickDate"
                   , selection: $date
                   , in: Date()...maxDate
                   , displayedComponents: [.date])
        
//                .onChange(of: pickDate, perform: { (value) in
//                                    //print($pickDate)
//                                })
        
                        .datePickerStyle(GraphicalDatePickerStyle())
                      //달력과 텍스트의 위치를 지정하는 프레임
                        .frame(maxHeight: 400)
                        .background(Color.gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                        .accentColor(Color(red: 85/255, green: 32/255, blue: 132/255))
    }
    
}
