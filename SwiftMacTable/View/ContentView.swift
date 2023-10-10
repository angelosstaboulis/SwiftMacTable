//
//  ContentView.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = Set<UserData.ID>()
    @State private var isPresented = false
    @State var selectionUser:UserData
    @StateObject var viewModel = UserDataViewModel()
    @State var userArray:[UserData] = []
    var body: some View {
        Table(userArray,selection: $selection){
            TableColumn("Record"){record in
                HStack(alignment:.firstTextBaseline, content: {
                    Text(record.lastname).frame(maxWidth:.infinity)
                    Text(record.firstname).frame(maxWidth:.infinity)
                    Text(record.address).frame(maxWidth:.infinity)
                    Text(record.phone).frame(maxWidth:.infinity)
                })
            }
    
        }.onReceive(selection.publisher) { output in
            selectionUser = checkUUID(uuid: output.hashValue)!
            if selectionUser.lastname.count > 0 {
                    isPresented = true
            }
        }.popover(isPresented: $isPresented) {
            AlertView(selection: $selectionUser, selected: $isPresented)

        }.onAppear {
           
                userArray.append(contentsOf:viewModel.getUserData())
            
        }

    }
    func checkUUID(uuid:Int)->UserData?{
        var getUser = UserData(lastname: "", firstname: "", address:"", phone: "")
        let newArray = userArray.filter{$0.id.hashValue == uuid}
        getUser = newArray.last!
        return getUser
    }
}

#Preview {
    ContentView(selectionUser: .init(lastname: "", firstname: "", address: "", phone: ""))
}
