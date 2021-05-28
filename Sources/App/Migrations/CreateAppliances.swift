import Fluent

struct CreateAppliance: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("appliances")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .field("user_id", .int, .references("users", "id", onDelete: .cascade, onUpdate: .cascade))
            .field("isActive", .bool)
	    .field("room", .string)
            .field("dateOfCheck", .datetime)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("appliances").delete()
    }
}
