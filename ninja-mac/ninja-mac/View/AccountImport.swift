//
//  CreateAccount.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import SwiftUI
import ninjaLib


struct AccountImport: View {
        
        @Binding var wJson:String
        @State var inputWalletStr:String = ""
        @ObservedObject var wallet:Wallet
        @State var showAuth:Bool=false
        @State var showTips:Bool=false
        
        @State var callback:AuthCallBack? = nil
        
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
                        
                        Text("input json string of ninja wallet ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        
                        Spacer()
                        Button(action: {
                                if self.inputWalletStr == ""{
                                        showTips=true
                                        return
                                }
                                showAuth = true
                        }, label:{
                                Text("Import Ninja")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 7, leading: 60, bottom: 7, trailing: 60))
                        })
                                .buttonStyle(.borderless)
                                .background(Color(red: 0.03, green: 0.756, blue: 0.374))
                                .cornerRadius(5)
                                .alert(isPresented: $showTips){
                                        Alert(title: Text("Tips"),
                                              message: Text("Input your wallet json string please!"),
                                              dismissButton: .default(Text("OK")))
                                        
                                }
                        Spacer()
                        
                }.onAppear{
                        callback = {
                                pass in
                                
                                
                                
                                return true
                        }
                }
                .padding(EdgeInsets(top: 30, leading: 35, bottom: 10, trailing: 35))
                .frame(width: 320, height: 400)
                .background(.white)
                .sheet(isPresented: $showAuth) {
                        PasswordView(isVisible: $showAuth, callback: callback!)
                }
        }
}

struct CreateAccount_Previews: PreviewProvider {
        @State static var password: String = ""
        @StateObject  static var wallet:Wallet = Wallet()
        static var previews: some View {
                AccountImport(wJson: $password, wallet: wallet)
        }
}
