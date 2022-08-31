//
//  CommunityDetailView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/31.
//

import SwiftUI

struct CommunityDetailView: View {
    
    @State var test = ""
    
    var body: some View {
        VStack{
            Text("community detail")
                .font(.title)
            
            Text(test)
                .font(.headline)
                .foregroundColor(.black)
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CommunityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityDetailView()
    }
}
