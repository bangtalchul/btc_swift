//
//  ReservationPartyView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/09/17.
//

import SwiftUI

struct ReservationPartyView: View {
    // hard coding.,,,
    var memberName = "김정희"
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack {
            
            ZStack {
                Color.gray.opacity(0.2)
                    .cornerRadius(12)
                
                LeaderView(memberN: memberName)
            }
            .fixedSize(horizontal: false, vertical: true)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .foregroundColor(.gray)
            .padding()
            .edgesIgnoringSafeArea(.all)
            
            
            MemberListRow(memberN: memberName)
                .padding()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                
            }) {
                Image(systemName: "plus")
            }
            .buttonStyle(MyButtonStyle())
        }
        
        
    }
}

struct LeaderView: View {
    var memberN: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 20)
            Text(memberN)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
            
            
//            Button(action: {
//
//            }) {
//                Text("리더")
//                    .font(.headline)
//                    .foregroundColor(.white)
//            }
////            .background(Color(red: 85/255, green: 32/255, blue: 132/255))
////            .cornerRadius(12)
////            .padding()
//            .buttonStyle(MyButtonStyle())
            
            Text("리더")
                .foregroundColor(Color(red: 85/255, green: 32/255, blue: 132/255))
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer().frame(width: 20)
        }
        .padding()
    }
}


struct MemberView: View {
    var memberN: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 20)
            Text(memberN)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
            }
            
            Spacer().frame(width: 20)
            
        }
        .padding()
    }
}

struct MemberListRow: View {
    var memberN: String
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            
            MemberView(memberN: memberN)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .foregroundColor(.gray)
    }
}



//struct ReservationPartyView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationPartyView()
//    }
//}
