import Fluent
import FluentPostgresDriver
import Vapor

fileprivate struct Conf {
    static let host = "localhost"
    static let pass = "5432"
    static let username = "vapor_username"
    static let userPass = "123"
    static let dbName = "vapor_database"
}

public func configure(_ app: Application) throws {

    app.databases.use(.postgres(
        hostname: Environment.get(Conf.host) ?? "localhost",
        port: Environment.get(Conf.pass).flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get(Conf.username) ?? "vapor_username",
        password: Environment.get(Conf.userPass) ?? "vapor_password",
        database: Environment.get(Conf.dbName) ?? "vapor_database"
    ), as: .psql)
    
    app.migrations.add(CreateUser())
    app.migrations.add(CreateAssistant())
    app.migrations.add(CreateSafety())
    app.migrations.add(CreateSensor())
    app.migrations.add(CreateAppliance())

    // register routes
    try routes(app)
}
