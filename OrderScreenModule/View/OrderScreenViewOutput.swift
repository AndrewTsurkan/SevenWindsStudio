import Foundation

protocol OrderScreenViewOutput: AnyObject {
    func cellCount() -> Int
    func cellData(index: Int) -> OrderData
    func minusButtonTapped(index: Int)
    func plusButtonTapped(index: Int)
}
