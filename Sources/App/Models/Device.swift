import Foundation

protocol Device: class, CRUDModel {
    var id: Int? { get set }
    var name: String { get set }
    var state: String { get set }
    var user: User { get set }
}
