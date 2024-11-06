import UIKit
fileprivate enum Constants {
    static let cellBackgroundColor: UIColor = .init(red: 246/255, green: 229/255, blue: 209/255, alpha: 1)
    static let nameCafeTextColor: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let distanceTextColor: UIColor = .init(red: 175/255, green: 148/255, blue: 121/255, alpha: 1)
    static let stackViewSpacing: CGFloat = 6
    static let leftOffsetSctackView: CGFloat = 10
    static let nameCafeLabelFontSize: CGFloat = 18
    static let distanceLabelFontSize: CGFloat = 14
    static let cellRadius: CGFloat = 5
    static let shadowRadius: CGFloat = 2
    static let shadowOpacity: Float = 0.2
    static let shadowOffset: CGFloat = 2
    
}

final class ListContentviewTableViewCell: UITableViewCell {
    
    static var identifier: String {
         return String(describing: self)
     }
    
    //MARK: - Private properties -
    private let nameCafeLabel = UILabel()
    private let distanceLabel = UILabel()
    private let stackView = UIStackView()
    
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
        stackView.layoutIfNeeded()
        configureShadowPath()
    }
}

//MARK: - Public -
extension ListContentviewTableViewCell {
    func configure(data: ListEntity) {
        nameCafeLabel.text = data.name
    }
}

//MARK: - UI -
private extension ListContentviewTableViewCell {
    func setupUI() {
        addSubviews()
        makeConstraints()
        setupStackView()
        setupNameCafeLabel()
        setupDistanceLabel()
        settingCell()
    }
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(nameCafeLabel)
        stackView.addArrangedSubview(distanceLabel)
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.top.right.left.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-Constants.stackViewSpacing)
            $0.height.equalTo(68)
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
        stackView.alignment = .leading
        stackView.backgroundColor = Constants.cellBackgroundColor
        
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: Constants.leftOffsetSctackView, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = Constants.cellRadius
        
    }
    
    func setupNameCafeLabel() {
        nameCafeLabel.textColor = Constants.nameCafeTextColor
        nameCafeLabel.textAlignment = .left
        nameCafeLabel.font = UIFont(name: "SFUIDisplay-Bold", size: Constants.nameCafeLabelFontSize)
    }
    
    func setupDistanceLabel() {
        distanceLabel.textColor = Constants.distanceTextColor
        distanceLabel.textAlignment = .left
        distanceLabel.font = UIFont.boldSystemFont(ofSize: Constants.distanceLabelFontSize)
    }
    
    func settingCell() {
        backgroundColor = .clear
    }
    
    func configureShadowPath() {
        let shadowRect = stackView.bounds
            
        stackView.layer.masksToBounds = false
        stackView.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowRadius = Constants.shadowRadius
        stackView.layer.shadowOpacity = Constants.shadowOpacity
        stackView.layer.shadowOffset = CGSize(width: 0, height: Constants.shadowOffset)
    }
}
