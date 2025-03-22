//
//  AnimalViewModel.swift
//  BlogueSwiftUI
//
//  Created by Yassine Ben-khayat on 2025-03-22.
//

import Foundation

class AnimalViewModel: ObservableObject {
    @Published var animaux: [Animal] = []
    
    func fetchAnimals() {
        guard let url = URL(string: "http://localhost:8080/animaux") else {
            print("URL invalide")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erreur lors de la récupération des animaux: \(error)")
                return
            }
            guard let data = data else {
                print("Aucun donnée reçu")
                return
            }
            do {
                let decodedAnimals = try JSONDecoder().decode([Animal].self, from: data)
                DispatchQueue.main.async {
                    self.animaux = decodedAnimals
                }
            } catch {
                print("Erreur décodage: \(error)")
            }
        }.resume()
    }
}
