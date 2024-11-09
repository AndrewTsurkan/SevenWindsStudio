import Foundation

protocol MenuScreenViewInput: AnyObject {
    var output: MenuScreenViewOutput? { get set }
    func reloadCollectionView()
}
