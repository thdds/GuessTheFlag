//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thaddäus Schima on 06.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
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
                showingAlert = true
            } label: {
                Text("Tap me")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
                    .alert("Important message", isPresented: $showingAlert) {
                        Button("Delete", role: .destructive) {}
                        Button("Cancel", role: .cancel) {}
                    } message: {
                        Text("Please read this.")
                    }
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
