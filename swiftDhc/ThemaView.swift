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
    var score = 0.0
    var imageText = ""
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(themaImageText)
//                .resizable()
                .frame(height: 250)
                .clipped()
                .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
            Text("테마 페이지")
                .font(.title)
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationBarTitle(Text(verbatim: "제목"), displayMode: .inline)
        Text("Thema View")
            .font(.title)
        Spacer()
    }
}

struct ThemaView_Previews: PreviewProvider {
    static var previews: some View {
        ThemaView()
    }
}
