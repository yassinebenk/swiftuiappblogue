import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("hello", ":nom") { req async throws -> String in
        
        let nom = try req.parameters.require("nom")
        
        return "Hello, \(nom.capitalized)!"
    }
    
    app.get("animaux") { req async -> [Animal] in
        return [
            Animal(id: 1, nom: "Chaton", couleur: "blue", nomImage: "image1"),
            Animal(id: 2, nom: "Chien", couleur: "yellow", nomImage: "image2"),
            Animal(id: 3, nom: "Hamster", couleur: "gray", nomImage: "image3")
        ]
    }
    
    app.get("animaux", ":id") { req async throws -> Animal in
        guard let idString = req.parameters.get("id"),
              let id = Int(idString) else {
            throw Abort(.badRequest, reason: "id invalide")
        }
        
        let animals = [
            Animal(id: 1, nom: "Chaton", couleur: "blue", nomImage: "image1"),
            Animal(id: 2, nom: "Chien", couleur: "yellow", nomImage: "image2"),
            Animal(id: 3, nom: "Hamster", couleur: "gray", nomImage: "image3")
        ]
        
        if let animal = animals.first(where: { $0.id == id }) {
            return animal
        } else {
            throw Abort(.notFound, reason: "Animal avec l'id \(id) non existant")
        }
    }

    try app.register(collection: TodoController())
}
