import Foundation

protocol Device: class, CRUDModel {
    var id: Int? { get set }
    var name: String { get set }
    var isActive: Bool { get set }
    var user: User { get set }
}
