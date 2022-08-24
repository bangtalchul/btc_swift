//
//  MainView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/22.
//

import SwiftUI

struct MainView: View {
    private var listOfCafe = CafeList
    @State var searchText = ""
    
    var body: some View {
        TabView{
            VStack{
                Text("상상쓰님, 환영합니다!")
                    .font(.system(size: 30).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                Spacer()
                Spacer()
                Spacer()
                
                Text("오늘의 카페")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(listOfCafe, id: \.self) {
                            Text($0)
                                .background(.yellow)
                                .padding(.vertical, 50)
                                .background(.orange)
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                Text("오늘의 테마")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(cafe, id: \.self){ cafe in
                            HStack{
                                NavigationLink(destination: Text("IntroView")){
                                    Text(cafe.capitalized)
                                    Spacer()
                                }
                            }
                            .padding()
                        }

                    }
                    .frame(maxHeight: .infinity)
                }
                
                Text("내주변")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading])
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(listOfCafe, id: \.self) {
                            Text($0)
                                .background(.yellow)
                                .padding(.vertical, 50)
                                .background(.orange)
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
            }
        }
    }
    
    var cafe: [String] {
        let lcCafe = listOfCafe.map {$0.lowercased()}
        return searchText == "" ? lcCafe : lcCafe.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
