import UIKit
import SnapKit

fileprivate enum Constants {
    static let stackViewSpasing: CGFloat = 24
    static let leftAndRightOffset: CGFloat = 18
    static let rigisterButtonTopOffset: CGFloat = 30
}

final class CreateAccountContentView: UIView {
    //MARK: - Private properties -
    private let emailField = CustomTextField()
    private let passwordField =  CustomTextField()
    private let repeatPasswordField =  CustomTextField()
    private let registerButton = CustomButton()
    private let stackView = UIStackView()
    var buttonAction: (() -> Void)?
    
    var emailText: String? {
        emailField.textFieldData()
    }
    
    var passwordText: String? {
        passwordField.textFieldData()
    }
    
    var repeatPasswordText: String? {
        repeatPasswordField.textFieldData()
    }
    
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
extension CreateAccountContentView {
    func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailField.setDelagate(dalegate: delegate)
        passwordField.setDelagate(dalegate: delegate)
        repeatPasswordField.setDelagate(dalegate: delegate)
    }
    
    func enabelButton(enable: Bool) {
        registerButton.enableButton(enable: enable)
        registerButton.setAlpha(enable: enable)
    }
    
    func mailBorderColor(color: CGColor) {
        emailField.borderColor(color: color)
    }
    
    func passwordBorderColor(color: CGColor) {
        passwordField.borderColor(color: color)
    }
    
    func repeatBorderColor(color: CGColor) {
        repeatPasswordField.borderColor(color: color)
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
        addSubview(registerButton)
        let subViews: [UIView] =  [emailField, passwordField, repeatPasswordField]
        subViews.forEach { stackView.addArrangedSubview($0) }
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightOffset)
           
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(Constants.rigisterButtonTopOffset)
            $0.left.equalToSuperview().offset(Constants.leftAndRightOffset)
            $0.right.equalToSuperview().offset(-Constants.leftAndRightOffset)

        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpasing
    }
    
    func setupEmailField() {
        emailField.settingLabel(text: Localizable.emailText)
        emailField.settingTextField(placeholderText:Localizable.mailExample)
        emailField.setTag(tag: 0)
    }
    
    func setupPasswordField() {
        passwordField.settingLabel(text: Localizable.password)
        passwordField.settingTextField(placeholderText: Localizable.passwordMask)
        passwordField.setTag(tag: 1)
        passwordField.setMode(true)
    }
    
    func setupRepeatPasswordField() {
        repeatPasswordField.settingLabel(text: Localizable.repeatPassword)
        repeatPasswordField.settingTextField(placeholderText: Localizable.passwordMask)
        repeatPasswordField.setTag(tag: 2)
        repeatPasswordField.setMode(true)
    }
    
    func setupRegisterButton() {
        registerButton.settingButtonTitle(title: Localizable.registrationTitle)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
}

//MARK: - Private -
private extension CreateAccountContentView {
    @objc func registerButtonTapped() {
        buttonAction?()
    }
}
