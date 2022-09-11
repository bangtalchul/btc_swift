//
//  ReservationDetailView.swift
//  swiftDhc
//
//  Created by 고양이 on 2022/09/06.
//

import SwiftUI

struct ReservationDetailView: View {
    var cafeText = ""
    var themeText = ""
    var pickDate = ""
    var pickTime = ""
    
    var pickPeople = [""]
    
    
    var body: some View {
        
        
        VStack{
            Text("한번 더 확인해 주세요.")
                .font(.title)
        }
    }
}

struct ReservationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailView()
    }
}
