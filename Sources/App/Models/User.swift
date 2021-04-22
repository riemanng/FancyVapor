import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Children(for: \.$user)
    var safetyDevices: [Safety]
    
    @Children(for: \.$user)
    var appliancesDevices: [Appliances]
    
    @Children(for: \.$user)
    var sensorsDevices: [Sensors]
    
    @Children(for: \.$user)
    var assistant: [VoiceAssistant]
    
    @Field(key: "phoneNumber")
    var phoneNumber: String
    
    @OptionalField(key: "address")
    var address: String?
    
    @Field(key: "email")
    var email: String
    
    init() {}
    
    init(id: Int? = nil,
         name: String) {
        self.id = id
        self.name = name
    }
}

extension User: CRUDModel {}
