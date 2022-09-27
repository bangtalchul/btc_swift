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
    var cafeTime: String
    var recomCafe: String
}

// 220828 정희 : 테마 정보 구조체 정의
public struct ThemaInfo: Identifiable {
    public var id = UUID()
    var cafeName: String
    var themaName: String
//    var themaKeyword: String
    var themaGenre: String
    var themaDescription: String
    var themaScore: Double
    var themaImageName: String
    var themaMember: Int
}

public struct UserInfo: Identifiable {
    public var id = UUID()
    var name: String
    var nickname: String
}

//public struct Review: Identifiable {
//    public var id = UUID()
//    var cafeName: String
//    var themaName: String
//    var userName: String // 닉네임
//    var reviewScore: Double
//    var reviewText: String
//}

public struct Review: Identifiable {
    public var id = UUID()
//    var cafeName: String
//    var themaName: String
    var userName: String // 닉네임
    var reviewScore: Double
    var reviewText: String
}

// 각각 코드로 매칭되어야 함
public struct PostInfo: Identifiable {
    public var id = UUID()
    var userName: String // 닉네임
    var postTitle: String
    var postText: String
    var postTime: String
}

public struct CommentInfo: Identifiable {
    public var id = UUID()
    var userName: String // 닉네임
    var commentText: String
    var commentTime: String
}

public struct ReserveInfo: Identifiable {
    public var id = UUID()
    var cafeName: String
    var themeName: String
    var reserveDate: String
    var reserveTime: [String]
    var reserveCode: Int
}

public struct ReserveState: Identifiable {
    public var id = UUID()
    var reserveCode: Int
    var reserveST: [Bool]
}

public struct BookingInfo: Identifiable {
    public var id = UUID()
    var userName: String
    var cafeName: String
    var themaName: String
    var bookingDate: String
    var bookingTime: String
}

// Sample Data
 

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

