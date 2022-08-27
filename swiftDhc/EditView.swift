//
//  SwiftUIView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/27.
//

import SwiftUI

struct EditView: View {
//    @Binding var student: Student

    var body: some View {
          VStack(alignment: .center) {
              Spacer()
//              Text("\(student.name)의 점수 수정하기")
//              TextField("", value: $student.score, formatter: NumberFormatter())
//                  .frame(width: 50, height: 20)
//                  .border(.gray, width: 1)
              Spacer()
          }
      }
  }

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()

    }
}
