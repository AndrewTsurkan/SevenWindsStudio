import UIKit
protocol MenuScreenViewOutput: AnyObject {
    var dataMenu: [MenuScreenEntity] { get set }
    func cellMinusButtonAction( quantity: inout Int, index: Int) -> Int
    func cellPlusButtonAction(quantity: inout Int, index: Int) -> Int
    func onViewDidLoad()
    func downloadImage(url: String?, completion: @escaping (UIImage) -> Void)
    func tapedButton()

}
