import Vapor
import Fluent

protocol CRUDModel: Publicable, Createable, Replaceable {}
