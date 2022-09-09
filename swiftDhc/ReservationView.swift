//
//  ReservationView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/30.
//

import SwiftUI

private let dateFormatter: DateFormatter = {

    let formatter: DateFormatter = DateFormatter()

    //formatter.dateStyle = DateFormatter.Style.long
    formatter.dateFormat = "yyyy-MM-dd"
//        formatter.dateStyle = DateFormatter.Style.medium

//        formatter.timeStyle = DateFormatter.Style.short

    return formatter

    }()

struct ReservationView: View {
    var cafeText = ""
    var themeText = ""
    
    
    @State var tagOfReservation:Int? = nil
    //@State var pickDate = Date()
    
//    var dateFormatter: DateFormatter {
//            let formatter = DateFormatter()
//            formatter.dateStyle = .long
//            return formatter
//    }
//
//    let formatter = DateFormatter()
//    let str = dateFormatter.string(from: Date())
    @State var date = Date()
    
    var test = "2022-09-21"
    @State var pickDate = "2022-09-22"
    
    @State var structOfReserve = ReserveInfoData
    @State var pickData = ReserveInfo(cafeName: "", themeName: "", reserveDate: "", reserveTime: [""])
    @State var timeArray = [""]
    
//    @State var realPickDate = dateFormatter.date(from: "2022-09-09 11:51:00 +0000")
    
//    @State var pickDate : Date? = nil
    
    
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
                
                // 달력 + 날짜 선택
                VStack {
                    Text("날짜 선택")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("2주 후의 날까지 예약이 가능해요")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    CalenderView(date: $date)
                        .onAppear(){
                            timeArray = []
                        }
                        .onChange(of: date, perform:{ (value) in
//                            print(date)
                            
//                            realPickDate = dateFormatter.date(from: dateFormatter.string(from: date))
//                            print("형 변환 : ", dateFormatter.string(for:realPickDate))
                            
                            pickDate = dateFormatter.string(from: date)
                            
                            print("유저가 선택한 날짜 :", pickDate)
                            print(pickDate)
                            
                            if test == pickDate {
                                print("Same!!")
                            } else {
                                print("Diffrent!!")
                            }
                            
                            
                            
                            // 필터링
//                            ForEach($structOfReserve) {$value in
//                                if getTime(date: pickDate, cafeName: cafeText, themaName: themeText, reserve: $value.wrappedValue) {
//
//                                }
//                            }
                            
                            for value in $structOfReserve{
                                if getTime(date: pickDate, cafeName: cafeText, themaName: themeText, reserve: value.wrappedValue){
                                    print("find data!")
                                    pickData = value.wrappedValue
                                    print("예약일 정보 : ", pickData)
                                    
                                    // 시간 리스트
                                    timeArray = value.wrappedValue.reserveTime
                                    break
                                } else {
                                    timeArray = []
                                }
                            }
                            
                        })
                }
                .padding()
                
                Divider()
                
                
                // 1. 카페이름 + 테마 + 날짜로 시간 필터링
                // 2. State가 false면 비활성화 (예약 불가)
                // 시간
                VStack{
                    Text("시간 선택")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach($timeArray, id: \.self) {$t in
                                //HStack {
                                    Button(action: {
                                        }) {
                                            TimeView(oneTime: $t)
                                        }
//                                        .padding([.leading])
                                //}
                                //.edgesIgnoringSafeArea(.all)
                            }
                            .edgesIgnoringSafeArea(.all)
                        }

                    }
                                        
                }
                
                Divider()
                
                // 인원
                VStack{
                    Text("인원 추가")
                        .font(.title2)
                        .fontWeight(.semibold)
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
    @Binding var date: Date
    
    let maxDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())!
    
    var body: some View {
        DatePicker("pickDate"
                   , selection: $date
                   , in: Date()...maxDate
                   , displayedComponents: [.date])
        
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

// 날짜로 - 시간 필터링 함수afeName: String, themaName: String,
func getTime(date: String, cafeName: String, themaName: String, reserve: ReserveInfo) -> Bool {
    if date == reserve.reserveDate && cafeName == reserve.cafeName && themaName == reserve.themeName {
        return true
    } else {
        return false
    }
    return false
}

// 예약 가능 여부 함수


// 시간 View
struct TimeView: View {
    @Binding var oneTime: String
    
    var body: some View {
        HStack {
            Text(oneTime)
                .fontWeight(.semibold)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(width: 55, height: 20)
        .padding()
        .background(Color(red: 85/255, green: 32/255, blue: 132/255))
        .cornerRadius(40)
    }
}

struct TimeListView: View {
    @Binding var oneTime: String
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            TimeView(oneTime: $oneTime)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


// 사용자 추가




struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
