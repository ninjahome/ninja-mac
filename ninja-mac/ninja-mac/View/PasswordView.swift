//
//  PassWordView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import SwiftUI
typealias AuthCallBack = (String)->Error?
struct PasswordView: View {
        @Binding var isVisible: Bool
        @State var password: String = ""
        @State var errorTips: String?
        var callback:AuthCallBack?
        var body: some View {
                
                VStack {
                        
                        Spacer()
                        Text("Enter Password")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        if self.errorTips != nil{
                                
                                Text(errorTips!).font(.body).foregroundColor(.red)
                        }
                        Spacer()
                        SecureField(
                                "password",
                                text: $password,
                                onCommit: {
                                        print("onCommit:", self.password)
                                })
                                .font(.title2)
                                .buttonStyle(.plain)
                                .padding(.all, 2)
                                .cornerRadius(6)
                        
                        Spacer()
                        HStack {
                                Spacer()
                                Button("Cancel") {
                                        self.isVisible = false
                                }
                                Spacer()
                                Button("OK") {
                                        guard let cb = callback else{
                                                self.isVisible = false
                                                return 
                                        }
                                        guard let err = cb(password) else{
                                                self.isVisible = false
                                                return
                                        }
                                        self.errorTips = err.localizedDescription
                                }
                                Spacer()
                        }
                        
                        Spacer()
                }
                .frame(width: 200, height: 200)
                .padding()
        }
}

struct PassWordView_Previews: PreviewProvider {
        static var previews: some View {
                PasswordView(isVisible: .constant(true), callback: {
                        pass in
                        return NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Any test"])
                })
        }
}
