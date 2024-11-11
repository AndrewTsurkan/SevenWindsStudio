import Foundation

protocol ListViewOutput: AnyObject {
    func onViewDidLoad()
    func culculetedDistance(index: Int) -> Double
    func showMap()
    func showMenuScreen(index: Int)
    func cellCount() -> Int
    func cellData(index: Int) -> ListEntity
}
