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
                ScrollViewReader { proxy in
                        ScrollView(.vertical, showsIndicators: showIndicator) {
                                VStack(spacing: 10) {
                                        ForEach(0..<100) { i in
                                                
                                                if i % 2 == 0{
                                                       
                                                        Text("sss")
                                                                .id(i)
                                                                .onTapGesture {
                                                                        print("sss")
                                                                }
                                                                .frame(maxWidth:.infinity,minHeight:50, maxHeight: 60)
                                                                .background(.purple).cornerRadius(5)
                                                }else{
                                                        Text("bbbb")
                                                                .id(i)
                                                                .onTapGesture {
                                                                        print("bbb")
                                                                } .frame(maxWidth:.infinity,minHeight:50, maxHeight: 60)
                                                                .background(.green)
                                                                .cornerRadius(5)
                                                }
                                        }
                                }
                                .frame(maxWidth:.infinity, maxHeight: .infinity)
                                
//                                Button("Top") {
//                                        withAnimation {
//                                                proxy.scrollTo(topID)
//                                        }
//                                }
//                                .id(bottomID)
                        }
                }
                .background(.red)
        }
}

struct ChatBody_Previews: PreviewProvider {
        static var previews: some View {
                MessageBody()
        }
}
