import UIKit

fileprivate enum Constants {
    static let stackViewSpacing: CGFloat = 24
    static let leftAndRightOffset: CGFloat = 18
    static let enterButtonTopOffset: CGFloat = 30
    static let registrationButtonFontSize: CGFloat = 16
    static let registrationBittonTitleColor: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
    static let registrationButtonTopOffset: CGFloat = 20
    static let regisrationButtonOffset: CGFloat = 10

}

final class AuthorizationContentView: UIView {
    //MARK: - Private Properties -
    private let mailField = CustomTextField()
    private let passwordField = CustomTextField()
    private let enterButton = CustomButton()
    private let stackView = UIStackView()
    private let registrationButton = UIButton()
    var enterButtonAction: (() -> Void)?
    var registrationButtonAction: (() -> Void)?

    
    var emailText: String? {
        mailField.textFieldData()
    }
    
    var passwordText: String? {
        passwordField.textFieldData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI -
private extension AuthorizationContentView {
    func setupUI() {
        addSubviews()
        makeConstraints()
        setupStackView()
        setupMailField()
        setupPasswordField()
        setupEnterButton()
        setupRegistrationButton()
    }
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(mailField)
        stackView.addArrangedSubview(passwordField)
        addSubview(enterButton)
        addSubview(registrationButton)
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-Constants.stackViewSpacing)
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightOffset)
        }
        
        enterButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightOffset)
            $0.top.equalTo(stackView.snp.bottom).offset(Constants.enterButtonTopOffset)
        }
        
        registrationButton.snp.makeConstraints {
            $0.top.equalTo(enterButton.snp.bottom).offset(Constants.registrationButtonTopOffset)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Constants.regisrationButtonOffset)
        }
    }
    
    func setupStackView() {
        stackView.spacing = Constants.stackViewSpacing
        stackView.axis = .vertical
    }
    
    func setupMailField() {
        mailField.settingLabel(text: Localizable.emailText)
        mailField.settingTextField(placeholderText: Localizable.mailExample)
    }
    
    func setupPasswordField() {
        passwordField.settingLabel(text: Localizable.password)
        passwordField.settingTextField(placeholderText: Localizable.passwordMask)
        passwordField.setMode(true)
    }
    
    func setupEnterButton() {
        enterButton.settingButtonTitle(title: Localizable.enterTitle)
        enterButton.addTarget(self, action: #selector (enterButtonTapped), for: .touchUpInside)
    }
    
    func setupRegistrationButton() {
        registrationButton.setTitle(Localizable.createAccount, for: .normal)
        registrationButton.backgroundColor = .clear
        registrationButton.setTitleColor(Constants.registrationBittonTitleColor, for: .normal)
        registrationButton.titleLabel?.font = UIFont.systemFont(ofSize: Constants.registrationButtonFontSize)
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
    }
}

//MARK: - Public -
extension AuthorizationContentView {
    func enabelButton(enable: Bool) {
        enterButton.enableButton(enable: enable)
        enterButton.setAlpha(enable: enable)
    }
    
    func setTextFieldDelegate(delegate: UITextFieldDelegate) {
        mailField.setDelagate(dalegate: delegate)
        passwordField.setDelagate(dalegate: delegate)
    }
}

//MARK: - Private -
private extension AuthorizationContentView {
    @objc func enterButtonTapped() {
        enterButtonAction?()
    }
    
    @objc func registrationButtonTapped() {
        registrationButtonAction?()
    }
}
