//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thaddäus Schima on 06.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 1...2)
    @State var usersScore = 0
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.4), .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.5)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag").font(.subheadline.weight(.heavy))
                            .foregroundColor(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.bold))
                        
                    }
                    
                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 30)
                Spacer()
                Spacer()
            
                Text("Score: \(usersScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                Button("Reset game") {
                    usersScore = 0
                }
                Spacer()
            }.padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("The right answer was \(countries[correctAnswer])")
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "correct"
            usersScore += 1
        } else {
            scoreTitle = "wrong"
            usersScore = 0
            showingScore = true
        }
        
        askQuestion()
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
