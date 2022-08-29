//
//  Search.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/23.
//

import SwiftUI

struct SearchView: View {
    private var listOfCafe = CafeList
    @State var searchText = ""
    @State var structOfCafeInfo = CafeInfoData//CafeInfo(cafeName: "", cafeLocation: "")
    @State var structOfThemaInfo = ThemaInfoData
    var body: some View {
        NavigationView{
            List{
                ForEach(structOfCafeInfo){ valueCafeInfo in
                    HStack{
                        NavigationLink(destination: IntroView(titleText: valueCafeInfo.cafeName, imageText: valueCafeInfo.cafeImage, locationText: valueCafeInfo.cafeLocation, score: valueCafeInfo.cafeScore)){
                            Text("\(valueCafeInfo.cafeName)")
                            Spacer()
                        }
                    }
                    .padding()
                }
                
                ForEach(structOfThemaInfo){ valueThemaInfo in
                    HStack{
                        NavigationLink(destination: ThemaView(themaImageText: valueThemaInfo.themaImageName, themaText: valueThemaInfo.themaName, cafeText:valueThemaInfo.cafeName, score: valueThemaInfo.themaScore)){
                            Text("\(valueThemaInfo.themaName)")
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
