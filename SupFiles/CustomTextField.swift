import UIKit
import SnapKit

fileprivate enum Constants {
    static let spacing: CGFloat = 2
    static let cornerRadius: CGFloat = 24.5
    static let labelSize: CGFloat = 15
    static let customColor =  UIColor.init(red: 132, green: 99, blue: 64, alpha: 1)
    static let dorderWidth: CGFloat = 2
}

final class CustonTextField: UIView {
    //MARK: - Private properties -
    private let label = UILabel()
    private let textField = UITextField()
    private let stackView = UIStackView()
    
    //MARK: - Live cycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Public -
extension CustonTextField {
    func settingTextField(placeholder: String) {
        textField.placeholder = placeholder
    }
    
    func settingLabel(text: String) {
        label.text = text
    }
}
//MARK: - UI -
private extension CustonTextField {
    func setupUI() {
        addSunbviews()
        makeConstraints()
        setupStackView()
        setupLabel()
        setupTextField()
    }
    
    func addSunbviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = Constants.spacing
    }
    func setupLabel() {
        label.font = UIFont.systemFont(ofSize: Constants.labelSize)
        label.textColor = Constants.customColor
    }
    
    func setupTextField() {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder != nil ? textField.placeholder!: "",
                                                             attributes: [.foregroundColor: Constants.customColor])
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.layer.borderColor = Constants.customColor.cgColor
        textField.layer.borderWidth = Constants.dorderWidth
    }
}
