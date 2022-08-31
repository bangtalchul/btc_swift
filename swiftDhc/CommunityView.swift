//
//  CommunityView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/28.
//

import SwiftUI

struct CommunityView: View {
    
    @State var structOfPost = PostInfoData
    @State var structOfComment = CommentInfoData
    
//    var commentCnt = structOfComment.count
    
    var commentCnt = 3
    
    var body: some View {
        ScrollView {

            VStack {
                HStack {
                    Text("수다방")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(EdgeInsets(top:0, leading: 10, bottom:0, trailing: 10))
                
                Spacer()
                
                ForEach($structOfPost) {$valuePostInfo in
                    VStack{
                        NavigationLink(destination: CommunityDetailView(test: "hello"))
                        {
                            PostListRow(postInfo: $valuePostInfo, cnt: commentCnt)
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .edgesIgnoringSafeArea(.all)
                
                
            }
            .padding()
            Text("community view")
        }
    }
}

// 게시물 보여주기
struct PostSummaryView: View {
    @Binding var postInfo: PostInfo
//    @Binding var commentInfo: CommentInfo
    
    var cnt: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(postInfo.postTitle)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Spacer()
                
                Text(postInfo.postTime)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Text(postInfo.userName)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.leading, 4)
                //.padding(EdgeInsets(top:0.1, leading: 4, bottom: 0, trailing: 0))
            
            Text(postInfo.postText)
                .font(.body)
                .foregroundColor(Color(UIColor.darkGray))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top:2, leading: 4, bottom: 2, trailing: 4))
            
            HStack {
                Spacer()
                
                HStack {
                    Image(systemName: "bubble.right")
                        .foregroundColor(Color(red: 85/255, green: 32/255, blue: 132/255))
                        .font(.caption)
                    Text(String(format: "%0.f", cnt))
                        .foregroundColor(Color(red: 85/255, green: 32/255, blue: 132/255))
                        .font(.caption)
                }
            }
        
            
        }
        .padding()
        
    }
}


struct PostListRow: View {
    @Binding var postInfo: PostInfo
//    @Binding var commentInfo: CommentInfo
    
    var cnt: Int
    
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(12)
            PostSummaryView(postInfo: $postInfo, cnt: cnt)
        }
        .fixedSize(horizontal: false, vertical: true)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}


struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
