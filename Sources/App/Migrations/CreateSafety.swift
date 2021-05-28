import Fluent

struct CreateSafety: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("safety")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("isActive", .bool)
            .field("user_id", .int, .references("users", "id", onDelete: .cascade, onUpdate: .cascade))
	    .field("room", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("safety").delete()
    }
}
