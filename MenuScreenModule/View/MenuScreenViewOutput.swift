import UIKit
protocol MenuScreenViewOutput: AnyObject {
    var dataMenu: [MenuScreenEntity] { get set }
    func cellMinusButtonAction(cell: MenuScreenCollectionViewCell)
    func cellPlusButtonAction(cell: MenuScreenCollectionViewCell)
    func onViewDidLoad()
    func downloadImage(url: String?, completion: @escaping (UIImage) -> Void)
    func tapedButton()

}
