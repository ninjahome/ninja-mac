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
                    Group{
                    Button(action: {
                            
                    }) {
                            Image("message_normal").resizable()                    }
                            
                    Button(action: {
                            
                    }) {
                            Image("contact_normal").resizable()
                    }
                    
                    Button(action: {
                            
                    }) {
                            Image("user_normal").resizable()
                    }
                    }
                    .frame(width: 35, height: 35)
                    .buttonStyle(.plain)
                    
                    
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
