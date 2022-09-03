//
//  AllReviewView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/30.
//

import SwiftUI

struct AllReviewView: View {
    @State var structOfReview = ReviewData
    var cafeText = ""
    var themaText = ""
    
//    @State var testData = Review(userName: "test", reviewScore: 1.5, reviewText: "테스트용")
    @State var testData = Review(userName: "test", reviewScore: 1.5, reviewText: "번째 테스트 글입니다.")
    
    
//    var totalReviewCnt:Int = ReviewData.count
    @State private var totalReviewCnt:Int = 9
    
    var body: some View {
//        HStack {
//            Spacer()
//            Text("최신순")
//        }
//
        ScrollView {
            LazyVStack {
                ForEach(0 ... totalReviewCnt, id:\.self) {i in
                    VStack {
                        if i < 6 {
                            ReviewListRow(review: $structOfReview[i], cafeN: cafeText, themaN: themaText)
                        } else {
                            ReviewListRow2(review: $testData, cafeN: cafeText, themaN: themaText, number: i)
                                .onAppear()
                        }
                    }
                    .onAppear{
                        if i % 10 == 9 {
                            totalReviewCnt += 10
                        }
                    }
                    .padding()
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .navigationTitle("전체 리뷰")
    }
}

//                ForEach(0...totalReviewCnt, id:\.self) { index in
//                    VStack {
//                        ReviewListRow2(review: $structOfReview[index], cafeN: cafeText, themaN: themaText, number: index)
////                        if i < 6{
////                            ReviewListRow(review: $structOfReview[i], cafeN: cafeText, themaN: themaText)
////                        } else {
////                            ReviewListRow(review: Review(userName: "test \(i)", reviewScore: 1.5, reviewText: "\(i)번째 테스트 글입니다."), cafeN: cafeText, themaN: themaText)
////                        }
//                    }
//                    .padding()
//                    .edgesIgnoringSafeArea(.all)
//
//                }

// 임시로 쓰는거
// 나중에 원래 쓰던 것만 쓸거
struct ReviewSummaryView2: View {
    @Binding var review: Review
    var cafeN: String
    var themaN: String
    
    let number: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(review.userName)
                    .font(.title3)
                +
                Text("\(number)")
                    .font(.title3)
                
                Spacer()
                
                HStack {
                    StarRating(rating: .constant(review.reviewScore), maxRating: 5)
                        .font(.caption)
                    Text(String(format: "%.1f", review.reviewScore))
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            
            HStack {
                Text(cafeN)
                    .foregroundColor(.gray)
                Text(" | ")
                    .foregroundColor(.gray)
                Text(themaN)
                    .foregroundColor(.gray)
            }
//            .padding(.top, 1)
            
            HStack {
                Text("\(number) ")
                Text(review.reviewText)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(EdgeInsets(top:2, leading: 0, bottom: 2, trailing: 0))
        }
        .padding()
    }
}

struct ReviewListRow2: View {
    @Binding var review: Review
    var cafeN: String
    var themaN: String
    
    let number: Int
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            ReviewSummaryView2(review: $review, cafeN: cafeN, themaN: themaN, number: number)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        
    }
}


struct AllReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AllReviewView()
    }
}
