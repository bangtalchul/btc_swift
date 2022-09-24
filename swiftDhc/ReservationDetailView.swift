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
//    @Environment(\.presentationMode) var presentationMode2: Binding<PresentationMode>

//    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        
        
        VStack{
            
            
            
            VStack{
                
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color(red: 85/255, green: 32/255, blue: 132/255))
                    .padding(.top, 30)
                
                Text("예약이 완료되었습니다.")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
            }
            .padding()
            
            VStack{
            
                HStack {
                    
                    Text("카페 이름 : ")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    Spacer()
                    Text(cafeText)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("테마 : ")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    Spacer()
                    Text(themeText)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding([.top, .trailing])
                
                HStack {
                    Text("날짜 : ")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    Spacer()
                    Text(dateTimeSubString(str:pickDate, from:6, to:2))
                        .font(.headline)
                        .fontWeight(.semibold)
                    +
                    Text("월 ")
                        .font(.headline)
                        .fontWeight(.semibold)
                    +
                    Text(dateTimeSubString(str:pickDate, from:9, to:2))
                        .font(.headline)
                        .fontWeight(.semibold)
                    +
                    Text("일")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding(.top, 3)
                .padding([.trailing])
                
                HStack {
                    Text("시간 : ")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(width: 100)
                    Spacer()
                    Text(dateTimeSubString(str:pickTime, from:1, to:2))
                        .font(.headline)
                        .fontWeight(.semibold)
                    +
                    Text("시 ")
                        .font(.headline)
                        .fontWeight(.semibold)
                    +
                    Text(dateTimeSubString(str:pickTime, from:4, to:2))
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding(.top, 3)
                .padding([.trailing])
                
                
                ZStack{
                    NavigationLink(destination: MainView()
                                   , tag: 1, selection: self.$tagOfReservationDetail ) {
                          EmptyView()
                        }
//                        .isDetailLink(false)
                }
                
                Spacer()
                
                Button(action: {
                    self.tagOfReservationDetail = 1
//                    self.shouldPopToRootView = false
                    NavigationUtil.popToRootView()
//                    self.presentationMode2.wrappedValue.dismiss()
                  }) {
                    HStack {
//                        Image(systemName: "calendar")
//                            .font(.title)
//                        Text("예약확인")
                        Text("확   인")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .cornerRadius(40)
                }
                .buttonStyle(MyButtonStyle())
//                .padding()
            }
            .padding()
//            Text(cafeText)
        }
//        .padding()
    }
}

// RootView로 돌아가
import UIKit

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
return nil
    }
}

//
//struct ReservationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationDetailView()
//    }
//}
