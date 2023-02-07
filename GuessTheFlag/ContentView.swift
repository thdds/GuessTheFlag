//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thaddäus Schima on 06.02.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
            }
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
                    .padding()
            }
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
    func executeDelete() {
        print("Now deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
