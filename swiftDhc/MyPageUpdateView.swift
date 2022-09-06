//
//  MyPageUpdateView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/09/06.
//

import SwiftUI

struct MyPageUpdateView: View {
    @AppStorage("user_name") var userName: String = ""

    var body: some View {
        Text(userName)
        Button("확인", action: {
            
        })
    }
}

struct MyPageUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageUpdateView()
    }
}
