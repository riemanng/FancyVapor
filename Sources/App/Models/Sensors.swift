import Fluent
import Vapor

final class Sensors: Model, Content, Device {
    static let schema = "sensors"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "state")
    var state: String
    
    @Parent(key: "user_id")
    var user: User
    
    @Timestamp(key: "dateOfCheck", on: .update)
    var dateOfCheck: Date?
    
    init() {}
    
    init(id: Int? = nil,
         name: String,
         state: String,
         dateOfCheck: Date? = nil,
         userId: User.IDValue?) {
        self.id = id
        self.name = name
        self.state = state
        self.dateOfCheck = dateOfCheck
        if let user = userId {
            self.$user.id = user
        }
    }
}
