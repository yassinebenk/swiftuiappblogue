//
//  ContentView.swift
//  BlogueSwiftUI
//
//  Created by Yassine Ben-khayat on 2025-02-15.
//

import SwiftUI

struct ChatonVue: View {
    var animaux : [Animal] = [.init(nom: "Chaton", couleur: .blue, nomImage: "kitten2"), .init(nom: "Chien", couleur: .yellow, nomImage: "chien3"), .init(nom: "Hamster", couleur: .gray, nomImage: "hamster2")]
    
    
    var body: some View {
        NavigationStack{
            List {
                Section("Liste d'animaux") {
                    ForEach(animaux, id: \.nom) {animal in
                        NavigationLink(value: animal){
                            HStack{
                                Image(animal.nomImage).resizable().scaledToFit().frame(width: 50, height: 50).clipShape(.circle).overlay{
                                    Circle().stroke(animal.couleur, lineWidth : 2)
                                }
                                Text(animal.nom)
                                    .offset(x: 5).foregroundColor(animal.couleur)
                            }
                        }
                    }
                }
            }.navigationTitle("Mes animaux")
                .navigationDestination(for: Animal.self) { animal in
                    ZStack{
                        animal.couleur.ignoresSafeArea()
                        HStack{
                            Image(animal.nomImage).resizable().scaledToFit().frame(width: 100, height: 100).clipShape(.circle).overlay{
                                Circle().stroke(.black, lineWidth : 2)
                            }
                            Text(animal.nom)
                                .offset(x: 5).foregroundColor(.black).font(.largeTitle).bold()
                        }
                    }
                    
                }
        }.accentColor(Color(.label))
    }
}
    
    
struct Animal : Hashable{
    let nom: String
    let couleur : Color
    let nomImage : String
}

#Preview {
    ChatonVue()
}
