//
//  ContentView.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 5/10/23.
//

import SwiftUI
struct UserData:Identifiable,Equatable{
    let id = UUID()
    var lastname: String
    var firstname:String
    var address:String
    var phone:String
}
struct ContentView: View {
    @State private var user=[UserData(lastname: "Papadopoulos",firstname:"George",address: "Gorogpotamou 1", phone: "2531029354"),UserData(lastname: "Georgiou",firstname:"Theodoros",address: "Γ.Μαμέλη 1", phone: "2531027353")]
    @State private var selection = Set<UserData.ID>()
    @State private var isPresented = false
    @State var selectionUser:UserData
    var body: some View {
        Table(user,selection: $selection){
            TableColumn("Record"){record in
                HStack(alignment:.firstTextBaseline, content: {
                    Text(record.lastname).frame(maxWidth:.infinity)
                    Text(record.firstname).frame(maxWidth:.infinity)
                    Text(record.address).frame(maxWidth:.infinity)
                    Text(record.phone).frame(maxWidth:.infinity)
                })
            }
    
        }.onReceive(selection.publisher) { output in
            selectionUser = checkUUID(uuid: output.uuidString)!
            if selectionUser.lastname.count > 0 {
                isPresented = true
            }
        }.popover(isPresented: $isPresented) {
            AlertView(selection: $selectionUser, selected: $isPresented)

        }

    }
    func checkUUID(uuid:String)->UserData?{
        var getUser = UserData(lastname: "", firstname: "", address:"", phone: "")
        for item in 0..<user.count{
            if user[item].id.uuidString == uuid {
                getUser = user[item]
                return getUser
            }
        }
        return getUser
    }
}

#Preview {
    ContentView(selectionUser: .init(lastname: "", firstname: "", address: "", phone: ""))
}
