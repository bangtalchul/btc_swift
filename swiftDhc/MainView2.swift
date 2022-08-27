//
//  MainView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/22.
//

import SwiftUI

struct MainView2: View {
    private var listOfCafe = CafeList
    @State var searchText = ""
    var CafeImageName = "CafeImage"
    
    @Binding var titleText: String
    init(titleText: Binding<String> =
        .constant("1111")){
         _titleText = titleText
        }
    
    var body: some View {
        NavigationView{
            
            TabView{
                VStack{
                    Text("상상쓰님, 환영합니다!")
                        .font(.system(size: 30).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    Spacer()
                    Spacer()
                    
                    Text("오늘의 카페")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(listOfCafe, id: \.self){
                                listOfCafe in
                                HStack{
                                    NavigationLink(destination: IntroView()){
                                        VStack{
                                            Image(CafeImageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height:100)
                                            Text("\(listOfCafe)")
                                                .foregroundColor(.black)
                                                .frame(width: 100)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: .infinity)
                    }
                    Text("오늘의 테마")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(listOfCafe, id: \.self){
                                listOfCafe in
                                HStack{
                                    NavigationLink(destination: IntroView()){
                                        VStack{
                                            Image(CafeImageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height:100)
                                            Text("\(listOfCafe)")
                                                .foregroundColor(.black)
                                                .frame(width: 100)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: .infinity)
                    }
                    
                    
                    Text("내주변")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(listOfCafe, id: \.self){
                                listOfCafe in
                                HStack{
                                    NavigationLink(destination: IntroView()){
                                        VStack{
                                            Image(CafeImageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height:100)
                                            Text("\(listOfCafe)")
                                                .foregroundColor(.black)
                                                .frame(width: 100)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxHeight: .infinity)
                    }
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

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2()
        
    }
}
