import Vapor
import Fluent

extension Model where IDValue: LosslessStringConvertible {
    static func getID(from key: String, on request: Request) -> IDValue? {
        request.parameters.get(key)
    }
    
    static func fetch(from key: String, on request: Request) -> EventLoopFuture<Self> {
        let id = Self.getID(from: key, on: request)
        return Self.find(id, on: request.db).unwrap(or: Abort(.notFound))
    }
}
