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
    
//    var keywordText = ""
    var genreText = ""
    var descText = ""
    
    var member = 0
    
//    var imageText = ""
    
    @State var tagOfReserv:Int? = nil
    @State var structOfReview = ReviewData
    
//    @Binding var rootIsActive : Bool
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(themaImageText)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)//250
                    .clipped()
                    .padding(EdgeInsets(top:0, leading:0, bottom:20, trailing:0))
                Text(themaText)
                    .font(.title)
                
                VStack {
                    Text(cafeText)
                        .foregroundColor(.gray)
                        .padding(.top, 1)
                    
                    HStack {
                        StarRating(rating: .constant(score), maxRating: 5)
                            .font(.title3)
                        Text(String(format: "%.1f", score)).foregroundColor(.gray)
                    }
                    .padding(EdgeInsets(top:1, leading: 0, bottom: 1, trailing: 0))
                    
                    HStack {
                        Text(genreText)
                        Text(" | ")
//                        Text(keywordText)
//                        Text(" | ")
                        Text(String(format: "%0d", member))
                        Text("인 추천")
                    }
                    .foregroundColor(.gray)
                    .font(.callout)
                    
                    
                }
                .padding()
                
                Divider()
                
                
                
            }
            .padding()
            .navigationBarTitle(Text(verbatim: "테마 상세"), displayMode: .inline)
            

            Text(descText)
                .foregroundColor(.gray)
                .padding([.leading, .bottom, .trailing])
            
            Divider()
            
            // 예약 버튼
            ZStack{
                    NavigationLink(destination: ReservationView(cafeText: cafeText, themeText: themaText, memberCnt: member
//                                                                , rootIsActive: self.$rootIsActive
                                                               ), tag: 1, selection: self.$tagOfReserv ) {
                      EmptyView()
                    }
                    .isDetailLink(false)
            }
                
            Button(action: {
                self.tagOfReserv = 1
              }) {
                HStack {
                    Image(systemName: "calendar")
                        .font(.title)
                    Text("예약하기")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color(red: 85/255, green: 32/255, blue: 132/255))
                .cornerRadius(20)
            }
            .padding()
            
            Divider()
            
            
            
            // 리뷰
            HStack {
                Text("리뷰 ").font(.title2)
                Text(String(structOfReview.count))
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer()
                
                HStack {
                    NavigationLink(destination: AllReviewView(cafeText: cafeText, themaText: themaText)
                        //.navigationBarBackButtonHidden(true)
                    ) {
                        Text("더보기 ")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .padding()
            
            // 리뷰는 3개정도만 노출
            ForEach(0..<3) { i in
                VStack {
                    ReviewListRow(review: $structOfReview[i], cafeN: cafeText, themaN: themaText)
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
            
            
//            Text("Thema View")
//                .font(.title)
//            Spacer()
        }
        
        .padding(.bottom, 2)
    }
}

// 리뷰
struct ReviewSummaryView: View {
    @Binding var review: Review
    var cafeN: String
    var themaN: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(review.userName)
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
            
            Text(review.reviewText)
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top:2, leading: 0, bottom: 2, trailing: 0))
        }
        .padding()
    }
}

struct ReviewListRow: View {
    @Binding var review: Review
    var cafeN: String
    var themaN: String
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            ReviewSummaryView(review: $review, cafeN: cafeN, themaN: themaN)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


//struct ThemaView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemaView()
//    }
//}
