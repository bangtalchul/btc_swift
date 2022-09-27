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
        VStack{
            Image("dhcLogo")
            
            HStack(spacing: 8){
                HStack{
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(height: 45)
                    
                    Text("Google Sign In")
                        .font(.callout)
                        .lineLimit(1)
                    
                }
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.black)
                }
                .overlay{
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
                                                .frame(height: 55)
                                                .blendMode(.overlay)
                    }

                }
                .clipped()
            }
           
        HStack(spacing: 8){
            HStack{
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(height: 45)
                
                Text("Google Sign In")
                    .font(.callout)
                    .lineLimit(1)
                
            }
            .foregroundColor(.white)
            .padding(.horizontal, 15)
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.black)
            }
            .overlay{
                
                    
            }
            .frame(height: 55)
            .blendMode(.overlay)
        }
        .clipped()

    }
}
    
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

