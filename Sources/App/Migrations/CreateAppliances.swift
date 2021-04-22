import Fluent

struct CreateAppliance: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("appliances")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("user_id", .int, .required, .references("users", "id", onDelete: .cascade, onUpdate: .cascade))
            .field("state", .string, .required)
            .field("dateOfCheck", .datetime, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("appliances").delete()
    }
}
