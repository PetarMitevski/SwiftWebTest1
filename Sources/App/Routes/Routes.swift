import Vapor
import Foundation


extension Droplet {
    
    
    
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }
        get("test") { req in
            return "Yea tested!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
        
        try resource("post1", PostController1.self)
        
//        post("post1") { request in
//            guard let bs64 = request.json?["bs64"]?.string else{
//                throw Abort(.badRequest)}
//            let decodedData = Data(base64Encoded: bs64)!
//            let json = try JSONSerialization.jsonObject(with: decodedData, options: [])
//            if let object = json as? [String: Any] {
//                print(object)
//            }
//
//
//            let test:String! = request.headers["hiiii"];
//            return "Hello, \(test ?? "")!"
//        }
        
        
    }
}
