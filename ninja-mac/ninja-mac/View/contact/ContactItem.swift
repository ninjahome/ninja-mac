//
//  ContactItem.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/18.
//

import SwiftUI

struct ContactItem: View {
        @State var name = "test"
        var body: some View {
                
                HStack{
                        Image(name)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .clipped()
                                .cornerRadius(5)
                        
                        VStack(alignment: .leading){
                                HStack(){
                                        Text("name")
                                                .font(.title2)
                                        
                                        Spacer()
                                        Text("time")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                }
                                Spacer().frame(height: 5)
                                Text("details")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                        }
                        .frame(height: 35)
                }
                .padding(EdgeInsets(top: 12, leading: 5, bottom: 12, trailing: 3))
                
        }
}

struct ContactItem_Previews: PreviewProvider {
        @State static var selected:Bool=true
        @State static var selected2:Bool=false
    static var previews: some View {
        ContactItem()
            ContactItem()
    }
}
