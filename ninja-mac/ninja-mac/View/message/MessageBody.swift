//
//  ChatBody.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/14.
//

import SwiftUI

struct MessageBody: View {
        @Namespace var topID
        @Namespace var bottomID
        @State var showIndicator:Bool = true
        
        var body: some View {
                VSplitView{
                        ScrollViewReader { proxy in
                                ScrollView(.vertical, showsIndicators: showIndicator) {
                                        Button("Scroll to Bottom") {
                                                withAnimation {
                                                        proxy.scrollTo(bottomID)
                                                }
                                        }
                                        .id(topID)
                                        
                                        VStack(spacing: 0) {
                                                ForEach(0..<100) { i in
                                                        if i % 2 == 0{
                                                                Text("sss").id(i)
                                                        }else{
                                                                Text("bbbb").id(i)
                                                        }
                                                }
                                        }
                                        
                                        Button("Top") {
                                                withAnimation {
                                                        proxy.scrollTo(topID)
                                                }
                                        }
                                        .id(bottomID)
                                }
                                //                    .frame(maxWidth: .infinity, maxHeight: .infinity).background(.red)
                        }
                        .padding(.all, 0.0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity).background(.red)
                        
                        MessageInput()
                                .frame(maxWidth: .infinity, minHeight: 150, idealHeight: 200, maxHeight: 350)
                }
        }
}

struct ChatBody_Previews: PreviewProvider {
        static var previews: some View {
                MessageBody()
        }
}
