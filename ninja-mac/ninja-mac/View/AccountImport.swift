//
//  CreateAccount.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import SwiftUI

struct AccountImport: View {
        
        @Binding var wJson:String
        @State var password:String = ""
        @State var inputWalletStr:String = ""
        @ObservedObject var wallet:Wallet
        
        var body: some View {
                VStack{
                        TextEditor(text: $inputWalletStr)
                                .padding(EdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1))
                                .ignoresSafeArea()
                                .frame(height: 240)
                                .buttonStyle(.borderless)
                                .background(Color(red: 0.03, green: 0.756, blue: 0.374))
                                .colorMultiply(Color(red: 0.952, green: 0.952, blue: 0.952))
                                .cornerRadius(10)
                                .foregroundColor(Color.gray)
                                .font(.custom("HelveticaNeue", size: 13))
                                .textSelection(.enabled)
                        
                        
                Spacer().frame(height:10)
                        
                        SecureField(
                                "password",
                                text: $password,
                                onCommit: {
                                        print("onCommit:", self.password)
                                })
                                .font(.title2)
                                .buttonStyle(.plain)
//                                .frame(width: 200)
                                .padding(.all, 2)
                                .cornerRadius(6)
                        Spacer().frame(height:10)
                       
                        Text("input json string and password of ninja wallet ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        
                        
                
                Spacer()
                        Button(action: {
                                print("password of account:", password)
                        }, label:{
                                Text("Import Ninja")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 7, leading: 60, bottom: 7, trailing: 60))
                        })
                                .buttonStyle(.borderless)
                                .background(Color(red: 0.03, green: 0.756, blue: 0.374))
                                .cornerRadius(5)
                        
                        Spacer()
                        
                }.padding(EdgeInsets(top: 30, leading: 35, bottom: 10, trailing: 35))
                        .frame(width: 320, height: 460)
                        .background(.white)
        }
}

struct CreateAccount_Previews: PreviewProvider {
        @State static var password: String=""
        @StateObject  static var wallet:Wallet = Wallet()
        static var previews: some View {
                AccountImport(wJson: $password, wallet: wallet)
        }
}
