import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {

    app.databases.use(.postgres(
        hostname: Environment.get("localhost") ?? "localhost",
        port: Environment.get("5432").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("vapor_username") ?? "vapor_username",
        password: Environment.get("123") ?? "vapor_password",
        database: Environment.get("vapor_database") ?? "vapor_database"
    ), as: .psql)
    
    app.migrations.add(CreateUser())
    app.migrations.add(CreateAssistant())
    app.migrations.add(CreateSafety())
    app.migrations.add(CreateSensor())
    app.migrations.add(CreateAppliance())

    // register routes
    try routes(app)
}
