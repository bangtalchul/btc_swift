//
//  ReservationView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/30.
//

import SwiftUI

private let dateFormatter: DateFormatter = {

    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter

    }()

struct ReservationView: View {
    var cafeText = ""
    var themeText = ""
    var memberCnt = 0
    
    
    @State var tagOfReservation:Int? = nil
    @State var date = Date()
    
    var test = "2022-09-21"
    @State var pickDate = "2022-09-22"
    
    @State var structOfReserve = ReserveInfoData
    @State var structOfState = ReserveStateDate
    
    @State var pickData = ReserveInfo(cafeName: "", themeName: "", reserveDate: "", reserveTime: [""], reserveCode: 0)
    @State var timeArray = [""]
    @State var stateArray = [false]
    @State var timeCnt = 0
    
    @State var pickTime = ""
    @State var pickState = false
    
    
//    @Binding var rootIsActive : Bool
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    
//                    HStack(alignment: .center) {
//                        Text(cafeText)
//                        Text(" | ")
//                        Text(themeText)
//                    }
//                    .font(.title3)
//                    .foregroundColor(.gray)
                    
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
                                
                                pickDate = dateFormatter.string(from: date)
                                
                                print("유저가 선택한 날짜 :", pickDate)
                                print(pickDate)
                                
                                // 필터링
                                for value in $structOfReserve{
                                    if getTime(date: pickDate, cafeName: cafeText, themaName: themeText, reserve: value.wrappedValue){
                                        print("find data!")
                                        pickData = value.wrappedValue
                                        print("예약일 정보 : ", pickData)
                                        
                                        // 시간 배열
                                        timeArray = value.wrappedValue.reserveTime
                                        // 시간 예약 가능 여부 배열
                                        stateArray = getState(code: value.wrappedValue.reserveCode, state: structOfState)
                                        
                                        timeCnt = stateArray.count
                                        break
                                    } else {
                                        timeArray = []
                                        stateArray = []
                                        timeCnt = 0
                                    }
                                    
                                    pickState = false
                                }
                                
                            })
                    }
                    .padding()
                    
                    Divider()
                        .frame(width: 200)
                        .padding()
                    
//                    Spacer()
                    
                    // 1. 카페이름 + 테마 + 날짜로 시간 필터링
                    // 2. State가 false면 비활성화 (예약 불가)
                    // 시간
                    VStack{
                        Text("시간 선택")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                
                                ForEach(timeArray.indices, id: \.self) {index in
                                    
                                    TimeView(oneTime: $timeArray[index], stateValue: $stateArray[index], pickTime: $pickTime, pickState: $pickState)
    //                                         , pickTimeState: $pickTimeSelected)
                                }
                            }

                        }
                                            
                    }
                    
                    Divider()
                        .frame(width: 200)
                        .padding()
//                    Spacer()
                    // 인원
                    VStack{
                        Text("인원 추가")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 2)
                        
                        Text("이 테마의 권장 인원 수는 ")
                            .foregroundColor(.gray)
                            .font(.body)
                        +
                        Text(String(format: "%0d", memberCnt))
                        +
                        Text("명입니다.")
                            .foregroundColor(.gray)
                            .font(.body)
                        
                        
                        ReservationPartyView()
                        
                        
                    }
                    
                    
                    
                    
//                    Divider()
                    
                    // 예약 버튼
                    ZStack{
                        NavigationLink(destination: ReservationDetailView(cafeText: cafeText, themeText: themeText, pickDate: pickDate, pickTime: pickTime
//                                                                          , shouldPopToRootView: self.$rootIsActive
                                                                         )
                                       , tag: 1, selection: self.$tagOfReservation ) {
                              EmptyView()
                            }
                            .isDetailLink(false)
                    }
                        
                    
                    
                }
            }
            
            Divider()
            
            
            
            Text(cafeText)
                .font(.title2)
                .fontWeight(.semibold)
            +
            Text(" 에서  ")
                .foregroundColor(.gray)
            +
            Text(themeText)
                .font(.title2)
                .fontWeight(.semibold)
            +
            Text(" 테마를")
                .foregroundColor(.gray)
            
            PickView(pickDate: $pickDate, oneTime: $pickTime, pickState: $pickState)
            
            Button(action: {
                self.tagOfReservation = 1
                
//                self.presentationMode.wrappedValue.dismiss()
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
                .cornerRadius(40)
            }
            .buttonStyle(MyButtonStyle())
            .disabled(!pickState)
            .padding()
            
            
        }
    }
}


