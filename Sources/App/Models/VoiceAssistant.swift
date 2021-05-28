import Fluent
import Vapor

final class VoiceAssistant: Model, Content, Device {
    static let schema = "voice_assistant"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "isActive")
    var isActive: Bool
    
    @Field(key: "room")
    var room: String

    @Field(key: "message")
    var message: String

    @Parent(key: "user_id")
    var user: User
    
    init() {}
    
    init(id: VoiceAssistant.IDValue? = nil,
         name: String,
         isActive: Bool = false,
         message: String,
	 room: String,
         userId: User.IDValue?) {
        self.id = id
	self.room = room
        self.name = name
        self.isActive = isActive
        self.message = message
        if let user = userId {
            self.$user.id = user
        }
    }
}
