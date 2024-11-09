import Foundation

protocol ListInteractorInput: AnyObject {
    var outPut: ListInteractorOutput? { get set }
    func getData(urlString: String, token: String)
}
