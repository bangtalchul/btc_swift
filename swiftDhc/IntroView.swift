//
//  IntroView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/23.
//

import SwiftUI

// IntroView : 카페 정보
struct IntroView: View {
    //@Binding var searchText2: String
    
    var cafeImageName = "CafeImageTest"
    var cafeName: String = ""
    //220817 수현추가
    var titleText = ""
    var imageText = ""
    var locationText = ""
    var score = 0.0
    var timeText = ""
    var recomCafe = ""
//    var structOfCafeInfo = CafeInfo(cafeName: "", cafeLocation: "")
    
    @State var structOfThemaInfo = ThemaInfoData
    @State var valueThemaImage: String = ""
    
//    @Binding var rootIsActive : Bool
    
    var body: some View {
        
        ScrollView() {
            VStack {
    //            Rectangle()
    //                .foregroundColor(.gray)
    //                .frame(height: 200)
                Image(imageText)
                    .resizable()
                    .frame(height: 250)
                    .clipped()
                    .scaledToFill()
                    .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
                
                //220827 수현추가(카페명)
                Text(titleText)
                    .font(.title)
                
                Divider()
                
                // 카페 정보
                //(alignment: .leading)
                VStack {
                    
                    VStack {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.gray)
                            Text(locationText)
                                .foregroundColor(.gray)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        .padding(.trailing, 2)
                        
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.gray)
                            Text(timeText)
                                .foregroundColor(.gray)
//                                .padding(.top, 1)
                        }
                        .padding(.top, 1)
                        
                    }
                    .padding()
                    
                    HStack {
                        Text("추천테마")
                            .font(.title2)
                        Text(recomCafe).foregroundColor(.gray)
                        //Text("테마1").foregroundColor(.gray)
                        //Text("테마2").foregroundColor(.gray)
                    }
                    .padding(.top, 2)
                    
                    HStack {
                        StarRating(rating: .constant(score), maxRating: 5)
                            .font(.title3)
                        Text(String(format: "%.1f", score)).foregroundColor(.gray)
                    }
                    .padding(EdgeInsets(top:0.5, leading: 0, bottom: 2, trailing: 0))
                    
    //                Divider()
                }
                .padding()
                
//                Divider()
    //            Spacer()
                
                // 테마 summary
//                ForEach($structOfThemaInfo){
//                    $valueThemaInfo in
//                    VStack{
//                        NavigationLink(destination: ThemaView(themaImageText: $valueThemaInfo.wrappedValue.themaImageName, themaText: $valueThemaInfo.wrappedValue.themaName, cafeText:$valueThemaInfo.wrappedValue.cafeName, score: $valueThemaInfo.wrappedValue.themaScore,
//                            keywordText: $valueThemaInfo.wrappedValue.themaKeyword,
//                            genreText: $valueThemaInfo.wrappedValue.themaGenre,
//                            descText: $valueThemaInfo.wrappedValue.themaDescription,
//                             member: $valueThemaInfo.wrappedValue.themaMember
////                                                              , rootIsActive: self.$rootIsActive
//                            )//.navigationBarBackButtonHidden(true)
//                        )
//                        {
//                            ThemaListRow(themaInfo: $valueThemaInfo)
//                                .foregroundColor(.black)
//                        }
//                        .isDetailLink(false)
//                    }
//                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
//                    .edgesIgnoringSafeArea(.all)
//                }
                
                // ThemaView Test!!!
                
                Divider()
                
                ForEach($structOfThemaInfo){
                    $valueThemaInfo in
                    
                    Group{
                        if getThema(cafeName: cafeName, themaCafeName:  $valueThemaInfo.wrappedValue.cafeName) {
                            VStack {
                                NavigationLink(destination: ThemaView(themaImageText: $valueThemaInfo.wrappedValue.themaImageName
                                    , themaText: $valueThemaInfo.wrappedValue.themaName
                                    , cafeText:$valueThemaInfo.wrappedValue.cafeName
                                    , score: $valueThemaInfo.wrappedValue.themaScore
                                    , genreText: $valueThemaInfo.wrappedValue.themaGenre
                                    , descText: $valueThemaInfo.wrappedValue.themaDescription
                                    , member: $valueThemaInfo.wrappedValue.themaMember
                                    )
                                )
                                {
                                    ThemaListRow(themaInfo: $valueThemaInfo)
                                        .foregroundColor(.black)
                                }
                                .isDetailLink(false)
                            }
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .edgesIgnoringSafeArea(.all)
                        }
                        
                    }
                }
                
                
                
    //            List(structOfThemaInfo.indices) { themas in
    //                ThemaListRow(themaInfo: self.$structOfThemaInfo[themas])
    //            }
    //            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    //            //.padding(EdgeInsets(top: 44, leading: 0, bottom: 24, trailing: 0))
    //            .edgesIgnoringSafeArea(.all)
                    
            }
        }
        .navigationBarTitle(Text(verbatim: "카페 상세"), displayMode: .inline)
        .padding()
        .accentColor(Color(red: 85/255, green: 32/255, blue: 132/255))
        
    }
    
}

struct ThemaSummaryView: View {
//    @State var structOfThemaInfo = ThemaInfoData
    @Binding var themaInfo: ThemaInfo

        var body: some View {
            HStack(alignment: .center) {
                Image(themaInfo.themaImageName)
                    .resizable()
                    .frame(width: 120, height: 180)
                Spacer().frame(width:20)
                VStack(alignment: .leading, spacing: 4) {
                    Text(themaInfo.themaName)
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(themaInfo.cafeName)
                        .font(.footnote)
                    Spacer().frame(height:4)
                    HStack {
                        StarRating(rating: .constant(themaInfo.themaScore), maxRating: 5)
                        Text(String(format: "%.1f", themaInfo.themaScore)).foregroundColor(.gray)
                    }
                    Text(themaInfo.themaDescription)
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(EdgeInsets(top:2, leading: 0, bottom: 2, trailing: 0))
                        .lineLimit(1)
                }
                
                Spacer()
                
            }
            .padding()
        }
    
}

struct ThemaListRow: View {
    @Binding var themaInfo: ThemaInfo

    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            ThemaSummaryView(themaInfo: $themaInfo)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


// get thema function
func getThema(cafeName: String, themaCafeName: String) -> Bool {
    
    if cafeName == themaCafeName {
        return true
    }
    return false
}

//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroView()
//    }
//}
