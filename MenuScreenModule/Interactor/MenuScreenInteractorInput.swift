import UIKit
protocol MenuScreenInteractorInput: AnyObject {
    var output: MenuScreenInteractorOutput? { get set }
    func getMenu(id: Int, token: String)
    func getImage(urlString: String?, completion: @escaping (UIImage?) -> Void)
}
