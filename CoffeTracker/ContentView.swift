//
//  ContentView.swift
//  CoffeTracker
//
//  Created by Anas Salah on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()

    var body: some View {
        MenuView()
            .environmentObject(menu)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
