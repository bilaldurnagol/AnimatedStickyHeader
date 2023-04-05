//
//  ContentView.swift
//  AnimatedStickyHeader
//
//  Created by Bilal Durnagöl on 4.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
