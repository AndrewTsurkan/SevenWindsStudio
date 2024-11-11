import UIKit

final class OrderScreenViewController: UIViewController {
    //MARK: - Private properties -
    private let contentView = OrderScreenContentView()
    var output: OrderScreenViewOutput?
    
    //MARK: - Lide cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        contentView.configureWaitingLabel(bool: output?.cellCount() != 0)
        contentView.setDelegateAndDataSource(delegate: self, dataSource: self)
        setupNaviagaionBar()
    }
}

//MARK: - Public -
extension OrderScreenViewController {
    func setOutput(output: OrderScreenViewOutput) {
        self.output = output
    }
}

//MARK: - OrderScreenViewInput -
extension OrderScreenViewController: OrderSvreenViewInput {
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource -
extension OrderScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countCell = output?.cellCount() else { return 0 }
        if countCell == 0 {
            contentView.configureWaitingLabel(bool: output?.cellCount() != 0)
        }
        return countCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderScreenTableViewCell.identifier, for: indexPath) as? OrderScreenTableViewCell,
              let output else { return UITableViewCell() }
        cell.configure(cellData: output.cellData(index: indexPath.row))
        cell.minusAction = { [weak self] in
            self?.output?.minusButtonTapped(index: indexPath.row)
            tableView.reloadData()
            
        }
        cell.plusAction = { [weak self] in
            self?.output?.plusButtonTapped(index: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - Private -
private extension OrderScreenViewController {
    func setupNaviagaionBar() {
        navigationItem.title = Localizable.youOrder
    }
}
