import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    app.crud("users", model: User.self)
    
    app.crud("users", model: User.self) { routes, parentController in
        routes.crud("appls", children: Appliances.self, on: parentController, via: \.$appliancesDevices)
    }
    app.crud("users", model: User.self) { routes, parentController in
        routes.crud("sft", children: Safety.self, on: parentController, via: \.$safetyDevices)
    }
    
    app.crud("users", model: User.self) { routes, parentController in
        routes.crud("sens", children: Sensors.self, on: parentController, via: \.$sensorsDevices)
    }
    
    app.crud("users", model: User.self) { routes, parentController in
        routes.crud("va", children: VoiceAssistant.self, on: parentController, via: \.$assistant)
    }
}
