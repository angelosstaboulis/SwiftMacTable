//
//  UserData.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 8/10/23.
//

import Foundation
struct IDData<T>:Equatable,Hashable{
    private let id = UUID()
}
struct UserData:Identifiable{
    let id = IDData<Self>()
    var lastname: String
    var firstname:String
    var address:String
    var phone:String
}
