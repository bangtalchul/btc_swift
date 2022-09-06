//
//  ReservationView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/30.
//

import SwiftUI

struct ReservationView: View {
    var cafeText = ""
    var themeText = ""
    
    
    @State var tagOfReservation:Int? = nil
    @State var pickDate = Date()
    
//    @State var pickDate = Date()
//    var pickDate = Date()
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                
                HStack(alignment: .center) {
                    Text(cafeText)
                    Text(" | ")
                    Text(themeText)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
                // 달력
                VStack {
                    Text("날짜 선택")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    CalenderView(pickDate: $pickDate)
                        .onChange(of: pickDate, perform:{ (value) in
                            print(pickDate)})
                }
                .padding()
                
                Divider()
                
                // 시간
                VStack{
                    Text("시간 선택")
                        .font(.title)
                    
                }
                
                Divider()
                
                // 인원
                VStack{
                    Text("인원 추가")
                        .font(.title)
                }
                
                
                
                
                Divider()
                
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
struct CalenderView: View {
//    @State private var pickDate = Date()
    @Binding var pickDate: Date
    
    let maxDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())!
    
    var body: some View {
        DatePicker("pickDate"
                   , selection: $pickDate
                   , in: Date()...maxDate
                   , displayedComponents: .date)
        
//                .onChange(of: pickDate, perform: { (value) in
//                                    //print($pickDate)
//                                })
        
                        .datePickerStyle(GraphicalDatePickerStyle())
                      //달력과 텍스트의 위치를 지정하는 프레임
                        .frame(maxHeight: 400)
                        .background(Color.gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                        .accentColor(Color(red: 85/255, green: 32/255, blue: 132/255))
    }
    
}

// 사용자 추가




struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
