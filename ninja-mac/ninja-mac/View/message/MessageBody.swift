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
        var test:String = """
It looks as expected, but if you place your finger within image boundaries the scrolling of the list doesn't work (if you try to scroll outside the image it works fine)

I've tried to add .allowsHitTesting(false) right after opacity, but it doesn't change anything.

Using ZStack instead of overlay doesn't help too. The only workaround I've found is to use ZStack, place the image behind the list and make the list semi-transparent, but it's not the solution I'm looking for (it changes the colors of the list slightly and causes some issues with animations).

Is there a way to make it work? Like making the image pass events to the list in the background or something.
"""
        var body: some View {
                ScrollViewReader { proxy in
                        ScrollView(.vertical, showsIndicators: showIndicator) {
                                VStack(spacing: 20) {
                                        MessageView(content:"ssss", isSender: true)
                                        MessageView(content:"ssss", isSender: true)
                                        MessageView(content:"bbbb", isSender: false)
                                        MessageView(content:"bbbb", isSender: false)
                                        ForEach(0..<100) {
                                                i in
                                                if i % 2 == 0{
                                                        MessageView(content:test, isSender: true)
                                                }else{
                                                        MessageView(content:test, isSender: false)
                                                }
                                        }
                                }
                                .background(Color(red: 0.952, green: 0.952, blue: 0.952))
                                .frame(maxWidth:.infinity, maxHeight: .infinity)
                                
                                //                                Button("Top") {
                                //                                        withAnimation {
                                //                                                proxy.scrollTo(topID)
                                //                                        }
                                //                                }
                                //                                .id(bottomID)
                        }
                }
        }
}

struct ContentMessageView:View{
        var content:String
        var isSender:Bool
        var body:some View{
                HStack{
                        if isSender{
                                Spacer().frame(minWidth: 20, maxWidth: 80)
                        }
                        Text(content)
                                .padding(10)
                                .foregroundColor(isSender ? Color.white : Color.black)
                                .background(isSender ? Color.blue: Color.purple)
                                .cornerRadius(10)
                        
                        if !isSender{
                                Spacer().frame(minWidth: 20, maxWidth: 80)
                        }
                }
        }
}

struct MessageView : View{
        var content:String
        var isSender:Bool
        var body: some View{
                HStack(alignment: .bottom, spacing: 1.5) {
                        if !isSender{
                                Image("test")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .cornerRadius(4).onTapGesture {
                                                print("avatar tap ")
                                        }
                                ContentMessageView(content: content, isSender: isSender).onTapGesture {
                                        print("msg tap ")
                                }
                                Spacer()
                        }else{
                                Spacer()
                                ContentMessageView(content: content, isSender: isSender).onTapGesture {
                                        print("msg tap ")
                                }
                                Image("test")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                        .cornerRadius(4).onTapGesture {
                                                print("avatar tap")
                                        }
                        }
                }
        }
}

struct ChatBody_Previews: PreviewProvider {
        static var previews: some View {
                MessageBody()
                //                MessageView(content: "Hi, I am your Friend", isSender: true)
                //                MessageView(content: "Hi, I am your Friend", isSender: false)
        }
}
