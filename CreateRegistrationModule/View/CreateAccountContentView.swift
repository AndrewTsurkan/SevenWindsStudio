import UIKit
import SnapKit

fileprivate enum Constants {
    static let stackViewSpasing: CGFloat = 24
    static let stackViewOffset: CGFloat = 18
    static let mailLabel = "email_text"
    static let mailPlaceholder: String = "mail_example"
    static let passwordLabel: String = "password"
    static let passwordMask: String = "pasword_mask"
    static let repeatPasswordLabel: String = "repeat_password"
    static let buttonText: String = "registration_button"
}

final class CreateAccountContentView: UIView {
    //MARK: - Private properties -
    private let emailField = CustonTextField()
    private let passwordField =  CustonTextField()
    private let repeatPasswordField =  CustonTextField()
    private let registerButton = CustomButton()
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

//MARK: - UI -
private extension CreateAccountContentView {
    func setupUI() {
        addSubviews()
        makeConstraints()
        setupStackView()
        setupEmailField()
        setupPasswordField()
        setupRepeatPasswordField()
        setupRegisterButton()
        backgroundColor = .white
    }
    
    func addSubviews() {
        addSubview(stackView)
        let subViews: [UIView] =  [emailField, passwordField, repeatPasswordField, registerButton]
        subViews.forEach { stackView.addArrangedSubview($0) }
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.stackViewOffset)
            $0.right.equalToSuperview().offset(-Constants.stackViewOffset)
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpasing
    }
    
    func setupEmailField() {
        emailField.settingLabel(text: NSLocalizedString(Constants.mailLabel, comment: ""))
        emailField.settingTextField(placeholderText: NSLocalizedString(Constants.mailPlaceholder, comment: ""))
    }
    
    func setupPasswordField() {
        passwordField.settingLabel(text: NSLocalizedString(Constants.passwordLabel, comment: ""))
        passwordField.settingTextField(placeholderText: NSLocalizedString(Constants.passwordMask, comment: ""))
    }
    
    func setupRepeatPasswordField() {
        repeatPasswordField.settingLabel(text: NSLocalizedString(Constants.repeatPasswordLabel, comment: ""))
        repeatPasswordField.settingTextField(placeholderText: NSLocalizedString(Constants.passwordMask, comment: ""))
    }
    
    func setupRegisterButton() {
        registerButton.settingButtonTitle(title: NSLocalizedString(Constants.buttonText, comment: ""))
    }
}
