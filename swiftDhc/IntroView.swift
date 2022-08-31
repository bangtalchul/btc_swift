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
    var cafeName: String = "비밀의 화원"
    //220817 수현추가
    var titleText = ""
    var imageText = ""
    var locationText = ""
    var score = 0.0
//    var structOfCafeInfo = CafeInfo(cafeName: "", cafeLocation: "")
    
    @State var structOfThemaInfo = ThemaInfoData
    @State var valueThemaImage: String = ""
    
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
                    .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
                
                //220827 수현추가(카페명)
                Text(titleText)
                    .font(.title)
                
                // 카페 정보
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "location.fill").foregroundColor(.gray)
                        Text(locationText).foregroundColor(.gray)
                    }
                    .padding(.trailing, 2)
                    
                    HStack {
                        Text("추천테마")
                            .font(.title2)
                        
                        Text("테마1").foregroundColor(.gray)
                        Text("테마2").foregroundColor(.gray)
                    }
                    .padding(.top, 2)
                    
                    HStack {
                        StarRating(rating: .constant(score), maxRating: 5)
                            .font(.title3)
                        Text(String(format: "%.1f", score)).foregroundColor(.gray)
                    }
                    .padding(EdgeInsets(top:1, leading: 0, bottom: 2, trailing: 0))
                    
    //                Divider()
                }
                .padding()
                
                Divider()
    //            Spacer()
                
                // 테마 summary
                ForEach($structOfThemaInfo){
                    $valueThemaInfo in
                    VStack{
                        NavigationLink(destination: ThemaView(themaImageText: $valueThemaInfo.wrappedValue.themaImageName, themaText: $valueThemaInfo.wrappedValue.themaName, cafeText:$valueThemaInfo.wrappedValue.cafeName, score: $valueThemaInfo.wrappedValue.themaScore)//.navigationBarBackButtonHidden(true)
                        )
                        {
                            ThemaListRow(themaInfo: $valueThemaInfo)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .edgesIgnoringSafeArea(.all)
                }
                
                
    //            List(structOfThemaInfo.indices) { themas in
    //                ThemaListRow(themaInfo: self.$structOfThemaInfo[themas])
    //            }
    //            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    //            //.padding(EdgeInsets(top: 44, leading: 0, bottom: 24, trailing: 0))
    //            .edgesIgnoringSafeArea(.all)
                    
            }
        }
        .padding()
        
        
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
                        .font(.title)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(themaInfo.cafeName)
                        .font(.caption)
                    Spacer().frame(height:4)
                    HStack {
                        StarRating(rating: .constant(themaInfo.themaScore), maxRating: 5)
                        Text(String(format: "%.1f", themaInfo.themaScore)).foregroundColor(.gray)
                    }
                    Text(themaInfo.themaDescription)
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(EdgeInsets(top:2, leading: 0, bottom: 2, trailing: 0))
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

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
