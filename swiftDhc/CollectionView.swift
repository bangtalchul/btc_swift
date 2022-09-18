//
//  CollectionView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/09/18.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        VStack{
            Image("Sprout")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay { // <-
                        Circle().stroke(.gray, lineWidth: 2)
                      }
            Text("공포테마 마니아시군요!")
                .padding(.top)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
        
    }
}
