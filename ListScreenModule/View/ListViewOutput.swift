import Foundation

protocol ListViewOutput: AnyObject {
    func onViewDidLoad()
    var data: [ListEntity] { get set }
    func culculetedDistance(index: Int) -> Double
    func showMap()
}
