import Fluent

struct CreateSafety: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("safety")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("state", .string, .required)
            .field("user_id", .int, .required, .references("users", "id", onDelete: .cascade, onUpdate: .cascade))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("safety").delete()
    }
}
