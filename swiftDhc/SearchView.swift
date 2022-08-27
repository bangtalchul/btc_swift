//
//  SearchView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/22.
//  사용안함

import SwiftUI

struct SearchView: View {
    let array = [
        "숨바꼭질 1호점", "숨바꼭질 2호점", "숨바꼭질 3호점", "비밀의화원 서면점",
        "비밀의화원 시네마틱혜화점"
    ]
    let array2 = [
        "부산광역시 사하구", "부산광역시 강서구", "부산광역시 사상구", "부산광역시 부산진구",
        "부신광역시 금정구"
    ]
    
    
    @State private var searchText = ""
//    @State private var locationText = ""
//    @State private var structOfCafeInfo = CafeInfoData//CafeInfo(cafeName: "", cafeLocation: "")
    
    var body: some View {
//        // 테스트
//        ForEach(structOfCafeInfo) { cafeInfo in
//            Text("Test : \(cafeInfo.cafeName)")
//        }
        
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                List {
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
//                        searchText in Text(searchText)
                        searchText in Button(action: {
                            print(searchText)
                            }) {
                            Text(searchText)
                        }
                    }
                    
                } //리스트의 스타일 수정
                .listStyle(PlainListStyle())
                  //화면 터치시 키보드 숨김
                .onTapGesture {
                    hideKeyboard()
                }
                
                
            }
            .navigationBarTitle("검색")
            
        }
    }
}
