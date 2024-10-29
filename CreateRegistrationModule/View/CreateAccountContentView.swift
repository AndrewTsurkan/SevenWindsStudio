import UIKit

final class CreateAccountContentView: UIView {
    //MARK: - Private properties -
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordLabel = UILabel()
    private let paswordTextField = UITextField()
    private let repeatPasswordLabel = UILabel()
    private let repeatPaswordTextField = UITextField()
    private let registerButton = UIButton()
    
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
    }
    
    func addSubviews() {
        let subViews: [UIView] =  [emailLabel, emailTextField, passwordLabel, paswordTextField, repeatPasswordLabel, repeatPaswordTextField, registerButton]
        subViews.forEach { addSubview($0) }
    }
    
    func makeConstraints() {
        
    }
}
