//
//  ThemaView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/28.
//

import SwiftUI

struct ThemaView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("테마 페이지")
                .font(.title)
        }
        .navigationBarTitle(Text(verbatim: "제목"), displayMode: .inline)
        Text("Thema View")
            .font(.title)
    }
}

struct ThemaView_Previews: PreviewProvider {
    static var previews: some View {
        ThemaView()
    }
}
