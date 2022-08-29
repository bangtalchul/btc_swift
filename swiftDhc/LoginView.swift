//
//  LoginView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/28.
//
import AuthenticationServices
import SwiftUI

//애플로그인하려면 개발자 결제해야함
struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""

    
    var body: some View {
        NavigationView{
            VStack{
                SignInWithAppleButton(.continue){ request in
                    
                    request.requestedScopes = [.email, .fullName]
                    
                } onCompletion: { result in
                    
                    switch result {
                    case.success(let auth):
                        switch auth.credential {
                        case let credential as ASAuthorizationAppleIDCredential:
                            let userId = credential.user
                            let email = credential.email
                            let firstName = credential.fullName?.givenName
                            let lastName = credential.fullName?.familyName
                            
                            self.email = email ?? ""
                            self.userId = userId
                            self.firstName = firstName ?? ""
                            self.lastName = lastName ?? ""
                            
                            
                        default:
                            break
                        }
                        
                    case .failure(let error):
                        print(error)
                        
                    }
                    
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                )
                .frame(height: 50)
                .padding()
                .cornerRadius(8)
            }
            .navigationTitle("Sign In")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
