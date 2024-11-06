import UIKit

fileprivate enum Constants {
    static let leftOffset: CGFloat = 10
    static let rightOffset: CGFloat = 16
}

final class ListContentView: UIView {
    //MARK: - Private properties -
    private let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Public -
extension ListContentView {
    func setupDelegateAndDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

//MARK: - UI -
private extension ListContentView {
    func setupUI() {
        setupTableView()
        makeConstaints()
        settingView()
    }
    
    func makeConstaints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.leftOffset)
            $0.right.equalToSuperview().offset(-Constants.rightOffset)
        }
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.register(ListContentviewTableViewCell.self, forCellReuseIdentifier: ListContentviewTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    func settingView() {
        backgroundColor = .white
    }
}
