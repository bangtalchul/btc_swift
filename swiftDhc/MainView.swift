//
//  MainView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/22.
//

import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift

struct MainView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_name") var userName: String = ""
    

    private var listOfCafe = CafeList
    @State var searchText = ""
    
    @State var locationText = ""
    
    @State var structOfCafeInfo = CafeInfoData//CafeInfo(cafeName: "", cafeLocation: "")
    @State var structOfThemaInfo = ThemaInfoData

    var CafeImageName = "CafeImage"
//    @State var isActive = true
    
    
//    @State var isActive : Bool = false
    

    var body: some View {
        NavigationView{
            TabView{
                VStack{
                    HStack{
                        Text(userName + "님, 환영합니다!")
                        .font(.system(size: 30).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                        .padding([.top, .leading, .bottom])
                    Spacer()
                    Spacer()
                    
                        Button("로그아웃"){
                            try? Auth.auth().signOut()
                            GIDSignIn.sharedInstance.signOut()
                            withAnimation(.easeInOut){
                                logStatus = false
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                    
                    //---------------------------
//                    // 220828 정희 테스트
//                    Text("구조체 테스트")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding([.leading])
//                    ScrollView(.horizontal) {
//                        HStack {
//                            ForEach(structOfCafeInfo){
//                                valueCafeInfo in
//                                HStack{
//                                    NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, locationText: valueCafeInfo.cafeLocation)){
//                                        VStack{
//                                            Image(CafeImageName)
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 100, height:100)
//                                            Text("\(valueCafeInfo.cafeName)")
//                                                .foregroundColor(.black)
//                                                .frame(width: 100)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                        .frame(maxHeight: .infinity)
//                    }
//
                    //---------------------------
                    
                    Text("오늘의 카페")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    
                    ScrollView(.horizontal) {
                        HStack{
//                            ForEach(listOfCafe, id: \.self){
//                                listOfCafe in
//                                HStack{
////                                    NavigationLink(destination: IntroView(titleText: listOfCafe)){
////                                        VStack{
////                                            Text("\(listOfCafe)")
////                                        }
////                                    }
//
//                                    NavigationLink(destination: IntroView(titleText: listOfCafe)){
//                                        VStack{
//                                            Image(CafeImageName)
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 100, height:100)
//                                            Text("\(listOfCafe)")
//                                                .foregroundColor(.black)
//                                                .frame(width: 100)
//                                        }
//                                    }
//                                }
//                            }
                            
                            // 220828 정희 : 구조체 이용 -> 카페 이름, 위치 정보 전달
                            ForEach(structOfCafeInfo){
                                valueCafeInfo in
                                HStack{
                                    NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, imageText: valueCafeInfo.cafeImage, locationText: valueCafeInfo.cafeLocation, score: valueCafeInfo.cafeScore, timeText: valueCafeInfo.cafeTime
//                                                                          , rootIsActive: self.$isActive
                                                                         )
//                                        , isActive: self.$isActive
                                        //.navigationBarBackButtonHidden(true)
                                    ){
                                        VStack{
                                            Image("\(valueCafeInfo.cafeImage)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height:100)
                                            Text("\(valueCafeInfo.cafeName)")
                                                .foregroundColor(.black)
                                                .frame(width: 100)
                                        }
                                    }
                                }
                            }
                            .navigationBarTitle("", displayMode: .automatic)
                            .navigationBarHidden(true)
                            
                        }
                        .frame(maxHeight: .infinity)
                        .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing: 10))
                    }
                    
                    Text("오늘의 테마")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading])
                    ScrollView(.horizontal) {
                        HStack {
//                            ForEach(listOfCafe, id: \.self){
//                                listOfCafe in
//                                HStack{
//                                    NavigationLink(destination: IntroView(titleText: listOfCafe)){
//                                        VStack{
//                                            Image(CafeImageName)
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 100, height:100)
//                                            Text("\(listOfCafe)")
//                                                .foregroundColor(.black)
//                                                .frame(width: 100)
//                                        }
//                                    }
//                                }
//                            }
                            
                            // 220828 정희
                            ForEach(structOfThemaInfo){
                                valueThemaInfo in
                                HStack{
                                    NavigationLink(destination: ThemaView(themaImageText: valueThemaInfo.themaImageName, themaText: valueThemaInfo.themaName, cafeText:valueThemaInfo.cafeName, score: valueThemaInfo.themaScore, keywordText: valueThemaInfo.themaKeyword, genreText: valueThemaInfo.themaGenre, descText: valueThemaInfo.themaDescription,        member: valueThemaInfo.themaMember
//                                                                          , rootIsActive: self.$isActive
                                                                         )
//                                                   , isActive: self.$isActive
                                    ){
                                        VStack{
                                            Image("\(valueThemaInfo.themaImageName)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height:100)
                                            Text("\(valueThemaInfo.themaName)")
                                                .foregroundColor(.black)
                                                .frame(width: 100)
                                        }
                                    }
                                }
                            }
                            .navigationBarTitle("", displayMode: .automatic)
                            .navigationBarHidden(true)
                        }
                        .frame(maxHeight: .infinity)
                        .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing: 10))
                    }
                    
                    
                    Text("내주변")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    //  다시 살려야함
                    ScrollView(.horizontal) {
                        HStack {
//                            ForEach(listOfCafe, id: \.self){
//                                listOfCafe in
//                                HStack{
//                                    NavigationLink(destination: IntroView(titleText: listOfCafe)){
//                                        VStack{
//                                            Image(CafeImageName)
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 100, height:100)
//                                            Text("\(listOfCafe)")
//                                                .foregroundColor(.black)
//                                                .frame(width: 100)
//                                        }
//                                    }
//                                }
//                            }
                            
                            // 220828 정흐l
                            ForEach(structOfCafeInfo){
                                valueCafeInfo in
                                HStack{
                                    NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, imageText: valueCafeInfo.cafeImage, locationText: valueCafeInfo.cafeLocation, score: valueCafeInfo.cafeScore
//                                                                          , rootIsActive: self.$isActive
                                                                         )
//                                                   , isActive: self.$isActive
                                    ){
                                        VStack{
                                            Image("\(valueCafeInfo.cafeImage)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height:100)
                                            Text("\(valueCafeInfo.cafeName)")
                                                .foregroundColor(.black)
                                                .frame(width: 100)
                                        }
                                    }
                                }
                            }
                            .navigationBarTitle("", displayMode: .automatic)
                            .navigationBarHidden(true)
                        }
                        .frame(maxHeight: .infinity)
                        .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing: 10))
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem{
                Button("logout"){
                    try? Auth.auth().signOut()
                    GIDSignIn.sharedInstance.signOut()
                    withAnimation(.easeInOut){
                        logStatus = false
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
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//
//    }
//}
