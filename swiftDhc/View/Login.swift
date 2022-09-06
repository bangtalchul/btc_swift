//
//  Login.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/31.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import Firebase

struct Login: View {
    @StateObject var loginModel: LoginViewModel = .init()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 15){
                Image(systemName: "triangle")
                Text("hello world!")
                    .font(.title)
            }
            .padding(.leading, 60)
            if let clientID = FirebaseApp.app()?.options.clientID{
                GoogleSignInButton{
                    GIDSignIn.sharedInstance.signIn(with: .init(clientID: clientID), presenting: UIApplication.shared.rootController()){user, error in
                        if let error = error{
                            print(error.localizedDescription)
                            return
                        }
                        
                        if let user = user{
                            loginModel.logGoogleUser(user: user)
                        }
                        
                    }
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

