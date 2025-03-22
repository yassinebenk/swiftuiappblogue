//
//  ContentView.swift
//  BlogueSwiftUI
//
//  Created by Yassine Ben-khayat on 2025-02-15.
//

import SwiftUI

struct ChatonVue: View {
    @StateObject var viewModel = AnimalViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Liste d'animaux") {
                    ForEach(viewModel.animaux, id: \.id) { animal in
                        NavigationLink(value: animal) {
                            HStack {
                                Image(animal.nomImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle().stroke(animal.swiftUIColor, lineWidth: 2)
                                    }
                                Text(animal.nom)
                                    .offset(x: 5)
                                    .foregroundColor(animal.swiftUIColor)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Mes animaux")
            .navigationDestination(for: Animal.self) { animal in
                ZStack {
                    animal.swiftUIColor.ignoresSafeArea()
                    HStack {
                        Image(animal.nomImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.black, lineWidth: 2)
                            }
                        Text(animal.nom)
                            .offset(x: 5)
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            .onAppear {
                viewModel.fetchAnimals()
            }
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    ChatonVue()
}
