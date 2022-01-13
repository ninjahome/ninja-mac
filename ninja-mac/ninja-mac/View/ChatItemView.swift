//
//  AvatarView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct ChatItemView: View {
        @State var name = "test"
        
        var body: some View {
                
                HStack{
                        Image(name)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .clipped()
                                .cornerRadius(5)
                        
                        VStack(alignment: .leading){
                                HStack{
                                        Text("name")
                                                .font(.title2)
                                        Spacer()
                                        Text("time")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                }
                                Text("details")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                        }
                }
                .padding(.all, 0.0)
                
        }
}

struct AvatarView_Previews: PreviewProvider {
        static var previews: some View {
                ChatItemView()
        }
}
