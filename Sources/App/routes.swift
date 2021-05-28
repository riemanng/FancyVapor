import Fluent
import Vapor

fileprivate enum Paths {
    static let userApi = "users"
    static let appliances = "appls"
    static let safety = "sft"
    static let sensors = "sens"
    static let voiceAssistant = "va"
}

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    app.crud(Paths.userApi, model: User.self)

    app.crud(Paths.userApi, model: User.self) { routes, parentController in
        routes.crud(Paths.appliances, children: Appliances.self, on: parentController, via: \.$appliancesDevices)
    }
    app.crud(Paths.userApi, model: User.self) { routes, parentController in
        routes.crud(Paths.safety, children: Safety.self, on: parentController, via: \.$safetyDevices)
    }
    
    app.crud(Paths.userApi, model: User.self) { routes, parentController in
        routes.crud(Paths.sensors, children: Sensors.self, on: parentController, via: \.$sensorsDevices)
    }
    
    app.crud(Paths.userApi, model: User.self) { routes, parentController in
        routes.crud(Paths.voiceAssistant, children: VoiceAssistant.self, on: parentController, via: \.$assistant)
    }
}

