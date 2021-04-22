import Vapor

protocol Createable: Content {
    associatedtype Create: Content = Self
    init(from data: Create) throws
}

extension Createable where Create == Self {
    init(from data: Create) throws {
        self = data
    }
}
