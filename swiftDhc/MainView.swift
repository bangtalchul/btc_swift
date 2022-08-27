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
    
    @State var locationText = ""
    
    @State var structOfCafeInfo = CafeInfoData//CafeInfo(cafeName: "", cafeLocation: "")

    var CafeImageName = "CafeImage"
//    var TitleText = "test"
    @State var isActive = true

//    @Binding var titleText: String
//    init(titleText: Binding<String> =
//        .constant("1111")){
//         _titleText = titleText
//        }
    
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
        NavigationView{
            
            TabView{
                VStack{
                    Text("상상쓰님, 환영합니다!")
                        .font(.system(size: 30).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                    Spacer()
                    Spacer()
                    
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
                                    NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, locationText: valueCafeInfo.cafeLocation, score: valueCafeInfo.cafeScore)){
                                        VStack{
                                            Image(CafeImageName)
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
                            
                            
                        }

                        .frame(maxHeight: .infinity)
                    }
                    
                    Text("오늘의 테마")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
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
                            ForEach(structOfCafeInfo){
                                valueCafeInfo in
                                HStack{
                                    NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, locationText: valueCafeInfo.cafeLocation, score: valueCafeInfo.cafeScore)){
                                        VStack{
                                            Image(CafeImageName)
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
                        }
                        .frame(maxHeight: .infinity)
                    }
                    
                    
                    Text("내주변")
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
                                    NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, locationText: valueCafeInfo.cafeLocation, score: valueCafeInfo.cafeScore)){
                                        VStack{
                                            Image(CafeImageName)
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

//
struct IntroView2: View {
   
//   @Binding var student: Student
//    @Binding var titleText: String
    var titleText = ""
   
   var body: some View {
       VStack {
//            Rectangle()
//                .foregroundColor(.gray)
//                .frame(height: 200)
//           Image(cafeImageName)
//               .frame(height: 250)
//               .clipped()
//               .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
           Text(titleText)
//           VStack(alignment: .leading){
//               Text("카페/테마 소개페이지")
//                   .font(.title)
//               HStack {
//                   Text("추천테마")
//                       .font(.title2)
//
//                   Text("테마1").foregroundColor(.gray)
//                   Text("테마2").foregroundColor(.gray)
//               }
//               .padding(.top, 2)
//
//               Image(systemName: "star")
//                   .padding(EdgeInsets(top:2, leading: 0, bottom: 2, trailing: 0))
//               Divider()
//           }
//           .padding()
//
//           Spacer()
       
       }
       
   }
   }





struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
