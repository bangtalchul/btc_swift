//
//  CommunityDetailView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/08/31.
//

import SwiftUI

struct CommunityDetailView: View {
//    @State var structOfPost = PostInfoData
    @State var structOfPost = PostInfo(userName: "", postTitle: "", postText: "", postTime: "")//: PostInfo
    @State var structOfComment = CommentInfoData
    
    
    lazy var commentCnt = structOfComment.count
    
//    @State var test = ""
    
    var body: some View {
//        VStack{
//            Text("community detail")
//                .font(.title)
//
//            Text(test)
//                .font(.headline)
//                .foregroundColor(.black)
//        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        ScrollView() {
            VStack {
                PostDetailView(postInfo: $structOfPost)
                    .padding(.bottom, 10)
                
                Divider()
                
                ForEach($structOfComment) {
                    $valueComment in
                    VStack {
                        CommentListRow(commentInfo: $valueComment)
                            .foregroundColor(.black)
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .edgesIgnoringSafeArea(.all)
            }
            .padding()
        }
    }
}

struct PostDetailView: View {
    @Binding var postInfo: PostInfo
//    @Binding var commentInfo: CommentInfo
    
//    var cnt: Int
    var cnt = 3
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(postInfo.postTitle)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            HStack {
                Text(postInfo.userName)
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.darkGray))
                
                Spacer()
                
                Text(postInfo.postTime)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top:0, leading: 4, bottom: 0, trailing: 4))
            }
            
            
            Text(postInfo.postText)
                .font(.body)
                .foregroundColor(.black)
                .padding(EdgeInsets(top:2, leading: 4, bottom: 2, trailing: 4))
        }
        .padding()
    }
}

struct CommentView: View {
    @Binding var commentInfo: CommentInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(commentInfo.userName)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "ellipsis")
//                    .rotationEffect(Angle(degrees: 90))
                    .foregroundColor(Color(UIColor.darkGray))
            }
            
            
            Text(commentInfo.commentText)
                .font(.body)
                .foregroundColor(Color(UIColor.darkGray))
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top:2, leading: 4, bottom: 2, trailing: 4))
            
            HStack {
                Text(commentInfo.commentTime)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
        .padding()
    }
}

struct CommentListRow: View {
    @Binding var commentInfo: CommentInfo
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            CommentView(commentInfo: $commentInfo)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


struct CommunityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityDetailView()
    }
}