public var CafeInfoData = [CafeInfo(cafeName: "서울이스케이프룸", cafeLocation: "부산광역시 부산진구 183-1 쥬디스태화신관 3층", cafeScore: 4.9, cafeImage: "Store0", cafeTime: "11:00 ~ 23:00", recomCafe: "엘리베이터, 공장")
    
    ,CafeInfo(cafeName: "숨바꼭질 1호점", cafeLocation: "부산광역시 사하구", cafeScore: 4.3, cafeImage: "Store1", cafeTime: "09:00 - 23:00", recomCafe: "웨딩크루즈 살인사건")
                           , CafeInfo(cafeName: "숨바꼭질 2호점", cafeLocation: "부산광역시 강서구", cafeScore: 5.0, cafeImage: "Store2", cafeTime: "09:00 - 20:00", recomCafe: "없음")
                           , CafeInfo(cafeName: "비밀의화원 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 1.8, cafeImage: "Store3", cafeTime: "09:00 - 21:00", recomCafe: "저주받은 집, 반 고흐의 방")
                           , CafeInfo(cafeName: "비트포비아 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 2.4, cafeImage: "Store4", cafeTime: "09:00 - 22:30", recomCafe: "스토커")
                           , CafeInfo(cafeName: "룸즈에이 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 3.1, cafeImage: "Store5", cafeTime: "09:00 - 23:00", recomCafe: "웨딩크루즈 살인사건")
                           , CafeInfo(cafeName: "지구별방탈출 대구점", cafeLocation: "대구광역시", cafeScore: 4.6, cafeImage: "Store6", cafeTime: "09:00 - 23:00", recomCafe: "없음")
                           , CafeInfo(cafeName: "지구별방탈출 홍대점", cafeLocation: "서울특별시 어딘가", cafeScore: 5.0, cafeImage: "Store7", cafeTime: "10:00 - 23:00", recomCafe: "없음")
                           , CafeInfo(cafeName: "비밀의화원 시네마틱혜화점", cafeLocation: "서울특별시 어딘가2", cafeScore: 3.0, cafeImage: "Store1", cafeTime: "09:00 - 23:00", recomCafe: "없음")
                           , CafeInfo(cafeName: "비트포비아던전 서면점", cafeLocation: "부산광역시 부산진구", cafeScore: 4.7, cafeImage: "Store2", cafeTime: "10:00 - 22:00", recomCafe: "없음")
                             ]

public var ThemaInfoData = [ThemaInfo(cafeName: "서울이스케이프룸", themaName: "주차장", themaGenre: "#미스터리 #범죄 #공포", themaDescription: "크윽..\n\n머리가 깨질것 같은 극심한 두통에 눈을 뜬 당신. 머리로 손을 가져가려 하지만, 이내 두 손이 묶여 있다는 사실을 깨닫는다. 곧이어 깨달은 것은, 아무리 눈을 크게 떠도 아무것도 보이지 않는 칠흙같은 어둠. 당신은 이내 본인이 처한 상황을 빠르게 파악한다. 머리 위에 무언가 자루 같은게 쓰여있는 것 같다. 바닥에 맞닿은 등을 통해서는 차가운 금속의 냉기가 전해진다.\n\n나는 두 손이 묶인 체, 어딘가로 끌려온 것인가?\n\n잠깐.. 그런데 나..는 누구..지..? 윽!!\n\n순간 이 처한 상황 외에 이 세상에 대해 아무것도, 심지어 본인의 이름 조차도 기억이 나지를 않는다는 것을 깨닫고 패닉이 오려는 찰나, 다시 한번 밀려오는 머리가 깨질듯한 고통에 당신은 숨을 몰아쉰다. 한번 정신을 차리기 시작하자, 마치 그동안 까먹고 있었다는 듯이 고통이 밀려온다. 마치 누군가가 무거운 둔기로 머리통을 깨부수려고 한 것만 같다.\n\n몇분이나 지났을까? 욱신욱신 당겨오는 머리 뒤의 고통에 어느정도 익숙해진 당신은, 우선 두손이 묶인체 땅바닥에 굴러다니고 있는 이 빌어먹을 상황에서 벗어나기로 결심한다. 이상하게도, 일단 목표가 생기니 마치 언제 그랬냐는듯이 당신의 숨이 안정되며 몸에 힘이 도는 것 같다. 그래, 일단 이곳에서 벗어나자!", themaScore: 4.0, themaImageName: "Thema01", themaMember: 6)
    , ThemaInfo(cafeName: "비밀의화원 서면점", themaName: "반 고흐의 방",  themaGenre: "추리", themaDescription: "테스트~~~", themaScore: 3.8, themaImageName: "Thema3", themaMember: 4)
    , ThemaInfo(cafeName: "서울이스케이프룸", themaName: "공장", themaGenre: "#미스터리 #범죄 #공포", themaDescription: "조직이 비밀리에 운영하고 있던 고문실을 찾아내었을 뿐만 아니라, 고문실 내부로 침입하여 조직과 본인의 과거에 관한 진실을 알게 된 당신.\n\n그곳에서 당신은 지옥을 보았다.\n\n단순히 요원을 선발하여 교육하고 파견하는 것이 주 업무일줄 알았던 이 조직이, 사실은 그동안 힘없고 연고가 없는 일반인들을 납치하여 무단으로 감금, 폭행, 살인 등을 저질러왔다는 사실. 또한 사람들에게 불법적인 약물을 주입하여 인간병기로 만들고, 이 생체실험에서 나온 데이터를 토대로 전세계 테러리스트와 정부기관에 무기 판매를 하고 있다는 사실.\n\n당신은 더이상 이것은 개인적인 복수가 아니라는 것을 깨닫는다. 이 세상의 평화를 위해 이런 위험한 조직은 없어져야만 한다. 그것도 아주 흔적도 없이.\n\n불행인지 다행인지 당신의 머릿속에는 인간 병기로 교육받았던 당시의 폭탄 제조법이 고스란히 들어있다. 그래. 공장에 가기만 하면 그 곳의 화학 약품들을 이용해 강력한 폭탄을 제조할 수 있을 것이다. 다른 요원들이 들이닥치기 전에 시한폭탄을 만들어서 몰래 설치해두고 탈출하면..\n\n당신은 흥분과 두려움으로 두근거리는 가슴을 안고, 다시 한번 엘레베이터에 탑승하여 5층의 공장(FACTORY)으로 향한다..", themaScore: 4.0, themaImageName: "Thema04", themaMember: 6)
    , ThemaInfo(cafeName: "서울이스케이프룸", themaName: "타짜", themaGenre: "#미스터리 #범죄 #공포", themaDescription: "공장 내부 깊숙한 곳에 성공적으로 폭탄을 설치하고 나온 당신. 당신이 설치한 시한폭탄이 터지기 전까지 남은시간은 약 90분. 폭탄을 설치하고 서둘러 건물을 나서려는 당신에게 그동안 당신을 비밀리에 도와준 ‘R’ 에게서 새 음성메시지가 도착했다.\n\n“ T요원, 나야 R. 정말 고생 많았어. 당신의 활약 덕분에 지금 조직은 사상 초유의 비상사태를 선포하고 다들 당신을 잡기 위해 혈안이 되어있어. 나도 이제는 Z 에게 의심당하고 있어서 이게 당신에게 보내는 마지막 메시지가 될거야. 마지막으로 당신에게 한가지만 더 부탁할게. 사실 당신이 설치한 폭탄으로 이 건물이 폭파 되어도 조직에게 큰 타격을 주지는 못해. 그들은 그동안 온갖 불법적인 방법으로 어마어마한 부를 쌓아서 스위스 은행의 한 계좌에 축적해오고 있어. 건물 정도야 금방 다시 사겠지. 따라서 정말로 조직을 와해시키고자 한다면, 그들의 금융 자산을 마저 없애야만 해. 다시 한번 ‘엘레베이터’에 타고 6층으로 가봐. 그곳에 그들이 돈을 세탁하는데 이용하는 사설 VIP 도박장이 있어. 조직은 아직 당신이 공장에 있는 줄 알고 있고, 폭탄을 설치한 사실도 몰라. 아마 도박장은 여전히 영업 중일 거야. 도박장의 현재 딜러는 워낙에 속물이라 내가 매수하려고 했지만 자금이 부족해서 실패했어. 그가 부른 가격은 10만 달러야. 당신이 그를 매수할 수 만 있다면, 그는 나조차도 모르는 조직의 비밀을 말해줄거야. 행운을 빌어 T, 그동안 정말 고마웠어. 아마 나를 기억 못하겠지만 사실… 치지직…”\n\n음성 메시지가 갑자기 소음과 함께 끊겼다. 마지막에 R은 무슨 말을 하려던 거지? 윽.. 과거를 떠올리려는 당신에게 다시 극심한 두통이 찾아온다. 아니, 지금은 시간이 없다. 우선 R이 말한대로 도박장으로 향하자.\n\n띵- 엘레베이터 문이 열리면서 도박장의 고급스러운 인테리어가 눈에 들어온다. 이미 다른 VIP 손님들도 몇명 게임을 하고 있는 것 같다. 당신은 R이 준비해준 가방 안에 있던 $5,000 짜리 도박장 칩을 꽉 쥔 체 도박장 안으로 들어선다..", themaScore: 3.5, themaImageName: "Thema05", themaMember: 6)
    ,ThemaInfo(cafeName: "비밀의화원 서면점", themaName: "저주받은 집", themaGenre: "#공포", themaDescription: "무서운 테마 어쩌구 저쩌구", themaScore: 3.5, themaImageName: "Thema1", themaMember: 5)
                            , ThemaInfo(cafeName: "비밀의화원 서면점", themaName: "괴도 루키",  themaGenre: "드라마", themaDescription: "테스트임ㅁ미다~", themaScore: 4.5, themaImageName: "Thema2", themaMember: 3)
                            
                            , ThemaInfo(cafeName: "비트포비아 서면점", themaName: "스토커", themaGenre: "감동", themaDescription: "테스트~!!!~~", themaScore: 3.3, themaImageName: "Thema4", themaMember: 5)
                            , ThemaInfo(cafeName: "숨바꼭질 1호점", themaName: "웨딩크루즈 살인사건", themaGenre: "추리", themaDescription: "테스트 용요용~~", themaScore: 4.9, themaImageName: "Thema5", themaMember: 5)
    , ThemaInfo(cafeName: "서울이스케이프룸", themaName: "엘리베이터", themaGenre: "#미스터리 #범죄 #공포", themaDescription: "‘주차장’에서 자기 자신의 이름을 포함해 모든 과거의 기억을 잃은체 깨어난 당신. 머리에는 자루가 씌워지고, 손발이 묶인 상태에서 용케도 탈출에 성공하여 건물 안까지 침투하는데 성공했다. 그리고 그 과정 중에 당신은 세가지 사실을 알아내었다.\n\n1. 당신은 이 건물을 본부로 삼고 있는 조직에 의해 노려지고 있다는 것\n\n2. 당신 자신도 과거에 이 조직의 일원이었다는 것\n\n3. 누군가가 당신을 위해 조직에 침투하기 위한 단서들을 심어놨다는 것\n\n1번 사실은 너무나도 명백하다. 두통수가 깨진 체 끌려온 자신의 상황이 그 증거이다. 2번 사실은 주차장에서 찾은, 아마도 당신의 소지품인 것으로 추정되는 물건들을 통해 유추한 것이다. 아직 확인이 필요하다. 이상한 것은 3번이다. 주차장에서는 마치 당신이 이렇게 될줄 알기라도 한것 마냥 누군가가 여기저기에 단서들을 숨겨놓은 덕분에, 당신은 목숨을 부지할 수 있었을 뿐만 아니라 경비가 삼엄하기 그지없는 조직의 건물 내부로 침투할 수 있었던 것이다.\n\n나를 도와준 그 사람은 누구지? 아니 그보다 나는 누구지? 도대체 나를 왜 잡으려고 이러는거지?\n\n꼬리에 꼬리를 무는 생각을 뒤로하고, 당신은 건물 안에서 우선 엘레베이터에 탑승했다.\n\nGO TO THE 5th FLOOR (5층 으로 가라)\n\n‘주차장’에서 찾은 단서에는 분명히 그렇게 쓰여 있었다. 5층에는 도대체 뭐가 있는거지? 이게 혹시 함정인 것은 아닐까..? 어쩔수 없는 불안과 의심을 품은 체, 당신은 ‘5’ 라고 쓰여진 버튼을 향해 손을 뻗는다.", themaScore: 4.5, themaImageName: "Thema02", themaMember: 4)
    , ThemaInfo(cafeName: "서울이스케이프룸", themaName: "고문실", themaGenre: "#미스터리 #범죄 #공포", themaDescription: "침입을 감지한 조직에 의해 ‘엘레베이터’에 갇힐 뻔한 당신. 뛰어난 두뇌와 판단력으로 엘레베이터에서 탈출에 성공했을 뿐만 아니라, 조직의 건물 내에 존재하는 ‘비밀의 층’에 대한 정보를 얻는다.\n\n과연.. 조직은 건물 안에 비밀 층 같은걸 만들어서 뭘 했던 거지? 그리고 나는 어째서 그곳에 꼭 가본것만 같은.. 윽..\n\n과거를 기억해내려고 하면 어김없이 찾아오는 두통에 당신은 생각을 멈춘다. 확실하지는 않지만, 무의식 속 무언가가 당신으로 하여금 이 ‘비밀의 층’에 가야만 한다고 속삭인다. 이곳에 가면 나의 과거에 대한 정보가 있는게 아닐까? 당신은 손쉽게 엘레베이터 시스템을 해킹하고, 비밀층에 도달하는 방법을 찾아낸다.\n\n위이잉..\n\n엘레베이터를 조작하여 특정 방법으로 버튼을 누르자, 엘레베이터가 천천히 움직이기 시작한다. 엘레베이터가 움직이는 층수를 보여주는 까만 전광판 안에는, 단지 불길해보이는 빨간색 ‘X’ 표시가 떠있을 뿐이다.\n\n쿠웅...\n\n얼마나 지났을까? 이윽고 엘레베이터가 멈추고, 엘레베이터 문이 서서히 열린다.\n\n어둠. 그곳에는 어둠과, 고요. 그리고 진득한 죽음의 냄새를 풍기는 철문이 덩그러니 있었다. 기분 탓일까? 갑자기 추워진 듯한 냉기를 느끼며, 잔뜩 긴장한 당신은 마른 침을 삼키고 눈 앞의 녹슨 철문의 손잡이를 잡아 당긴다..\n\n본 테마는 '공포테마' 입니다! 심약자나 어린이, 임산부, 노약자의 입장은 받지 않습니다. 어두운 공간에서 드라마틱한 연출을 위해 피나 무서운 소리, 무서운 영상 등의 자극적인 콘텐츠가 있으니 예약시 미리 참고 바랍니다.", themaScore: 3.5, themaImageName: "Thema03", themaMember: 6)
                            ]

public var UserInfoData = [UserInfo(name: "박상혁", nickname: "상상쓰"), UserInfo(name: "손수현", nickname: "부산쌍칼"), UserInfo(name: "김정희", nickname: "정희입니다"), UserInfo(name: "김수현", nickname: "피자맥주어쩌고"), UserInfo(name: "문영화", nickname: "문무비"), UserInfo(name: "윤수빈", nickname: "bnk귀요미")]

//public var ReviewData = [Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[0].nickname, reviewScore: 4.8, reviewText: "진짜1도안무섭고굉장히EZ하네요 ㅋㅋㅋ")
//                         , Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[1].nickname, reviewScore: 3.2, reviewText: "난이도 무난해요")
//                         , Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[2].nickname, reviewScore: 2.7, reviewText: "초보한테는 너무 어려웠어요ㅜㅠ")
//                         ,Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[3].nickname, reviewScore: 5.0, reviewText: "오랜만에 진짜 재미있는 테마 즐긴 것 같아요!!")
//                         ,Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[4].nickname, reviewScore: 4.3, reviewText: "돈 값 했음")
//                         ,Review(cafeName: ThemaInfoData[0].cafeName, themaName: ThemaInfoData[0].themaName, userName: UserInfoData[5].nickname, reviewScore: 5.0, reviewText: "오랜만에 진짜 재미있는 테마 즐긴 것 같아요!!")]

public var ReviewData = [Review(userName: UserInfoData[0].nickname, reviewScore: 4.8, reviewText: "진짜1도안무섭고굉장히EZ하네요 ㅋㅋㅋ")
                         , Review(userName: UserInfoData[1].nickname, reviewScore: 3.2, reviewText: "난이도 무난해요")
                         , Review(userName: UserInfoData[2].nickname, reviewScore: 2.7, reviewText: "초보한테는 너무 어려웠어요ㅜㅠ")
                         ,Review(userName: UserInfoData[3].nickname, reviewScore: 5.0, reviewText: "오랜만에 진짜 재미있는 테마 즐긴 것 같아요!!")
                         ,Review(userName: UserInfoData[4].nickname, reviewScore: 4.3, reviewText: "돈 값 했음")
                         ,Review(userName: UserInfoData[5].nickname, reviewScore: 5.0, reviewText: "오랜만에 진짜 재미있는 테마 즐긴 것 같아요!!")]

public var PostInfoData = [PostInfo(userName: UserInfoData[0].nickname, postTitle: "서면 파티 구함", postText: "장르 안가림. \n같이 하실 분 구해여", postTime: "2022-08-31 19:00")
                           , PostInfo(userName: UserInfoData[1].nickname, postTitle: "수치플 당하고 옴", postText: "아니 입장할 때 CCTV보고 춤추면 힌투 준다고 했단 말이야? 그래서 춤 개 열심히 췄는데 힌트를 안주는거;; 근데 벨 누르고 췄었어야 했던거... 그냥 춤 열심히 춘 사람 됨", postTime: "2022-07-29 18:56")
                           , PostInfo(userName: UserInfoData[2].nickname, postTitle: "알려줄사람", postText: "부산에 추석에도 여는 카페 있어? ㅠㅜ", postTime: "2022-07-35 2:14")]

public var CommentInfoData = [CommentInfo(userName: UserInfoData[1].nickname, commentText: "저요저요", commentTime: "2022-08-31 19:10")
                              , CommentInfo(userName: UserInfoData[2].nickname, commentText: "언제 하나요?", commentTime: "2022-08-31 19:13")
                              , CommentInfo(userName: UserInfoData[3].nickname, commentText: "공포 테마 가실?", commentTime: "2022-08-31 19:15")
                              , CommentInfo(userName: UserInfoData[4].nickname, commentText: "서면 어디로 갈건뎅?", commentTime: "2022-08-31 19:25")]
public var cnt = CommentInfoData.count

public var ReserveInfoData = [ReserveInfo(cafeName: "비밀의화원 서면점", themeName: "저주받은 집", reserveDate: "2022-09-23", reserveTime: ["09:00", "11:30", "13:00", "14:30", "16:00", "17:30"], reserveCode: 100)
                          , ReserveInfo(cafeName: "비밀의화원 서면점", themeName: "저주받은 집", reserveDate: "2022-09-25", reserveTime: ["09:00", "11:30", "13:00", "14:30", "16:00", "17:30"], reserveCode: 101)
                              , ReserveInfo(cafeName: "비밀의화원 서면점", themeName: "저주받은 집", reserveDate: "2022-09-26", reserveTime: ["09:00", "11:30", "13:00", "14:30", "16:00", "17:30", "19:00"], reserveCode: 102)
                              , ReserveInfo(cafeName: "비밀의화원 서면점", themeName: "저주받은 집", reserveDate: "2022-09-28", reserveTime: ["09:00", "11:30", "13:00", "14:30", "16:00", "17:30"], reserveCode: 103)
                              , ReserveInfo(cafeName: "비밀의화원 서면점", themeName: "저주받은 집", reserveDate: "2022-09-30", reserveTime: ["09:00", "11:30", "13:00", "14:30", "16:00", "17:30"], reserveCode: 104)
, ReserveInfo(cafeName: "서울이스케이프룸", themeName: "주차장", reserveDate: "2022-09-27", reserveTime: ["11:00", "13:30", "15:00", "17:30", "19:00", "20:30", "22:00"], reserveCode: 105)
                              , ReserveInfo(cafeName: "서울이스케이프룸", themeName: "주차장", reserveDate: "2022-09-28", reserveTime: ["11:00", "13:30", "15:00", "17:30", "19:00", "20:30", "22:00"], reserveCode: 105)
                              , ReserveInfo(cafeName: "서울이스케이프룸", themeName: "주차장", reserveDate: "2022-09-29", reserveTime: ["11:00", "13:30", "15:00", "17:30", "19:00", "20:30", "22:00"], reserveCode: 106)
                              , ReserveInfo(cafeName: "서울이스케이프룸", themeName: "주차장", reserveDate: "2022-09-30", reserveTime: ["11:00", "13:30", "15:00", "17:30", "19:00", "20:30", "22:00"], reserveCode: 107)
                              , ReserveInfo(cafeName: "서울이스케이프룸", themeName: "주차장", reserveDate: "2022-10-01", reserveTime: ["11:00", "13:30", "15:00", "17:30", "19:00", "20:30", "22:00"], reserveCode: 108)
                              , ReserveInfo(cafeName: "서울이스케이프룸", themeName: "주차장", reserveDate: "2022-10-02", reserveTime: ["11:00", "13:30", "15:00", "17:30", "19:00", "20:30", "22:00"], reserveCode: 109)]

public var ReserveStateDate = [ReserveState(reserveCode: 100, reserveST: [true, true, true, true, false, false])
                               , ReserveState(reserveCode: 101, reserveST: [true, true, true, true, true, false, true])
                               , ReserveState(reserveCode: 102, reserveST: [false, true, true, true, false, false, true])
                               , ReserveState(reserveCode: 103, reserveST: [true, true, true, true, false, false])
                               , ReserveState(reserveCode: 104, reserveST: [true, true, true, true, true, false, true])
                               
                               , ReserveState(reserveCode: 105, reserveST: [false, false, false, false, false, false, true])
                               , ReserveState(reserveCode: 106, reserveST: [false, true, true, false, true, false, true])
                               , ReserveState(reserveCode: 107, reserveST: [true, false, false, true, true, false, true])
                               , ReserveState(reserveCode: 108, reserveST: [false, true, true, false, true, false, true])
                               , ReserveState(reserveCode: 109, reserveST: [false, false, true, false, true, false, true])
]
