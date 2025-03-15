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

    try app.register(collection: TodoController())
}
