//
//  Setting.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct SettingView: View {
        @EnvironmentObject var wallet:Wallet
        @State var nickName:String = ""
        @State var isShowQR:Bool = false
        @State var balanceTx:String = ""
        var body: some View {
                VStack{
                        VStack{
                                Image("test").resizable()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                Button() {
                                        print("edit nickname")
                                }label: {
                                        Label("Edit", systemImage: "square.and.pencil")
                                }.buttonStyle(.plain)
                        }.padding(.all, 10)
                        
                        Divider()
                        
                        VStack{
                                HStack{
                                        Text("NickName:")
                                        Spacer()
                                        TextField("tailor swift", text: $nickName)
                                        Button() {
                                                print("save nickname")
                                        }label: {
                                                Label("Save", systemImage: "square.and.arrow.down")
                                        }
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Balance:")
                                        Spacer()
                                        Text(balanceTx+"NCT")
                                        Button() {
                                                print("save nickname")
                                        }label: {
                                                Label("Recharge", systemImage: "bitcoinsign.circle")
                                        }
                                }.padding()
                                
                                HStack{
                                        Text("Author Friend:")
                                        Spacer()
                                        Button() {
                                                print("Author friend")
                                        }label: {
                                                Label("Authorize", systemImage: "creditcard.and.123")
                                        }
                                }.padding()
                                
                        }.padding(.all, 10)
                        
                        Divider()
                        
                        VStack{
                                
                                HStack{
                                        Text("Address:")
                                        Spacer()
                                        Text(wallet.address)
                                        Button() {
                                                self.isShowQR = true
                                        }label: {
                                                Image(systemName: "qrcode")
                                        }
                                        .buttonStyle(.plain)
                                        .sheet(isPresented:$isShowQR){
                                                QRCodeView(isVisible: $isShowQR,
                                                           txtContent: wallet.address)
                                        }
                                        Button() {
                                                let pasteBoard = NSPasteboard.general
                                                pasteBoard.clearContents()
                                                pasteBoard.setString(wallet.address, forType: .string)
                                                print("copy:", wallet.address)
                                                
                                        }label: {
                                                Image(systemName: "doc.on.doc")
                                        }
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Change Password:")
                                        Spacer()
                                        Button() {
                                                print("Change Password:")
                                        }label: {
                                                Image(systemName: "lock.circle")
                                        }
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Export Account:")
                                        Spacer()
                                        Button() {
                                                print("export account:")
                                        }label: {
                                                Image(systemName: "tray.and.arrow.up")
                                        }
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Import Account:")
                                        Spacer()
                                        Button() {
                                                print("import account:")
                                        }label: {
                                                Image(systemName: "tray.and.arrow.down")
                                        }
                                        
                                }.padding()
                                
                        }.padding(.all, 10)
                        
                        Divider()
                        
                        HStack{
                                Spacer()
                                Button("Destroy Account") {
                                        print("import account:")
                                }
                                Spacer()
                                Button("Fresh Account") {
                                        print("fresh account:")
                                }
                                Spacer()
                                Button("New Account") {
                                        print("import account:")
                                }
                                Spacer()
                        }
                        Spacer()
                }       .padding(EdgeInsets(top: 5, leading: 50, bottom: 5, trailing: 50))
                        .onAppear {
                                initViewStatus()
                        }.buttonStyle(.bordered)
        }
        
        private func initViewStatus(){
                balanceTx = LibWrap.ConvertBalance(balance: wallet.account.balance)
        }
}



struct Setting_Previews: PreviewProvider {
        @StateObject  static var wallet:Wallet = Wallet()
        static var previews: some View {
                SettingView().environmentObject(wallet)
        }
}
