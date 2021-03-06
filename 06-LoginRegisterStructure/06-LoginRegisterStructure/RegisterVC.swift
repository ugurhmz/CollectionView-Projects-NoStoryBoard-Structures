//
//  RegisterVC.swift
//  06-LoginRegisterStructure
//
//  Created by ugur-pc on 22.05.2022.
//
import UIKit

class RegisterVC: UIViewController {
    
    private let myview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let personImgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.crop.circle.badge.plus")
        iv.tintColor = .white
        return iv
    }()
    
    private let registerTxtLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont(name: "Zapfino", size: 45)
        label.text = "Register"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let txtUsername: CustomTextField = {
        let txt = CustomTextField(padding: 24, height: 55)
        txt.backgroundColor = .white
        txt.placeholder = "Username"
        txt.layer.borderWidth = 1
        return txt
    }()
    
    private let txtEmail: CustomTextField = {
        let txt = CustomTextField(padding: 24, height: 55)
        txt.backgroundColor = .white
        txt.keyboardType = .emailAddress
        txt.placeholder = "Email address"
        txt.layer.borderWidth = 1
        return txt
    }()
    
    private let txtPassword: CustomTextField = {
        let txt = CustomTextField(padding: 24, height: 55)
        txt.backgroundColor = .white
        txt.isSecureTextEntry = true
        txt.placeholder = "Password"
        txt.layer.borderWidth = 1
        txt.addTarget(self, action: #selector(pwTextDidChange(_:)), for: .editingChanged)
        return txt
    }()
    
    
    private let txtRePassword: CustomTextField = {
        let txt = CustomTextField(padding: 24, height: 55)
        txt.backgroundColor = .white
        txt.isSecureTextEntry = true
        txt.placeholder = "Re password"
        txt.layer.borderWidth = 1
        txt.addTarget(self, action: #selector(pwTextDidChange(_:)), for: .editingChanged)
        return txt
    }()
    
    // Password did change
    @objc func pwTextDidChange(_ textField: UITextField){
        
        guard let passTxt = txtPassword.text else { return }
        
        // typing then check when remove in field
        if textField == txtRePassword {
            checkPaswoordFieldImg.isHidden = false
            checkRePasswordImg.isHidden = false
        } else {
            if passTxt.isEmpty {
                checkPaswoordFieldImg.isHidden = true
                checkRePasswordImg.isHidden = true
                txtRePassword.text = ""
            }
        }
        
        // matching
        if txtPassword.text == txtRePassword.text {
            checkPaswoordFieldImg.tintColor = UIColor(red: 16/255, green: 129/255, blue: 49/255, alpha: 1)
            checkRePasswordImg.tintColor = UIColor(red: 16/255, green: 129/255, blue: 49/255, alpha: 1)
        } else {
            checkPaswoordFieldImg.tintColor = .red
            checkRePasswordImg.tintColor = .red
        }
    }
    
    private let registerBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.backgroundColor = UIColor(red: 16/255, green: 129/255, blue: 49/255, alpha: 1)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(red: 16/255, green: 129/255, blue: 49/255, alpha: 1).cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        btn.addTarget(self, action: #selector(clickRegisterBtn), for: .touchUpInside)
        return btn
    }()
    
    private let checkPaswoordFieldImg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "checkmark.circle")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .red
        return iv
    }()
    
    private let checkRePasswordImg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "checkmark.circle")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .red
        return iv
    }()
    
    // click registerBtn
    @objc func clickRegisterBtn(){
       
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerTxtLabel,txtUsername,txtEmail, txtPassword,txtRePassword, registerBtn ])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 16/255, green: 129/255, blue: 49/255, alpha: 1)
        setupViews()
        setConstraints()
    }
    
}

//MARK: -
extension RegisterVC {
    private func setupViews(){
        view.addSubview(myview)
        view.addSubview(stackView)
        view.addSubview(personImgView)
        view.addSubview(checkPaswoordFieldImg)
        view.addSubview(checkRePasswordImg)
        setupShadows()
        checkPaswoordFieldImg.isHidden = true
        checkRePasswordImg.isHidden = true
    }
    
    private func setupShadows(){
        
        myview.layer.cornerRadius = 50
        myview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        myview.layer.shadowOpacity = 145
        myview.layer.shadowRadius = 140
        myview.layer.shadowColor = UIColor.blue.cgColor
        
        
        txtEmail.layer.shadowOpacity = 2
        txtEmail.layer.shadowRadius = 2
        txtEmail.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor


        txtPassword.layer.shadowOpacity = 2
        txtPassword.layer.shadowRadius = 2
        txtPassword.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        
        txtRePassword.layer.shadowOpacity = 2
        txtRePassword.layer.shadowRadius = 2
        txtRePassword.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor

        txtUsername.layer.shadowOpacity = 2
        txtUsername.layer.shadowRadius = 2
        txtUsername.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor

        registerBtn.layer.shadowOpacity = 2
        registerBtn.layer.shadowRadius = 2
        registerBtn.layer.shadowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).cgColor
    }
    
    
    private func setConstraints(){
        myview.anchor(top: view.topAnchor,
                      leading: view.leadingAnchor,
                      bottom: view.bottomAnchor,
                      trailing: view.trailingAnchor,
                      padding: .init(top: 200, left: 0, bottom: 0, right: 0))
        
        stackView.anchor(top: nil,
                         leading: view.leadingAnchor,
                         bottom: nil,
                         trailing: view.trailingAnchor,
                         padding: .init(top: 0, left: 30, bottom: 0, right: 30))
        stackView.centerYInSuperview()
        
        personImgView.anchor(top: view.topAnchor,
                              leading: nil,
                             bottom: myview.topAnchor,
                              trailing: nil,
                              padding: .init(top: 20, left: 0, bottom: 30, right: 0),
                             size: .init(width: 150, height: 100)
        )
        personImgView.centerXInSuperview()
        
        
        checkPaswoordFieldImg.anchor(top: txtPassword.topAnchor,
                             leading: nil,
                             bottom: nil,
                             trailing: txtPassword.trailingAnchor,
                             padding: .init(top: 5, left: 0, bottom: 0, right: 10),
                             size: .init(width: 40, height: 40))
        
        checkRePasswordImg.anchor(top: txtRePassword.topAnchor,
                             leading: nil,
                             bottom: nil,
                             trailing: txtRePassword.trailingAnchor,
                             padding: .init(top: 5, left: 0, bottom: 0, right: 10),
                             size: .init(width: 40, height: 40))
        
    }
}
