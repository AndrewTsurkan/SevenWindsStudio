import Foundation

protocol ListViewOutput: AnyObject {
    func onViewDidLoad()
    var data: [ListEntity] { get set }
}
