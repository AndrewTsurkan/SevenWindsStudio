import UIKit

fileprivate enum Constants {
    static let leftOffset: CGFloat = 10
    static let rightOffset: CGFloat = 16
    static let mapButtonBotomOffset: CGFloat = 32
    static let tableViewTopOffset: CGFloat = 15
    static let mapButtonLeftOffset: CGFloat = 19
    static let mapButtonRightOffset: CGFloat = 18
}

final class ListContentView: UIView {
    //MARK: - Private properties -
    private let tableView = UITableView()
    private let mapButton = CustomButton()
    var mapButtonAction: (() -> Void)?
    
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
        addSubview()
        setupTableView()
        makeConstaints()
        settingView()
        setupMapButton()
    }
    
    func addSubview() {
        addSubview(tableView)
        addSubview(mapButton)
    }
    
    func makeConstaints() {
        mapButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-Constants.mapButtonBotomOffset)
            $0.left.equalToSuperview().offset(Constants.mapButtonLeftOffset)
            $0.right.equalToSuperview().offset(-Constants.mapButtonRightOffset)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Constants.tableViewTopOffset)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.leftOffset)
            $0.right.equalToSuperview().offset(-Constants.rightOffset)
        }
    }
    
    func setupTableView() {
        tableView.register(ListContentviewTableViewCell.self, forCellReuseIdentifier: ListContentviewTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setupMapButton() {
        mapButton.settingButtonTitle(title: Localizable.onTheMap)
        mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
    }
    
    func settingView() {
        backgroundColor = .white
    }
    
    @objc func mapButtonTapped() {
        mapButtonAction?()
    }
}
