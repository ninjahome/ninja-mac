//
//  SideBar.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
            VStack(alignment: .center) {
                    Image("logo").resizable().frame(width: 40, height: 40)
                    .overlay {
                            Circle().stroke(.purple, lineWidth: 2)
                    }
                    .shadow(radius: 4)
                    
                    Button(action: {
                            
                    }) {
                                    
                            Image("message_normal")
                            
                    }
                            
                    Button(action: {
                            
                    }) {
                            Image("contact_normal")
                    }
                    
                    Button(action: {
                            
                    }) {
                            Image("user_normal")
                    }
                    
                    Spacer()
            }
            .padding(.all)
            .frame(width: 60)
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
