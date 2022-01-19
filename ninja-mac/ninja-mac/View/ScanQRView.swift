//
//  CreateAccount.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import SwiftUI

struct ScanQRView: View {
        var body: some View {
                VStack{
                        Spacer()
                        Spacer()
                        Image("test")
                                .resizable()
                                .frame(width: 140, height: 140, alignment: .center)
                        
                        Spacer().frame(height:20)
                        Text("Scan from Ninja APP").font(.title2).foregroundColor(.green)
                        
                        Spacer().frame(height:10)
                        Text("Log in on phone to use Ninja for MAc").font(.subheadline).foregroundColor(.gray)
                        
                        Spacer()
                        Spacer()
                }.padding()
                        .frame(width: 280, height: 372)
                        .background(.white)
        }
}

struct CreateAccount_Previews: PreviewProvider {
        static var previews: some View {
                ScanQRView()
        }
}
