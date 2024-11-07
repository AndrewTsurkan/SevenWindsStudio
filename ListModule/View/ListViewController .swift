import UIKit

final class ListViewController: UIViewController {
    //MARK: - Private properties -
    let contenView = ListContentView()
    var output: ListViewOutput?
    
    override func loadView() {
        super.loadView()
        view = contenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDataSourceTableView()
        output?.onViewDidLoad()
        setupNavigation()
        setupAction()
    }
}

//MARK: - Public -
extension ListViewController {
    func setOutput(output: ListViewOutput) {
        self.output = output
    }
}

//MARK: - ListViewInput -
extension ListViewController: ListViewInput {
    func reloadTAbleView() {
        contenView.reloadTableView()
    }    
}

//MARK: - UITableViewDelegate, UITableViewDataSource -
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListContentviewTableViewCell.identifier, for: indexPath) as? ListContentviewTableViewCell,
        let output else { return UITableViewCell() }
        let cellData = output.data[indexPath.row]
        cell.configure(data: cellData, distance: Int(output.culculetedDistance(index: indexPath.row)))
        return cell
    }
}

//MARK: - Private -
extension ListViewController {
    func setDelegateAndDataSourceTableView() {
        contenView.setupDelegateAndDataSource(delegate: self, dataSource: self)
    }
    
    func setupNavigation() {
        navigationItem.title = Localizable.nearestCoffeeShops
    }
    
    func setupAction() {
        contenView.mapButtonAction = { [weak self] in
            self?.output?.showMap()
        }
    }
}
