//
//  Setting.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct SettingView: View {
        @State var nickName:String = ""
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
                        }.padding()
                        
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
                                        }.buttonStyle(.plain)
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Balance:")
                                        Spacer()
                                        Text("60.7NCT")
                                        Button() {
                                                print("save nickname")
                                        }label: {
                                                Label("Recharge", systemImage: "wallet.pass")
                                        }.buttonStyle(.plain)
                                }.padding()
                                
                                HStack{
                                        Text("Author Friend:")
                                        Spacer()
                                        Button() {
                                                print("Author friend")
                                        }label: {
                                                Label("Authorize", systemImage: "creditcard.and.123")
                                        }.buttonStyle(.plain)
                                }.padding()
                                
                        }.padding()
                        
                        Divider()
                        
                        VStack{
                                
                                HStack{
                                        Text("Address:")
                                        Spacer()
                                        Text("NJ7CovsxYjK3JgMwHVuTv86vHqgmhRpitrgzAj335AkiDi")
                                        Button() {
                                                print("Author friend")
                                        }label: {
                                                Image(systemName: "qrcode")
                                        }.buttonStyle(.plain)
                                        Button() {
                                                print("Copy")
                                        }label: {
                                                Image(systemName: "doc.on.doc")
                                        }.buttonStyle(.plain)
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Change Password:")
                                        Spacer()
                                        Button() {
                                                print("Change Password:")
                                        }label: {
                                                Image(systemName: "lock.circle")
                                        }.buttonStyle(.plain)
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Export Account:")
                                        Spacer()
                                        Button() {
                                                print("export account:")
                                        }label: {
                                                Image(systemName: "tray.and.arrow.up")
                                        }.buttonStyle(.plain)
                                        
                                }.padding()
                                
                                HStack{
                                        Text("Import Account:")
                                        Spacer()
                                        Button() {
                                                print("import account:")
                                        }label: {
                                                Image(systemName: "tray.and.arrow.down")
                                        }.buttonStyle(.plain)
                                        
                                }.padding()
                                
                        }.padding()
                        Divider()
                        HStack{
                                Button("Destroy Account") {
                                        print("import account:")
                                }
                                Spacer()
                                Button("New Account") {
                                        print("import account:")
                                }
                        }
                        Spacer()
                }.padding()
        }
}



struct Setting_Previews: PreviewProvider {
        static var previews: some View {
                SettingView()
        }
}
