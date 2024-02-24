//
//  ContentView.swift
//  ExampleApp
//
//  Created by Patrick Ma on 12/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            var leakedClass: LeakedClass? = LeakedClass()
            leakedClass = nil

            var nonLeakedClass: NonLeakedClass? = NonLeakedClass()
            nonLeakedClass = nil
        }
    }
}

#Preview {
    ContentView()
}
