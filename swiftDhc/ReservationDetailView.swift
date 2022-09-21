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
