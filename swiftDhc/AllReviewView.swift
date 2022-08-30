//
//  AllReviewView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/30.
//

import SwiftUI

struct AllReviewView: View {
    var body: some View {
        ScrollView {
            Text("전체 리뷰보기")
                .font(.title)
        }
        .navigationTitle("전체 리뷰")
    }
}

struct AllReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AllReviewView()
    }
}
