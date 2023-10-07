//
//  UserData.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 8/10/23.
//

import Foundation
struct UserData:Identifiable,Equatable{
    let id = UUID()
    var lastname: String
    var firstname:String
    var address:String
    var phone:String
}
