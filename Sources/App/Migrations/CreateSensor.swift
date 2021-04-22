import Fluent

struct CreateSensor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("sensors")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("state", .string, .required)
            .field("user_id", .int, .required, .references("users", "id", onDelete: .cascade, onUpdate: .cascade))
            .field("dateOfCheck", .datetime, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("sensors").delete()
    }
}
