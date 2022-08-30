//
//  SampleData.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/23.
//

import Foundation

// 220828 정희 : 카페 정보 구조체 정희
// 필요시 Attribute 추가 (근데 다른 View도 수정해야함 ㅋㅋ)
// cafeCode attributr 추가해야 함 -> 카페 상세 뷰에서 테마 정보 요청할 때 필요
// 테마 정보 구조체에도 cafeCode 필요
public struct CafeInfo: Identifiable {
    public var id = UUID()
    var cafeName: String
    var cafeLocation: String
    var cafeScore: Double
    var cafeImage: String
}

// 220828 정희 : 테마 정보 구조체 정의
public struct ThemaInfo: Identifiable {
    public var id = UUID()
    var cafeName: String
    var themaName: String
    var themaKeyword: String
    var themaGenre: String
    var themaDescription: String
    var themaScore: Double
    var themaImageName: String
}

public struct UserInfo: Identifiable {
    public var id = UUID()
    var name: String
    var nickname: String
}

public struct Review: Identifiable {
    public var id = UUID()
    var cafeName: String
    var themaName: String
    var userName: String // 닉네임
    var reviewScore: Double
    var reviewText: String
}
 

public var CafeList = [
    "숨바꼭질 1호점",
    "비밀의화원 서면점",
    "비트포비아 서면점",
    "숨바꼭질 2호점",
    "룸즈에이 서면점",
    "지구별방탈출 대구점",
    "숨바꼭질 2호점",
    "숨바꼭질 3호점",
    "지구별방탈출 홍대점",
    "비밀의화원 시네마틱혜화점",
    "비트포비아던전 서면점"
]

//public var CafeInfoData = [CafeInfo(cafeName: "숨바꼭질 1호점", cafeLocation: "부산광역시 사하구", cafeScore: 4.3)
//                           , CafeInfo(cafeName: "숨바꼭질 2호점", cafeLocation: "부산광역시 강서구", cafeScore: 5.0)
//                           , CafeInfo(cafeName: "비밀의화원 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 1.8)
//                           , CafeInfo(cafeName: "비트포비아 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 2.4)
//                           , CafeInfo(cafeName: "룸즈에이 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 3.1)
//                           , CafeInfo(cafeName: "지구별방탈출 대구점", cafeLocation: "대구광역시", cafeScore: 4.6)
//                           , CafeInfo(cafeName: "지구별방탈출 홍대점", cafeLocation: "서울특별시 어딘가", cafeScore: 5.0)
//                           , CafeInfo(cafeName: "비밀의화원 시네마틱혜화점", cafeLocation: "서울특별시 어딘가2", cafeScore: 3.0)
//                           , CafeInfo(cafeName: "비트포비아던전 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 4.7)
//                             ]

public var CafeInfoData = [CafeInfo(cafeName: "숨바꼭질 1호점", cafeLocation: "부산광역시 사하구", cafeScore: 4.3, cafeImage: "CafeImageTest")
                           , CafeInfo(cafeName: "숨바꼭질 2호점", cafeLocation: "부산광역시 강서구", cafeScore: 5.0, cafeImage: "CafeImage")
                           , CafeInfo(cafeName: "비밀의화원 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 1.8, cafeImage: "CafeImageTest")
                           , CafeInfo(cafeName: "비트포비아 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 2.4, cafeImage: "CafeImage")
                           , CafeInfo(cafeName: "룸즈에이 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 3.1, cafeImage: "CafeImageTest")
                           , CafeInfo(cafeName: "지구별방탈출 대구점", cafeLocation: "대구광역시", cafeScore: 4.6, cafeImage: "CafeImage")
                           , CafeInfo(cafeName: "지구별방탈출 홍대점", cafeLocation: "서울특별시 어딘가", cafeScore: 5.0, cafeImage: "CafeImageTest")
                           , CafeInfo(cafeName: "비밀의화원 시네마틱혜화점", cafeLocation: "서울특별시 어딘가2", cafeScore: 3.0, cafeImage: "CafeImage")
                           , CafeInfo(cafeName: "비트포비아던전 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 4.7, cafeImage: "CafeImageTest")
                             ]

public var ThemaInfoData = [ThemaInfo(cafeName: "비밀의화원 서면점", themaName: "무고", themaKeyword: "활동성 낮음, 장치비율 보통, 2인용", themaGenre: "공포", themaDescription: "무서운 테마 어쩌구 저쩌구", themaScore: 3.5, themaImageName: "ThemaImageTest")
                            , ThemaInfo(cafeName: "비밀의화원 서면점", themaName: "테스트2", themaKeyword: "짱어려움", themaGenre: "드라마", themaDescription: "테스트임ㅁ미다~", themaScore: 4.5, themaImageName: "ThemaImageTest2")
                            , ThemaInfo(cafeName: "비밀의화원 서면점", themaName: "테스트3", themaKeyword: "짱쉬움", themaGenre: "추리", themaDescription: "테스트~~~", themaScore: 3.8, themaImageName: "ThemaImageTest3")
                            ]

public var UserInfoData = [UserInfo(name: "박상혁", nickname: "상상쓰"), UserInfo(name: "손수현", nickname: "부산쌍칼"), UserInfo(name: "김정희", nickname: "정희입니다"), UserInfo(name: "김수현", nickname: "피자맥주어쩌고"), UserInfo(name: "문영화", nickname: "문무비"), UserInfo(name: "윤수빈", nickname: "bnk귀요미")]

public var ReviewData = [Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[0].nickname, reviewScore: 4.8, reviewText: "진짜1도안무섭고굉장히EZ하네요 ㅋㅋㅋ")
                         , Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[1].nickname, reviewScore: 3.2, reviewText: "난이도 무난해요")
                         , Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[2].nickname, reviewScore: 2.7, reviewText: "초보한테는 너무 어려웠어요ㅜㅠ")
                         ,Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[3].nickname, reviewScore: 5.0, reviewText: "오랜만에 진짜 재미있는 테마 즐긴 것 같아요!!")]
