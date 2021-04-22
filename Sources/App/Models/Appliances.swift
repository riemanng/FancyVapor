import Fluent
import Vapor

final class Appliances: Model, Content, Device {
    static let schema = "appliances"
    
    @ID(custom: "id")
    var id: Int?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "state")
    var state: String
    
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
