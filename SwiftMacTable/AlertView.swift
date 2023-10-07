//
//  AlertView.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 7/10/23.
//

import SwiftUI

struct AlertView: View {
    @Binding var selection:UserData
    @Binding var selected:Bool
    var body: some View {
            VStack{
                HStack{
                    Text("Information Message").font(.largeTitle)
                }.frame(maxWidth:.infinity)
                    
                    Text("LastName:"+selection.lastname).padding(30)
                    Text("FirstName:"+selection.firstname).padding(30)
                    Text("Addres:"+selection.address).padding(30)
                    Text("Phone:"+selection.phone).padding(30)
                HStack{
                    Text("Dismiss").foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 62).frame(width: 300, height: 60, alignment: .center)
                        .foregroundStyle(.blue)
                    }.onTapGesture {
                        selected.toggle()
                    }
                }.frame(width: 300, height: 60, alignment: .center)

            }.frame(width:600,height:470)
    }
}

#Preview {
    AlertView(selection: .constant(.init(lastname: "", firstname: "", address: "", phone: "")), selected: .constant(false))
}
