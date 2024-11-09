import UIKit

final class MenuScreenInteractor {
    //MARK: - Private properties -
    let networkManager = NetworkDataFetcher()
    let networkService = NetworkService()
    weak var output: MenuScreenInteractorOutput?
}

//MARK: - Public -
extension MenuScreenInteractor {
    func setoutput(output: MenuScreenInteractorOutput) {
        self.output = output
    }
}

//MARK: MenuScreenInteractorInput
extension MenuScreenInteractor: MenuScreenInteractorInput {
    func getMenu(id: Int, token: String) {
        networkManager.fetchMenu(id: id, token: token) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.dataMenu = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getImage(urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString else { return }
        networkService.loadImage(from: urlString) { image in
            completion(image)
        }
    }
}
