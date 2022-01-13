//
//  Contact.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct ContactView: View {
        var body: some View {
                VStack{
                        Button(action: {
                                print("Delete tapped!")
                        }){
                                Image("logo").resizable()
                        }
                        .buttonStyle(.plain)
                        .frame(width: 40, height: 40)
                        .background(.purple)
                }
        }
}

struct Contact_Previews: PreviewProvider {
        static var previews: some View {
                ContactView().frame(width: 880, height: 600, alignment: .center)
        }
}