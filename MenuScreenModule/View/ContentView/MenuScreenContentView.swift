import UIKit

fileprivate enum Constants {
    static let priceButtonBottomInset: CGFloat = 32
    static let priceButtonleftOffset: CGFloat = 19
    static let priceButtonRightOffset: CGFloat = 19
    static let sectionTopOffset: CGFloat = 17
    static let sectionLeftAndRightOffset: CGFloat = 16
    static let collectionViewBottomOffset: CGFloat = 21
    static let groupOffset: CGFloat = 13
    static let heightCell: CGFloat = 205
}
final class MenuScreenContentView: UIView {
    //MARK: - Private properties -
    private var collectionView: UICollectionView!
    private let priceButton = CustomButton()
    var orderButtonAction: (() -> Void)?

    
    
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
private extension MenuScreenContentView {
    func setupUI() {
        setupCollectionView()
        addSubviews()
        makeConstraints()
        setupPriceButton()
        backgroundColor = .white
    }
    
    func addSubviews() {
        addSubview(collectionView)
        addSubview(priceButton)
    }
    
    func makeConstraints() {
        priceButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(Constants.priceButtonBottomInset)
            $0.left.equalToSuperview().offset(Constants.priceButtonleftOffset)
            $0.right.equalToSuperview().inset(Constants.priceButtonRightOffset)
        }
        
        collectionView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalTo(priceButton.snp.top).offset(-Constants.collectionViewBottomOffset)
        }
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(MenuScreenCollectionViewCell.self, forCellWithReuseIdentifier: MenuScreenCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
    }
    
    func setupPriceButton() {
        priceButton.settingButtonTitle(title: Localizable.goToCartoon)
        priceButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
    }
}

//MARK: - Public -
extension MenuScreenContentView {
    func setDelegate(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.layoutIfNeeded()
            self?.collectionView.reloadData()
        }
    }
}

//MARK: - Private -
private extension MenuScreenContentView {
    func createLayout() -> UICollectionViewCompositionalLayout {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(Constants.heightCell))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(Constants.groupOffset)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: Constants.sectionTopOffset,
            leading: Constants.sectionLeftAndRightOffset,
            bottom: 0,
            trailing: Constants.sectionLeftAndRightOffset)
        section.interGroupSpacing = Constants.groupOffset
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    @objc func orderButtonTapped() {
        orderButtonAction?()
    }
}
