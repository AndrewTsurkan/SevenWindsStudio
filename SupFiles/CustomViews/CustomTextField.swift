import UIKit
import SnapKit

fileprivate enum Constants {
    static let spacing: CGFloat = 8
    static let cornerRadius: CGFloat = 24.5
    static let labelSize: CGFloat = 15
    static let customColor =  UIColor.init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let dorderWidth: CGFloat = 2
    static let height: CGFloat = 47
    static let leftViewFrame: CGFloat = 0
    static let leftViewWith: CGFloat = 20
    static let leftViewHeight: CGFloat = 2
}

final class CustomTextField: UIView {
    //MARK: - Private properties -
    private let label = UILabel()
    private let textField = UITextField()
    private let stackView = UIStackView()
    
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
extension CustomTextField {
    func settingTextField(placeholderText: String) {
        textField.placeholder = placeholderText   }
    
    func settingLabel(text: String) {
        label.text = text
    }
    
    func textFieldData() -> String? {
        return textField.text
    }
    
    func setDelagate(dalegate: UITextFieldDelegate) {
        textField.delegate = dalegate
    }
    
    func setMode(_ mode: Bool) {
        textField.isSecureTextEntry = mode
    }
    
    func setTag(tag: Int) {
        textField.tag = tag
    }
    
    func borderColor(color: CGColor) {
        textField.layer.borderColor = color
        textField.layer.borderWidth = Constants.dorderWidth
    }
}
//MARK: - UI -
private extension CustomTextField {
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
        let leftView = UIView(frame: CGRect(x: Constants.leftViewFrame,
                                            y: Constants.leftViewFrame,
                                            width: Constants.leftViewWith,
                                            height: Constants.leftViewHeight))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
    }
}
