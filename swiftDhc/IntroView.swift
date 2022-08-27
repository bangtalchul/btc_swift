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
    
    var locationText = ""
    var score = 0.0
//    var structOfCafeInfo = CafeInfo(cafeName: "", cafeLocation: "")
    
    
    var body: some View {
        VStack {
//            Rectangle()
//                .foregroundColor(.gray)
//                .frame(height: 200)
            Image(cafeImageName)
                .frame(height: 250)
                .clipped()
                .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
            
            //220827 수현추가(카페명)
            Text(titleText)
                .font(.title)
            VStack(alignment: .leading) {
//                Text("카페/테마 소개페이지")
//                    .font(.title)
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
                
                Divider()
                
            }
            .padding()
            
            Spacer()
        
        }
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
