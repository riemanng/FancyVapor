import Fluent
import SQLKit
import Vapor

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("phoneNumber", .string)
            .field("address", .string)
            .field("email", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}
