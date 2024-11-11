import UIKit

final class MenuScreenViewController: UIViewController {
    //MARK: - Private -
    let contentView = MenuScreenContentView()
    var output: MenuScreenViewOutput?
    
    //MARK: - life cycle -
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.setDelegate(delegate: self, dataSource: self)
        output?.onViewDidLoad()
        setupNavigation()
        setupAction()
    }
}
//MARK: - Public -
extension MenuScreenViewController {
    func setOutput(output: MenuScreenViewOutput) {
        self.output = output
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSiurce -
extension MenuScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output?.dataMenu.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuScreenCollectionViewCell.identifier, for: indexPath) as? MenuScreenCollectionViewCell,
              let data = output?.dataMenu[indexPath.item],
              let output else { return UICollectionViewCell() }
        cell.configure(data: data)
        output.downloadImage(url: data.imageURL) { [weak cell] image in
            DispatchQueue.main.async {
                cell?.setupImageView(image: image)
            }
        }
        cell.minusAction = { [weak self] in
            cell.quantity = output.cellMinusButtonAction(quantity: &cell.quantity, index: indexPath.item)
        }
        cell.plusAction = { [weak self] in
            cell.quantity = output.cellPlusButtonAction(quantity: &cell.quantity, index: indexPath.item)
        }
        return cell
    }
}
//MARK: - MenuScreenViewInput -
extension MenuScreenViewController: MenuScreenViewInput {
    func reloadCollectionView() {
        contentView.reloadCollectionView()
    }
}

//MARK: - Private -
private extension MenuScreenViewController {
    func setupNavigation() {
        navigationItem.title = Localizable.menu
    }
    
    func setupAction() {
        contentView.orderButtonAction = { [weak self] in
            self?.output?.tapedButton()
        }
    }
}
