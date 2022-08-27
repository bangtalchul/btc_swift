//
//  SampleData.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/23.
//

import Foundation

// 카페 정보 구조체
public struct CafeInfo: Identifiable {
    public var id = UUID()
    var cafeName: String
    var cafeLocation: String
    var cafeScore: Double
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

public var CafeInfoData = [CafeInfo(cafeName: "숨바꼭질 1호점", cafeLocation: "부산광역시 사하구", cafeScore: 4.3)
                           , CafeInfo(cafeName: "숨바꼭질 2호점", cafeLocation: "부산광역시 강서구", cafeScore: 5.0)
                           , CafeInfo(cafeName: "비밀의화뭔 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 1.8)
                           , CafeInfo(cafeName: "비트포비아 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 2.4)
                           , CafeInfo(cafeName: "룸즈에이 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 3.1)
                           , CafeInfo(cafeName: "지구별방탈출 대구점", cafeLocation: "대구광역시", cafeScore: 4.6)
                           , CafeInfo(cafeName: "지구별방탈출 홍대점", cafeLocation: "서울특별시 어딘가", cafeScore: 5.0)
                           , CafeInfo(cafeName: "비밀의화원 시네마틱혜화점", cafeLocation: "서울특별시 어딘가2", cafeScore: 3.0)
                           , CafeInfo(cafeName: "비트포비아던전 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 4.7)
                             ]
