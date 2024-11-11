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
        if let imageCached = ImageCache.shared.getImage(url: urlString) {
            completion(imageCached)
        } else {
            networkService.loadImage(from: urlString) { image in
                guard let image else { return }
                ImageCache.shared.save(url: urlString, image: image)
                completion(image)
            }
        }
    }
}
