import Fluent
import Vapor

final class Safety: Model, Content, Device {
    static let schema = "safety"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "state")
    var state: String
    
    @Parent(key: "user_id")
    var user: User
    
    init() {}
    
    init(id: Int? = nil,
         name: String,
         state: String,
         userId: User.IDValue?) {
        self.id = id
        self.name = name
        self.state = state
        if let user = userId {
            self.$user.id = user
        }
    }
}
