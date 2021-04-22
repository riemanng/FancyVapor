import Vapor
import Fluent

protocol Publicable: Content {
    associatedtype Public: Content = Self
    var `public`: Public { get }
    func `public`(eventLoop: EventLoop, db: Database) -> EventLoopFuture<Public>
}

extension Publicable {
    func `public`(eventLoop: EventLoop, db: Database) -> EventLoopFuture<Public> {
        eventLoop.makeSucceededFuture(self.public)
    }
}

extension Publicable where Public == Self {
    var `public`: Public {
        return self
    }
}

extension EventLoopFuture where Value: Publicable {
    func `public`(db: Database) -> EventLoopFuture<Value.Public> {
        self.flatMap {
            $0.public(eventLoop: self.eventLoop, db: db)
        }
    }
}

extension EventLoopFuture where Value: Sequence, Value.Element: Publicable {
    func `public`(db: Database) -> EventLoopFuture<[Value.Element.Public]> {
        self.flatMapEach(on: self.eventLoop) {
            $0.public(eventLoop: self.eventLoop, db: db)
        }
    }
}
