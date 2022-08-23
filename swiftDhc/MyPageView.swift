//
//  MyPageView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/24.
//

import SwiftUI

struct MyPageView: View {
    var UserImageName = "UserImageTest"
    var UserName: String = "핑구"
    var UserIntroduce: String = "즐거운 방탈출!"
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                //Image(systemName: "gearshape")
                Image(systemName: "gearshape.fill")
                    .foregroundColor(Color.black)
                Text("수정하기")
                    //.padding(.trailing, 20)
                    
            }
            . padding(EdgeInsets(top: 0, leading:0, bottom: 130, trailing: 20))
                
            UserImage
                .padding()
            UserInfo
        }
    }
    
}

private extension MyPageView {
    // 유저 이미지
    var UserImage: some View {
        CircleImage(image: Image(UserImageName))
            .offset(y: -130)
            .padding(.bottom, -130)
    }
    
    
    //1. (alignment: .leading)
    
    // 유저 정보
    var UserInfo: some View {
        VStack {
            Text(UserName)
                .font(.title)

            HStack(alignment: .top) {
                Text(UserIntroduce)
                    .font(.subheadline)
                //Spacer()
            }
            .padding(.top, 5)
        }
        .padding()
        
    }
    
}

// 프로필 이미지 구조체
struct CircleImage: View {
    var image: Image
    var imageHW: CGFloat = 300
    
    var body: some View {
        image
            .resizable()
            .frame(width: imageHW, height: imageHW)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
    }
}

// 연결 기능 (예약 내역, 최근 이용 내역, 리뷰 내역)
// 따로 뺄까...



struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}