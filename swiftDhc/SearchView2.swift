//
//  Search.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/23.
//

import SwiftUI

struct SearchView2: View {
    private var listOfCafe = CafeList
    @State var searchText = ""
    
    @State var structOfCafeInfo = CafeInfoData//CafeInfo(cafeName: "", cafeLocation: "")
    
    var body: some View {
        NavigationView{
            List{
                ForEach(cafe, id: \.self){ cafe in
                    HStack{
                        NavigationLink(destination:
                            IntroView()){
                            Text(cafe.capitalized)
                            Spacer()
                        }
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
        }
    }
    
    var cafe: [String] {
        let lcCafe = listOfCafe.map {$0.lowercased()}
        return searchText == "" ? lcCafe : lcCafe.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

struct SearchView2_Previews: PreviewProvider {
    static var previews: some View {
        SearchView2()
    }
}
