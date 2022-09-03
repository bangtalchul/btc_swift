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

    
    
    
    func handleError(error: Error) async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
    
    func logGoogleUser(user: GIDGoogleUser){
        print("11111")
        Task{
            do{
                print("22222")
                guard let idToken = user.authentication.idToken else {return}
                let accessToken = user.authentication.accessToken
//                let credential = OAuthProvider.credential(withProviderID: idToken, accessToken: accessToken)
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
                try await Auth.auth().signIn(with: credential)
                print("success")
                await MainActor.run(body: {
                    withAnimation(.easeInOut){
                        withAnimation(.easeInOut){logStatus = true}
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






