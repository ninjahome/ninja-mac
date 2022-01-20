//
//  PassWordView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import SwiftUI
typealias AuthCallBack = (String)->Bool
struct PasswordView: View {
        @Binding var isVisible: Bool
        @State var password: String = ""
        var callback:AuthCallBack
        var body: some View {
                
                VStack {
                        
                        Spacer()
                        Text("Enter some text below…")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        
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
                                        self.isVisible = false
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
                        return false
                })
        }
}
