//
//  LoginViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    var userArray: [User] = []
    var result: Users?
    let userNetwork = UserNetwork()
    private var formsArray = [DataForms]()
    
    lazy var tableScreen = OnlyTableView()
    
    //    let loginView = LoginView()
    
    //    var userName: String?{
    //        return loginView.accessView.userNameTextField.text
    //    }
    //    var password: String?{
    //        return loginView.accessView.passwordTextField.text
    //    }
    
    override func loadView() {
        view = tableScreen
        view.backgroundColor = .backgroundColorYellow
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        userNetwork.parseJSON()
        fillFieldsForms()
        tableScreen.configureTableProtocols(delegate: self, dataSource: self)
        
        //        loginView.animationView.loginAnimation.play()
    }
    
    private func actionButtons(){
        //        loginView.signInButton.addTarget(self, action: #selector(signInTapped(sender:)), for: .primaryActionTriggered)
        //        loginView.newUserButton.addTarget(self, action: #selector(registerInTapped(sender:)), for: .primaryActionTriggered)
    }
    
    //    @objc func signInTapped(sender: UIButton){
    //        loginView.errorMessageLabel.isHidden = true
    //        login()
    //    }
    //    @objc func registerInTapped(sender: UIButton){
    //        loginView.errorMessageLabel.isHidden = true
    //        let openRegister = RegisterUserViewController()
    //        self.navigationController?.pushViewController(openRegister, animated: true)
    //    }
    
    private func fillFieldsForms(){
        formsArray.append(DataForms(title: "Nome", fPlaceholder: "Insira seu nome", isSecured: false))
        formsArray.append(DataForms(title: "Senha", fPlaceholder: "Insira sua senha", isSecured: true))
    }
    
}
extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return 3 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = CircleTableViewCell()
            return cell
        case 1:
            let cell = FormsTableViewCell()
            cell.bind(formsArray[indexPath.row])
            cell.delegate = self
            return cell
        case 2:
            let cell = OnlyBtnTableViewCell("Entrar")
            cell.onClick = nil //incluir funcao de navegacao
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UIScreen.main.bounds.height/2
        default:
            return UITableView.automaticDimension
        }
    }
}

extension LoginViewController: FormsDelegateProtocol {
    func textFieldShouldClear(_ textField: UITextField) -> Bool { true }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.backgroundColor = .backgroundColorYellowLight
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.backgroundColor = .backgroundColorYellow
    }
    
    
}
    
    
//extension LoginViewController {
//    private func login(){
//        guard let userName = userName, let password = password else {
//            assertionFailure("Username/ password should never be nil.")
//            return
//        }
//        if userName.isEmpty || password.isEmpty{
//            configureView(withMessage: "Username/ password cannot be blank.")
//            return
//        }
//
////        guard let nameJson = result?.user.name else { return }
////        guard let passwordJson = result?.user.password else { return }
//         
////        if userName == nameJson && password == passwordJson {
//        if userName == "Kevin" && password == "oi"{
//            loginView.signInButton.configuration?.showsActivityIndicator = true
//            self.show(ResultsViewController(), sender: nil)
//        } else {
//            configureView(withMessage: "Incorrect username/ password.")
//        }
//    }
//    private func configureView(withMessage message: String){
//        loginView.errorMessageLabel.isHidden = false
//        loginView.errorMessageLabel.text = message
//    }
//}
