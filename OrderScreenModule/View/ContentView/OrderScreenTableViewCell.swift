import UIKit

fileprivate enum Constants {
    static let cellBackgroundColor: UIColor = .init(red: 246/255, green: 229/255, blue: 209/255, alpha: 1)
    static let mainTextColor: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let priceTextColor: UIColor = .init(red: 175/255, green: 148/255, blue: 121/255, alpha: 1)
    static let mainStackViewBottomOffset: CGFloat = 6
    static let counterStackViewSpacing: CGFloat = 6
    static let priceLabelFontSize: CGFloat = 14
    static let nameLabelFontSize: CGFloat = 18
    static let cellRadius: CGFloat = 5
    static let shadowRadius: CGFloat = 2
    static let shadowOpacity: Float = 0.2
    static let shadowOffset: CGFloat = 2
    static let heightStackView: CGFloat = 68
    static let withAndheightButton: CGFloat = 24
    static let counterStackViewOffset: CGFloat = 9
    static let labelStackViewSpasing: CGFloat = 6
    static let mainStackViewTopInset: CGFloat = 14
    static let mainStackViewBottomInset: CGFloat = 9
    static let mainStackViewLeftInset: CGFloat = 10
    static let mainStackViewRightInset: CGFloat = 10
    static let mainStackViewRightOffset: CGFloat = 26
    static let mainSteckViewHeight: CGFloat = 71
}

final class OrderScreenTableViewCell: UITableViewCell {
    
    static var identifier: String {
         return String(describing: self)
     }
    
    //MARK: - Private properties -
    private let mainStackView = UIStackView()
    private let labelStackView = UIStackView()
    private let emptyView = UIView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let counterStackView = UIStackView()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let quantityLabel = UILabel()
    
    var quantity: Int = 0 {
        didSet {
            quantityLabel.text = "\(quantity)"
            layoutIfNeeded()
        }
    }
    var minusAction: (() -> Void)?
    var plusAction: (() -> Void)?
    
    //MARK: - Life cycle - 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainStackView.layoutIfNeeded()
        configureShadowPath()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        quantityLabel.text = nil
        priceLabel.text = textInputContextIdentifier
        
    }
}

//MARK: - Public -
extension OrderScreenTableViewCell {
    func configure(cellData: OrderData) {
        nameLabel.text = cellData.name
        quantityLabel.text = "\(cellData.quantity)"
        priceLabel.text = "\(cellData.price) \(Localizable.rub)"
    }
}

//MARK: - UI -
private extension OrderScreenTableViewCell {
    func setupUI() {
        addSubviews()
        makeConstraints()
        setupNameLabel()
        setupPriceLabel()
        setupMainStackView()
        setupCounterSteckView()
        setupLabelStackView()
        setupMinusButton()
        setupQuantityLabel()
        setupPlusButton()
    }
    
    func addSubviews() {
        contentView.addSubview(mainStackView)
        contentView.addSubview(labelStackView)
        contentView.addSubview(counterStackView)
        mainStackView.addArrangedSubview(labelStackView)
        mainStackView.addArrangedSubview(emptyView)
        mainStackView.addArrangedSubview(counterStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(priceLabel)
        counterStackView.addArrangedSubview(minusButton)
        counterStackView.addArrangedSubview(quantityLabel)
        counterStackView.addArrangedSubview(plusButton)
    }
    
    func makeConstraints() {
        mainStackView.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.right.equalToSuperview().offset(-Constants.mainStackViewRightOffset)
            $0.bottom.equalToSuperview().offset(-Constants.mainStackViewBottomOffset)
            $0.height.equalTo(Constants.mainSteckViewHeight)
        }
        
        plusButton.snp.makeConstraints {
            $0.height.width.equalTo(Constants.withAndheightButton)
        }
        
        minusButton.snp.makeConstraints {
            $0.height.width.equalTo(Constants.withAndheightButton)
        }
    }
    
    func setupNameLabel() {
        nameLabel.textColor = Constants.mainTextColor
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont(name: "SFUIDisplay-Bold", size: Constants.nameLabelFontSize)
    }
    
    func setupPriceLabel() {
        priceLabel.textColor = Constants.priceTextColor
        priceLabel.textAlignment = .left
        priceLabel.font = UIFont.systemFont(ofSize: Constants.priceLabelFontSize)
    }
    
    func setupMainStackView() {
        mainStackView.axis = .horizontal
        mainStackView.alignment = .leading
        mainStackView.backgroundColor = Constants.cellBackgroundColor
        mainStackView.distribution = .fillProportionally
        
        mainStackView.layoutMargins = UIEdgeInsets(top: Constants.mainStackViewTopInset,
                                                   left: Constants.mainStackViewLeftInset,
                                                   bottom: Constants.mainStackViewBottomInset,
                                                   right: Constants.mainStackViewRightInset)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layer.cornerRadius = Constants.cellRadius
        mainStackView.alignment = .center
    }
    
    func setupMinusButton() {
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = Constants.mainTextColor
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
    }
    
    func setupCounterSteckView() {
        counterStackView.axis = .horizontal
        counterStackView.spacing = Constants.counterStackViewOffset
        counterStackView.distribution = .fillEqually
    }
    
    func setupLabelStackView() {
        labelStackView.axis = .vertical
        labelStackView.spacing = Constants.labelStackViewSpasing
    }
    
    func setupQuantityLabel() {
        quantityLabel.textColor = Constants.mainTextColor
        quantityLabel.font = UIFont(name: "SFUIDisplay-Bold", size: Constants.nameLabelFontSize)
        quantityLabel.textAlignment = .center
    }
    
    func setupPlusButton() {
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = Constants.mainTextColor
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    func configureShadowPath() {
        let shadowRect = mainStackView.bounds
            
        mainStackView.layer.masksToBounds = false
        mainStackView.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        mainStackView.layer.shadowColor = UIColor.black.cgColor
        mainStackView.layer.shadowRadius = Constants.shadowRadius
        mainStackView.layer.shadowOpacity = Constants.shadowOpacity
        mainStackView.layer.shadowOffset = CGSize(width: 1, height: Constants.shadowOffset)
    }
    
    @objc func minusButtonTapped() {
        minusAction?()
    }
    
    @objc func plusButtonTapped() {
        plusAction?()
    }
}
