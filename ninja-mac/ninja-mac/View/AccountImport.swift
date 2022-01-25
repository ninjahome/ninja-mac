//
//  CreateAccount.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import SwiftUI

struct AccountImport: View {
        
        @Binding var wJson:String
        @State var inputWalletStr:String = ""
        @ObservedObject var wallet:Wallet
        @State var showAuth:Bool=false
        @State var showTips:Bool=false
        @State var needDoubleCheck:Bool=false
        @State var alertMessage:String = ""
        @State var filePath:String = ""
        
        var body: some View {
                VStack{
                        HStack{
                                Text(filePath)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                Button{
                                        loadWalletQRFile()
                                }label: {
                                        Text("QR File")
                                        Image(systemName: "qrcode.viewfinder")
                                }
                                
                                Button{
                                        loadWalletJsonFromFile()
                                }label: {
                                        Text("Json File")
                                        Image(systemName: "folder")
                                }
                                
                        }.padding()
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
                                        alertMessage = "Input your wallet json string please!"
                                        return
                                }
                                showAuth = true
                                self.needDoubleCheck = false
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
                                              message: Text(alertMessage),
                                              dismissButton: .default(Text("OK")))
                                        
                                }
                        
                        Button(action: {
                                self.showAuth = true
                                self.needDoubleCheck = true
                        }, label:{
                                Text("Create Account")
                                        .font(.title3)
                                        .foregroundColor(Color(red: 0.339, green: 0.422, blue: 0.586))
                                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        }).buttonStyle(.borderless)
                                .background(.clear)
                                .cornerRadius(5)
                                .sheet(isPresented: $showAuth) {
                                        PasswordView(isVisible: $showAuth,
                                                     callback: self.createNewAccount,
                                                     doubleCheck: needDoubleCheck)
                                }
                        
                        Spacer()
                        
                }
                .padding(EdgeInsets(top: 30, leading: 35, bottom: 10, trailing: 35))
                .frame(width: 320, height: 480)
                .background(.white)
                .sheet(isPresented: $showAuth) {
                        PasswordView(isVisible: $showAuth,
                                     callback: self.unlockTheInputWalletJson,
                                     doubleCheck: false)
                }
        }
        private func loadWalletQRFile(){
                guard let url = pickFile(types: [.png, .jpeg]) else{
                        return
                }
                
                guard let img = CIImage(contentsOf: url) else{
                        return
                }
                if  let str = parseQR(image: img){
                        self.inputWalletStr = str
                        return
                }
        }
        private func loadWalletJsonFromFile(){
                guard let url = pickFile(types: [.json,.text]) else{
                        return
                }
                do{
                        let str = try String(contentsOf: url)
                        if str != ""{
                                self.inputWalletStr = str
                        }
                }catch let err{
                        print(err)
                }
        }
        
        private func unlockTheInputWalletJson(auth:String)->Error?{
                
                guard let err = LibWrap.ActiveWallet(auth: auth, Cpher: inputWalletStr)else{
                        wJson = inputWalletStr
                        wallet.address = LibWrap.WalletAddr() ?? ""
                        return nil
                }
                return err
        }
        
        private func createNewAccount(auth:String)->Error?{
                
                let (wStr, err) = LibWrap.NewWallet(auth: auth)
                if let e = err{
                        return e
                }
                
                wJson = wStr
                wallet.address = LibWrap.WalletAddr() ?? ""
                return nil
        }
}

struct CreateAccount_Previews: PreviewProvider {
        @State static var password: String = ""
        @StateObject  static var wallet:Wallet = Wallet()
        static var previews: some View {
                AccountImport(wJson: $password, wallet: wallet)
        }
}
