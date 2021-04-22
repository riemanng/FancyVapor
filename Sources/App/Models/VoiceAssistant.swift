import Fluent
import Vapor

final class VoiceAssistant: Model, Content, Device {
    static let schema = "voice_assistant"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "state")
    var state: String
    
    @Field(key: "message")
    var message: String

    @Parent(key: "user_id")
    var user: User
    
    init() {}
    
    init(id: Int? = nil,
         name: String,
         state: String,
         timer: String,
         message: String,
         userId: User.IDValue?) {
        self.id = id
        self.name = name
        self.state = state
        self.message = message
        if let user = userId {
            self.$user.id = user
        }
    }
}
