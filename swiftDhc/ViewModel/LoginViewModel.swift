//
//  LoginViewModel.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/31.
//

import SwiftUI
import Firebase
import AuthenticationServices
import GoogleSignIn

class LoginViewModel: ObservableObject {
    @Published var mo: String = ""
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_name") var userName: String = ""
    
    
    
    func handleError(error: Error) async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
    
    func logGoogleUser(user: GIDGoogleUser){
        Task{
            do{
                guard let idToken = user.authentication.idToken else {return}
                let accessToken = user.authentication.accessToken
//                let credential = OAuthProvider.credential(withProviderID: idToken, accessToken: accessToken)
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
                try await Auth.auth().signIn(with: credential)
//                print("success")
               
                let user = Auth.auth().currentUser
                if let user = user {
                  // The user's ID, unique to the Firebase project.
                  // Do NOT use this value to authenticate with your backend server,
                  // if you have one. Use getTokenWithCompletion:completion: instead.
                  let uid = user.uid
                  let email = user.email
                  let photoURL = user.photoURL
                  var multiFactorString = "MultiFactor: "
                  for info in user.multiFactor.enrolledFactors {
                    multiFactorString += info.displayName ?? "[DispayName]"
                    multiFactorString += " "
                  }
                  // ...
                }
                
                await MainActor.run(body: {
                    withAnimation(.easeInOut){
                        withAnimation(.easeInOut){logStatus = true; userName = user?.displayName ?? ""
                        }
                    }
                })
            }catch{
                await handleError(error: error)
            }
        }
    }
}

extension UIApplication{
    func rootController()->UIViewController{
        guard let window = connectedScenes.first as? UIWindowScene else{return .init()}
        guard let viwcontroller = window.windows.last?.rootViewController else {return .init()}
        
        return viwcontroller
    }
}






