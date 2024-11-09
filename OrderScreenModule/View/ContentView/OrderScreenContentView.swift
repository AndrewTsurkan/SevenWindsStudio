import UIKit
fileprivate enum Constants {
    static let pyamantButtonBottomOffset: CGFloat = 32
    static let pyamantButtonLeftOffset: CGFloat = 19
    static let pyamantButtonRightOffset: CGFloat = 18
    static let wiatingLabelColor: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
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

//MARK: - UI -
private extension OrderScreenContentView {
    func setupUI() {
        addSubviews()
        makeConstraints()
        setupTableView()
        setupWaitingLabel()
        setupPaymentBurron()
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
            $0.centerX.equalToSuperview().offset(-100)
            $0.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.right.left.equalToSuperview()
            $0.bottom.equalTo(waitingLabel.snp.top).offset(-20)
        }
    }
    
    func setupTableView() {
        tableView.register(OrderScreenTableViewCell.self, forCellReuseIdentifier: OrderScreenTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setupWaitingLabel() {
        waitingLabel.font = UIFont(name: "SFUIDisplay-Bold", size: 24)
        waitingLabel.textColor = Constants.wiatingLabelColor
        waitingLabel.numberOfLines = 3
    }
    
    func setupPaymentBurron() {
        paymentButton.settingButtonTitle(title: Localizable.pay)
        paymentButton.addTarget(self, action: #selector(paymentButtonTapped), for: .touchUpInside)
    }
    
    @objc func paymentButtonTapped() {
        paymentButtonAction?()
    }
}
