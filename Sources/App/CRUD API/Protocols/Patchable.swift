import Vapor

protocol Patchable {
    associatedtype Patch: Content
    func patch(with data: Patch) throws
}
