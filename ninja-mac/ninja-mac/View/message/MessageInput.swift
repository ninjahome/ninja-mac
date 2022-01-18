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
                                        Image(systemName: "face.smiling").font(.title2)
                                }
                                Button(action: addItem) {
                                        Image(systemName: "folder").font(.title2)
                                }
                                Button(action: addItem) {
                                        Image(systemName: "mic").font(.title2)
                                }
                                Spacer()
                                Button(action: addItem) {
                                        Image(systemName: "ellipsis.bubble").font(.title2)
                                }
                        }
                        .frame(height: 30)
                        .buttonStyle(.borderless)
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        
                        TextEditor(text: $messageToSend)
                                .font(.title3)
                                .buttonStyle(.borderless)
                                .padding(.trailing, -20)
                                .onSubmit {}
                                .disableAutocorrection(true).background(ignoresSafeAreaEdges: .trailing)
                }
                .background(Color(red: 0.952, green: 0.952, blue: 0.952))
        }
        
        
        private func addItem(){
                print("Edit button was tapped")
        }
}

struct MessageInput_Previews: PreviewProvider {
        static var previews: some View {
                MessageInput()
        }
}
