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
            Text("예약 확인")
                .font(.title)
        }
    }
}

struct ReservationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailView()
    }
}
