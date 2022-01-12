//
//  SideBar.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct SideBar: View {
        @Binding var tabIdx:Int
        var body: some View {
                
                VStack(alignment: .center) {
                        Image("logo").resizable().frame(width: 40, height: 40)
                                .overlay {
                                        Circle().stroke(.purple, lineWidth: 2)
                                }
                                .shadow(radius: 4)
                        
                        Group{
                                if tabIdx == 0{
                                        Image("message_selected").resizable()
                                }else{
                                        Image("message_normal").resizable().onTapGesture {
                                                tabIdx = 0
                                        }
                                }
                                if tabIdx == 1{
                                        Image("contact_selected").resizable()
                                        
                                }else{
                                        Image("contact_normal").resizable().onTapGesture {
                                                tabIdx = 1
                                        }
                                }
                                if tabIdx == 2{
                                        Image("user_selected").resizable()
                                        
                                }else{
                                        Image("user_normal").resizable().onTapGesture {
                                                tabIdx = 2
                                        }
                                }
                        }
                        .frame(width: 35, height: 35)
                        .padding()
                        
                        Spacer()
                }
                .padding(.all)
        }
        
}

struct SideBar_Previews: PreviewProvider {
        
        @State static var tabIdx = 0
        static var previews: some View {
                SideBar(tabIdx: $tabIdx)
        }
}
