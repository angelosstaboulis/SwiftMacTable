//
//  SwiftMacTableApp.swift
//  SwiftMacTable
//
//  Created by Angelos Staboulis on 5/10/23.
//

import SwiftUI

@main
struct SwiftMacTableApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(selectionUser: .init(lastname: "", firstname: "", address: "", phone: ""))
        }
    }
}
