import Foundation

protocol MapScreenViewInput: AnyObject {
    var output: MapScreenViewOutput? { get }
    func addPlacemark(data: ListEntity)
}
