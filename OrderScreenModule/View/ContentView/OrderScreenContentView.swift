import UIKit
fileprivate enum Constants {
    static let pyamantButtonBottomOffset: CGFloat = 32
    static let pyamantButtonLeftOffset: CGFloat = 19
    static let pyamantButtonRightOffset: CGFloat = 18
    static let waitingLabelColor: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let waitingLabelCenterYOffset: CGFloat = 100
    static let tableViewTopAndBottomInset: CGFloat = 15
    static let tableViewLeftInset: CGFloat = 10
    static let tableViewBottomOffset: CGFloat = 20
    static let waitingLabelFontSize: CGFloat = 24
}
final class OrderScreenContentView: UIView {
    //MARK: - Private properties -
    private let tableView = UITableView()
    private let waitingLabel = UILabel()
    private let paymentButton = CustomButton()
    
    var paymentButtonAction: (() -> Void)?
    //MARK: - Life cycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public -
extension OrderScreenContentView {
    func configureWaitingLabel(bool: Bool) {
        waitingLabel.text =  bool ? Localizable.waitingTextOrder : Localizable.waitingTextNotOrder
    }
    
    func setDelegateAndDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

//MARK: - UI -
private extension OrderScreenContentView {
    func setupUI() {
        addSubviews()
        makeConstraints()
        setupTableView()
        setupWaitingLabel()
        setupPaymentBurron()
        backgroundColor = .white
    }
    
    func addSubviews() {
        addSubview(tableView)
        addSubview(waitingLabel)
        addSubview(paymentButton)
    }
    
    func makeConstraints() {
        paymentButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(Constants.pyamantButtonBottomOffset)
            $0.right.equalToSuperview().inset(Constants.pyamantButtonRightOffset)
            $0.left.equalToSuperview().offset(Constants.pyamantButtonLeftOffset)
        }
        
        waitingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(Constants.waitingLabelCenterYOffset)
        }
        
        tableView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(waitingLabel.snp.top).inset(-Constants.tableViewBottomOffset)
        }
    }
    
    func setupTableView() {
        tableView.register(OrderScreenTableViewCell.self, forCellReuseIdentifier: OrderScreenTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: Constants.tableViewTopAndBottomInset,
                                       left: Constants.tableViewLeftInset,
                                       bottom: Constants.tableViewTopAndBottomInset,
                                       right: 0)
        tableView.isScrollEnabled = false
    }
    
    func setupWaitingLabel() {
        waitingLabel.font = UIFont(name: "SFUIDisplay-Bold", size: Constants.waitingLabelFontSize)
        waitingLabel.textColor = Constants.waitingLabelColor
        waitingLabel.numberOfLines = 3
        waitingLabel.textAlignment = .center
    }
    
    func setupPaymentBurron() {
        paymentButton.settingButtonTitle(title: Localizable.pay)
        paymentButton.addTarget(self, action: #selector(paymentButtonTapped), for: .touchUpInside)
    }
    
    @objc func paymentButtonTapped() {
        paymentButtonAction?()
    }
}
