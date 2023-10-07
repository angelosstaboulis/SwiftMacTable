//
//  UserDataViewModel.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 8/10/23.
//

import Foundation
import SwiftUI
class UserDataViewModel:ObservableObject{
    var user:[UserData] = []
    func getUserData()->[UserData]{
        user.append(UserData(lastname: "Papadopoulos",firstname:"George",address: "Gorogpotamou 1", phone: "2531029354"))
        user.append(UserData(lastname: "Georgiou",firstname:"Theodoros",address: "Γ.Μαμέλη 1", phone: "2531027353"))
        return user
    }
}