// 날짜로 - 시간 필터링 함수
func getTime(date: String, cafeName: String, themaName: String, reserve: ReserveInfo) -> Bool {
    if date == reserve.reserveDate && cafeName == reserve.cafeName && themaName == reserve.themeName {
        return true
    } 
    return false
}

// 예약 가능 여부 반환 함수
func getState(code: Int, state: [ReserveState]) -> [Bool]{
    for value in state {
        if code == value.reserveCode {
            return value.reserveST
        }
    }
    return [false]
}

// 시간 View
struct MyButtonStyle: ButtonStyle {
    @State var color: Color = Color(red: 85/255, green: 32/255, blue: 132/255)
        @Environment(\.isEnabled) private var isEnabled: Bool
        
        func makeBody(configuration: Configuration) -> some View {
                configuration.label
//                .font(.title.bold())
//                .padding()
//                .frame(maxWidth: .infinity)
                .foregroundColor(isEnabled ? .white : Color(UIColor.systemGray3))
                .background(isEnabled ? color : Color(UIColor.systemGray5))
                .cornerRadius(20)
                .overlay {
                    if configuration.isPressed {
                        Color(white: 1.0, opacity: 0.2)
                            .cornerRadius(15)
                    }
                }
        }
}

struct TimeView: View {
    @Binding var oneTime: String
    @Binding var stateValue: Bool
    @Binding var pickTime: String
    @Binding var pickState: Bool
    
//    @Binding var pickTimeState: Int
    
    var body: some View {
        Button(action: {
            self.pickTime = oneTime
            self.pickState = true
            print("=====시간 선택======")
            print(pickTime)
        }) {
            HStack {
                Text(oneTime)
                    .fontWeight(.semibold)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .frame(width: 55, height: 20)
            .padding()
        }
        .buttonStyle(MyButtonStyle())
        .disabled(!stateValue)
        .onAppear(){
            print(stateValue)
        }
        
    }
}

//struct TimeListView: View {
//    @Binding var oneTime: String
//
//    var body: some View {
//        ZStack {
//            Color.white
//                .cornerRadius(12)
//            TimeView(oneTime: $oneTime)
//        }
//        .fixedSize(horizontal: false, vertical: true)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
//    }
//}


// 선택한 정보 표시
struct PickView: View {
    @Binding var pickDate: String
    @Binding var oneTime: String
    @Binding var pickState: Bool
    
//    var month = subString(str: pickDate, from: 6, to: 2)
//    var day = subString(str: pickDate, from: 9, to: 2)
//
//    var hour: String
//    var minute: String
    
    
    var body: some View {
        VStack {
            
            if pickState {
                //Text(pickDate)
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
                +
                Text("   ")
                    .foregroundColor(.gray)
                +
                Text(dateTimeSubString(str:oneTime, from:1, to:2))
                    .font(.title2)
                    .fontWeight(.semibold)
                +
                Text("시 ")
                    .font(.title2)
                    .fontWeight(.semibold)
                +
                Text(dateTimeSubString(str:oneTime, from:4, to:2))
                    .font(.title2)
                    .fontWeight(.semibold)
                +
                Text("으로  ")
                    .foregroundColor(.gray)
            } else {
                
            }
            
        }
        .padding(.top, 0.5)
        
    }
}

func dateTimeSubString(str: String, from: Int, to: Int) -> String {
    let startIndex = str.index(str.startIndex, offsetBy: from - 1)
    let endIndex = str.index(str.startIndex, offsetBy: from + to - 1)
    let range = startIndex..<endIndex
    
    if String(str[startIndex]) == "0" {
        
        
        if String(str[str.index(str.startIndex, offsetBy: from)]) == "0" {
            return "정각"
        }
        
        let startIndex2 = str.index(str.startIndex, offsetBy: from)
        let range2 = startIndex2..<endIndex
        
        return  String(str[range2])
    } else {
        if from == 4 {
            return String(str[range]) + "분"
        }
        return String(str[range])
    }
    
    
}

//func substring(from: Int, to: Int) -> String {
//
//        // Index 값 획득
//        let startIndex = index(self.startIndex, offsetBy: from)
//        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
//
//        // 파싱
//        return String(self[startIndex ..< endIndex])
//}

// 사용자 추가




//struct ReservationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationView()
//    }
//}
