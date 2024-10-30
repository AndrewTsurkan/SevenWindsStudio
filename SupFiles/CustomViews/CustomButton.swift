import UIKit

fileprivate enum Constants {
    static let backgroundColor: UIColor = .init(red: 52/255, green: 45/255, blue: 26/255, alpha: 1)
    static let radius: CGFloat = 24.5
    static let borderColor =  UIColor.init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let dorderWidth: CGFloat = 2
    static let textColor: UIColor = .init(red: 246/255, green: 229/255, blue: 209/255, alpha: 1)
    static let height: CGFloat = 47
}

final class CustomButton: UIButton {
    //MARK: - life cycle - 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public -
extension CustomButton {
    func settingButtonTitle(title: String) {
        self.setTitle(title, for: .normal)
    }
}

//MARK: - UI -
private extension CustomButton {
    func setupButton() {
        self.backgroundColor = Constants.backgroundColor
        self.layer.cornerRadius = Constants.radius
        self.layer.borderColor = Constants.borderColor.cgColor
        self.layer.borderWidth = Constants.dorderWidth
        self.setTitleColor(Constants.textColor, for: .normal)
        self.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
}
