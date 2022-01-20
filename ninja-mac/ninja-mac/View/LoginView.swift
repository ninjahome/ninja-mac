//
//  Login.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import SwiftUI
let testStr:String="""
{
        "address": "NJ5Y3w9m9Bhxw9phnGhm3TRoBanF3mr91TQNjciMnAEuFg",
        "crypto": {
                "cipher": "aes-128-ctr",
                "ciphertext": "d37f0efb613035771fe73a5a38e23046792b5da3daea52c58deddad1620dc5d9b684ba345e7e05dbe9821fdeb400c84825c5fdb7fcb99b96c29bda62f64ec8f8",
                "cipherParams": {
                        "iv": "e110e9c914e32dd039f865acfae33fa0"
                },
                "kdf": "scrypt",
                "kdfParams": {
                        "dklen": 32,
                        "n": 262144,
                        "p": 1,
                        "r": 8,
                        "salt": "0bfdfe0f145dfe8344d3eaf7e8732b0daea944c9f1f5cf5cae9069b517d1fb71"
                },
                "mac": "cab3dc5b039b41afbf083e8134c783d7d978f8cf4a24da73f0a712323bee1165"
        },
        "id": "6afcf0d4-0fd6-44bc-b8cd-df328924a60d",
        "version": 1
}
"""
struct LoginView: View {
        @Binding var wJson:String
        @State var password:String = ""
        @ObservedObject var wallet:Wallet
        
        var body: some View {
                VStack{
                        Spacer()
                        VStack{
                                Image("test")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                Text("NickName")
                                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                                        .font(.title3)
                        }.padding()
                        
                        Spacer()
                        
                        VStack{
                                SecureField(
                                        "password",
                                        text: $password,
                                        onCommit: {
                                                print("onCommit:", self.password)
                                        })
                                        .font(.title2)
                                        .buttonStyle(.plain)
                                        .padding(.all)
                                        .cornerRadius(6)
                                
                                Button(action: {
                                        print("password of account:", password)
                                }, label:{
                                        Text("Enter Ninja")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                                .padding(EdgeInsets(top: 7, leading: 60, bottom: 7, trailing: 60))
                                })
                                        .buttonStyle(.borderless)
                                        .background(Color(red: 0.03, green: 0.756, blue: 0.374))
                                        .cornerRadius(5)
                                
                                Button(action: {
                                        switchToImportScene()
                                }, label:{
                                        Text("Switch Account")
                                                .font(.title3)
                                                .foregroundColor(Color(red: 0.339, green: 0.422, blue: 0.586))
                                                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                })
                                        .buttonStyle(.borderless)
                                        .background(.clear)
                                        .cornerRadius(5)
                                
                        }.padding()
                        
                        Spacer()
                        
                }
                .padding()
                .frame(width: 280, height: 372)
                .background(Color(red: 0.969, green: 0.969, blue: 0.969))
                .onAppear {
                        print(self.wJson)
                        let decoder = JSONDecoder()
                }
        }
        
        private func switchToImportScene(){
                self.wJson = ""
        }
}

struct Login_Previews: PreviewProvider {
        @State static var password: String=""
        @StateObject  static var wallet:Wallet = Wallet()
        @AppStorage("cache_account_json") static var walletJson: String = testStr
        static var previews: some View {
                LoginView(wJson: $walletJson, password: password, wallet: wallet)
        }
}
