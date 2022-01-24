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
        @State var isHidden:Bool = false
        @State var balanceTx:String = ""
        
        
        var body: some View {
                VStack{
                        VStack{
                                Image("test").resizable()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                HStack{
                                        Button() {
                                                print("edit nickname")
                                        }label: {
                                                Label("Edit", systemImage: "square.and.pencil")
                                        }.buttonStyle(.plain)
                                        if !wallet.isVip(){
                                                Image("VIP")
                                        }
                                }
                        }.padding(.all, 10)
                        
                        Divider()
                        
                        VStack{
                                HStack{
                                        Text("NickName:")
                                        Spacer()
                                        TextField("taylor swift", text: $nickName)
                                        Button() {
                                                print("save nickname")
                                        }label: {
                                                Label("Save", systemImage: "square.and.arrow.down")
                                        }
                                        if !wallet.isVip(){
                                                Image("VIP")
                                        }
                                        
                                }.padding().disabled(!wallet.isVip())
                                
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
                                        if !wallet.isVip(){
                                                Image("VIP")
                                        }
                                }.padding()
                                
                        }.padding(.all, 10)
                        
                        Divider()
                        
                        VStack{
                                
                                HStack{
                                        Text("Address:")
                                        Spacer()
                                        Text(wallet.address)
                                        
                                }.padding()
                                
                                HStack{
                                        
                                        Button() {
                                                self.isShowQR = true
                                        }label: {
                                                Label("Show QR", systemImage: "qrcode")
                                        }
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
                                                Label("Copy Address", systemImage: "doc.on.doc")
                                        }
                                }.padding()
                                HStack{
                                        Button() {
                                                print("Change Password:")
                                        }label: {
                                                Label("Change Password", systemImage: "lock.circle")
                                        }
                                        Button() {
                                                print("export account:")
                                        }label: {
                                                Label("Export Account", systemImage: "tray.and.arrow.up")
                                        }
                                        
                                }.padding()
                                
                        }.padding(.all, 10)
                        
                        Divider()
                        
                        HStack{
                                Button() {
                                        print("import account:")
                                }label: {
                                        Label("Import Account", systemImage: "tray.and.arrow.down")
                                }
                                Spacer()
                                Button() {
                                        print("fresh account:")
                                }label: {
                                        Label("Reload Account", systemImage: "clock")
                                }
                                Spacer()
                                Button {
                                        print("import account:")
                                }label: {
                                        Label(("New Account"), systemImage: "person.crop.circle.badge.plus")
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
