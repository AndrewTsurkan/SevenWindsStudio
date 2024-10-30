import UIKit
import SnapKit

fileprivate enum Constants {
    static let stackViewSpasing: CGFloat = 24
    static let leftAndRightOffset: CGFloat = 18
    static let rigisterButtonTopOffset: CGFloat = 30
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
        addSubview(registerButton)
        let subViews: [UIView] =  [emailField, passwordField, repeatPasswordField]
        subViews.forEach { stackView.addArrangedSubview($0) }
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.leftAndRightOffset)
            $0.right.equalToSuperview().offset(-Constants.leftAndRightOffset)
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
    }
    
    func setupPasswordField() {
        passwordField.settingLabel(text: Localizable.password)
        passwordField.settingTextField(placeholderText: Localizable.passwordMask)
    }
    
    func setupRepeatPasswordField() {
        repeatPasswordField.settingLabel(text: Localizable.repeatPassword)
        repeatPasswordField.settingTextField(placeholderText: Localizable.passwordMask)
    }
    
    func setupRegisterButton() {
        registerButton.settingButtonTitle(title: Localizable.registrationTitle)
    }
}
