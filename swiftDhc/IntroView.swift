//
//  IntroView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/23.
//

import SwiftUI

struct IntroView: View {
    //@Binding var searchText2: String
    
    var cafeImageName = "CafeImageTest"
    var cafeName: String = "비밀의 화원"
    
    
    var body: some View {
        VStack {
//            Rectangle()
//                .foregroundColor(.gray)
//                .frame(height: 200)
            Image(cafeImageName)
                .frame(height: 250)
                .clipped()
                .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
            
            VStack(alignment: .leading) {
                Text("카페/테마 소개페이지")
                    .font(.title)
                HStack {
                    Text("추천테마")
                        .font(.title2)
                    
                    Text("테마1").foregroundColor(.gray)
                    Text("테마2").foregroundColor(.gray)
                }
                .padding(.top, 2)
                
                Image(systemName: "star")
                    .padding(EdgeInsets(top:2, leading: 0, bottom: 2, trailing: 0))
                Divider()
            }
            .padding()
            
            Spacer()
        
        }
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()//searchText2: $searchText)
    }
}
