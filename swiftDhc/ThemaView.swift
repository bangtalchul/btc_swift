//
//  ThemaView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/28.
//

import SwiftUI

struct ThemaView: View {
    
//    @State var themaImageText: String = ""
    var themaImageText: String = ""
//    @State var themaInfoDetail: ThemaInfo
    var themaText = ""
    var cafeText = ""
    var score = 0.0
//    var imageText = ""
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(themaImageText)
    //                .resizable()
                    .frame(height: 250)
                    .clipped()
                    .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
                Text(themaText)
                    .font(.title)
                
                VStack {
                    Text(cafeText)
                        .foregroundColor(.gray)
                        .padding(.top, 2)
                    
                    HStack {
                        StarRating(rating: .constant(score), maxRating: 5)
                            .font(.title3)
                        Text(String(format: "%.1f", score)).foregroundColor(.gray)
                    }
                    .padding(EdgeInsets(top:1, leading: 0, bottom: 2, trailing: 0))
                    
                }
                .padding()
                
                Divider()
                
            }
            .padding()
            .navigationBarTitle(Text(verbatim: "테마 상세"), displayMode: .inline)
            
            Text("Thema View")
                .font(.title)
            Spacer()
        }
    }
}

struct ThemaView_Previews: PreviewProvider {
    static var previews: some View {
        ThemaView()
    }
}
