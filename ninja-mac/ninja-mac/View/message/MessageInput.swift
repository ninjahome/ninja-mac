//
//  MessageInput.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/18.
//

import SwiftUI

struct MessageInput: View {
        @State var messageToSend:String=""
        
        var body: some View {
                VStack{
                        HStack{
                                Button(action: addItem) {
                                        Image(systemName: "face.smiling")
                                                .font(.custom("HelveticaNeue", size: 18))
                                }
                                Button(action: addItem) {
                                        Image(systemName: "folder")
                                                .font(.custom("HelveticaNeue", size: 18))
                                }
                                Button(action: addItem) {
                                        Image(systemName: "mic")
                                                .font(.custom("HelveticaNeue", size: 18))
                                }
                                Spacer()
                                Button(action: addItem) {
                                        Image(systemName: "ellipsis.bubble")
                                                .font(.custom("HelveticaNeue", size: 18))
                                }
                        }
                        .frame(height: 40)
                        .buttonStyle(.borderless)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        
                        TextEditor(text: $messageToSend)
                                .foregroundColor(Color.black)
                                .lineSpacing(5)
                                .font(.custom("HelveticaNeue", size: 13))
                        //                                .font(.title3)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -20))
                                .onSubmit {
                                        sendMsg()
                                }
                                .border(Color.black, width: 1)
                                .disableAutocorrection(true)
                        Spacer()
                }
                .background(Color(red: 0.952, green: 0.952, blue: 0.952))
        }
        
        
        private func addItem(){
                print("Edit button was tapped")
        }
        private func sendMsg(){
                print("prepare tor send message")
        }
}

struct MessageInput_Previews: PreviewProvider {
        static var previews: some View {
                MessageInput()
        }
}
