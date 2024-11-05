import UIKit

fileprivate enum Constants {
    static let stackViewSpacing: CGFloat = 24
    static let leftAndRightOffset: CGFloat = 18
    static let enterButtonTopOffset: CGFloat = 30
}

final class AuthorizationContentView: UIView {
    //MARK: - Private Properties -
    private let mailField = CustomTextField()
    private let passwordField = CustomTextField()
    private let enterButton = CustomButton()
    private let stackView = UIStackView()
    var buttonAction: (() -> Void)?
    
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
    }
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(mailField)
        stackView.addArrangedSubview(passwordField)
        addSubview(enterButton)
    }
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(Constants.stackViewSpacing)
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightOffset)
        }
        
        enterButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(Constants.leftAndRightOffset)
            $0.top.equalTo(stackView.snp.bottom).offset(Constants.enterButtonTopOffset)
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
extension AuthorizationContentView {
    @objc func enterButtonTapped() {
        buttonAction?()
    }
}
