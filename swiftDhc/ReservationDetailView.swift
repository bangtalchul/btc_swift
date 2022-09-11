//
//  ReservationDetailView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/09/06.
//

import SwiftUI

struct ReservationDetailView: View {
    @State var tagOfReservationDetail:Int? = nil
    
    var cafeText = ""
    var themeText = ""
    var pickDate = ""
    var pickTime = ""
    
//    var pickPeople = [""]
    
    
    var body: some View {
        
        
        VStack{
            Text("한번 더 확인해 주세요.")
                .font(.title)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("카페 이름 : ")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    Text(cafeText)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Text("테마    : ")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    Text(themeText)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Text("날짜    : ")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    
                    Text(dateTimeSubString(str:pickDate, from:6, to:2))
                        .font(.title2)
                        .fontWeight(.semibold)
                    +
                    Text("월 ")
                        .font(.title2)
                        .fontWeight(.semibold)
                    +
                    Text(dateTimeSubString(str:pickDate, from:9, to:2))
                        .font(.title2)
                        .fontWeight(.semibold)
                    +
                    Text("일 ")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                HStack {
                    Text("시간    : ")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    
                    Text(dateTimeSubString(str:pickTime, from:1, to:2))
                        .font(.title2)
                        .fontWeight(.semibold)
                    +
                    Text("시 ")
                        .font(.title2)
                        .fontWeight(.semibold)
                    +
                    Text(dateTimeSubString(str:pickTime, from:4, to:2))
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                ZStack{
                    NavigationLink(destination: MyPageView()
                                   , tag: 1, selection: self.$tagOfReservationDetail ) {
                          EmptyView()
                        }
//                        .isDetailLink(false)
                }
                
                Spacer()
                
                Button(action: {
                    self.tagOfReservationDetail = 1
                    
                  }) {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.title)
                        Text("예약확인")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .cornerRadius(40)
                }
                .buttonStyle(MyButtonStyle())
                .padding()
            }
//            Text(cafeText)
        }
        .padding()
    }
}

struct ReservationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailView()
    }
}
