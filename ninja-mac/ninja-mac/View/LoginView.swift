//
//  Login.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import SwiftUI

struct LoginView: View {
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
                                Button(action: {
                                        print("import account:")
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
                                        print("import account:")
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
                        
                }.padding()
                        .frame(width: 280, height: 372)
                        .background(Color(red: 0.969, green: 0.969, blue: 0.969))
        }
}

struct Login_Previews: PreviewProvider {
        static var previews: some View {
                LoginView()
        }
}
