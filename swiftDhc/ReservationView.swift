//
//  ReservationView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/30.
//

import SwiftUI

struct ReservationView: View {
    @State var tagOfReservation:Int? = nil
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                Text("예약 페이지")
                    .font(.title)
                
                // 예약 버튼
                ZStack{
                        NavigationLink(destination: MyPageView(), tag: 1, selection: self.$tagOfReservation ) {
                          EmptyView()
                        }
//                        .isDetailLink(false)
                }
                    
                Button(action: {
                    self.tagOfReservation = 1
                    
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
                    .cornerRadius(40)
                }
                .padding()
            }
        }
    }
}

// 달력 + 시간 선택


// 사용자 추가




struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
