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
    
    @Field(key: "isActive")
    var isActive: Bool
    
    @Field(key: "room")
    var room: String
    
    @Timestamp(key: "dateOfCheck", on: .update)
    var dateOfCheck: Date?
    
    init() {}
    
    init(id: Appliances.IDValue? = nil,
         name: String,
         isActive: Bool = false,
         room: String,
         dateOfCheck: Date? = nil,
         userId: User.IDValue?) {
        self.id = id
        self.room = room
        self.name = name
        self.isActive = isActive
        self.dateOfCheck = dateOfCheck
        if let user = userId {
            self.$user.id = user
        }
    }
}
