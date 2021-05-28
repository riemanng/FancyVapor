import Fluent

struct CreateSensor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("sensors")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("isActive", .bool)
            .field("user_id", .int, .references("users", "id", onDelete: .cascade, onUpdate: .cascade))
            .field("dateOfCheck", .datetime)
	    .field("room", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("sensors").delete()
    }
}
