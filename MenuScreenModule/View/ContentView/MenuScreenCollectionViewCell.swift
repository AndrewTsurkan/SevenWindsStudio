import UIKit
fileprivate enum Constants {
    static let nameLabelTopOffset: CGFloat = 10
    static let leftLabelOffset: CGFloat = 11
    static let pricaLabelAndSctackViewTopOffset: CGFloat = 12
    static let stackViewRightOfsset: CGFloat = 5
    static let withAndHieghtButton: CGFloat = 24
    static let nameLabelColor: UIColor = .init(red: 175/255, green: 148/255, blue: 121/255, alpha: 1)
    static let nameLabelFontSize: CGFloat = 15
    static let priceLabelFontSize: CGFloat = 14
    static let priceAndQuantityLabelColor: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let stackViewSpacing: CGFloat = 9
    static let buttonColor: UIColor = .init(red: 248/255, green: 229/255, blue: 209/255, alpha: 1)
    static let stackViewBottomOffset: CGFloat = 7
    static let heightImageView: CGFloat = 137
    static let shadowRadius: CGFloat = 2
    static let shadowOpacity: Float = 0.2
    static let shadowOffset: CGFloat = 2
    static let radius: CGFloat = 5
}

final class MenuScreenCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
         return String(describing: self)
     }
    
    //MARK: - Private properties -
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let stackView = UIStackView()
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupImageView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        priceLabel.text = nil
        imageView.image = nil
    }
}
//MARK: - Public -
extension MenuScreenCollectionViewCell {
    func configure(data: MenuScreenEntity) {
        guard let nameText = data.name,
              let priceText = data.price else { return }
        nameLabel.text = nameText
        priceLabel.text = "\(priceText) руб"
    }
    
    func setupImageView(image: UIImage) {
        imageView.image = image
    }
}
//MARK: - UI -
private extension MenuScreenCollectionViewCell {
    func setupUI() {
        addSubviews()
        makeConstraints()
        configureShadowPath()
        setupNameLabel()
        setupPriceeLabel()
        setupStackView()
        setupMinusButton()
        setupQuantityLabel()
        setupPlusButton()
    }
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(quantityLabel)
        stackView.addArrangedSubview(plusButton)
    }
    
    func makeConstraints() {
        imageView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(Constants.heightImageView)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(Constants.nameLabelTopOffset)
            $0.left.right.equalToSuperview().inset(Constants.leftLabelOffset)
        }
        
        priceLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(Constants.leftLabelOffset)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.pricaLabelAndSctackViewTopOffset)
        }
        
        stackView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-Constants.stackViewRightOfsset)
            $0.top.equalTo(nameLabel.snp.bottom).offset(Constants.pricaLabelAndSctackViewTopOffset)
        }
        
        minusButton.snp.makeConstraints {
            $0.width.height.equalTo(Constants.withAndHieghtButton)
        }
    }
    
    private func setupImageView() {
        let path = UIBezierPath(roundedRect: imageView.bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: Constants.radius,
                                                    height: Constants.radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        imageView.layer.mask = maskLayer
        imageView.clipsToBounds = true
    }
    
    func setupNameLabel() {
        nameLabel.textColor = Constants.nameLabelColor
        nameLabel.font = UIFont(name: "SFUIDisplay-Bold", size: Constants.nameLabelFontSize)
        nameLabel.textAlignment = .left
    }
    
    func setupPriceeLabel() {
        priceLabel.textColor = Constants.priceAndQuantityLabelColor
        priceLabel.font = UIFont(name: "SFUIDisplay-Bold", size: Constants.nameLabelFontSize)
        priceLabel.textAlignment = .left
    }
    
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = Constants.stackViewSpacing
    }
    
    func setupMinusButton() {
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = Constants.buttonColor
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)

    }
    
    func setupQuantityLabel() {
        quantityLabel.textColor = Constants.priceAndQuantityLabelColor
        quantityLabel.font = UIFont(name: "SFUIDisplay-Regular", size: Constants.nameLabelFontSize)
        quantityLabel.textAlignment = .center
        quantityLabel.text = "\(quantity)"
    }
    
    func setupPlusButton() {
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = Constants.buttonColor
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    @objc func minusButtonTapped() {
        minusAction?()
    }
    
    @objc func plusButtonTapped() {
        plusAction?()
    }
    
    func configureShadowPath() {
        layer.cornerRadius = Constants.radius
        clipsToBounds = false
        backgroundColor = .white
        let shadowRect = bounds.insetBy(dx: -1, dy: -1)
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = Constants.shadowRadius
        layer.shadowOpacity = Constants.shadowOpacity
        layer.shadowOffset = CGSize(width: 1, height: Constants.shadowOffset)
    }
}
