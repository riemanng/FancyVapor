import Fluent
import Vapor

final class Safety: Model, Content, Device {
    static let schema = "safety"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "isActive")
    var isActive: Bool
    
    @Field(key: "room")
    var room: String

    @Parent(key: "user_id")
    var user: User
    
    init() {}
    
    init(id: Safety.IDValue? = nil,
         name: String,
	 room: String,
         isActive: Bool = false,
         userId: User.IDValue?) {
        self.id = id
	self.room = room
        self.name = name
        self.isActive = isActive
        if let user = userId {
            self.$user.id = user
        }
    }
}
