//
//  MainView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            VStack{
                Text("상상쓰님, 환영합니다")
                    .font(.system(size: 30).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])

                Text("오늘의 카페")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                
                ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<10) {
                                    Text("숫자 \($0)")
                                        .foregroundColor(.black)
                                        .font(.largeTitle)
                                        .background(Color.yellow)
                                }
                            }
                            .frame(maxHeight: .infinity)
                        }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
