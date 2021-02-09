//
//  LoginViewController.swift
//  TodaysOutside
//
//  Created by sapere4ude on 2021/02/08.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    @IBOutlet weak var loginProviderStackView: UIStackView!
    
    private let loginButton: KOLoginButton = {
        let button = KOLoginButton()
        button.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
      }()

    // Apple 로그인
    func setupProviderLoginView() {
      let authorizationButton = ASAuthorizationAppleIDButton()
      authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
      self.loginProviderStackView.addArrangedSubview(authorizationButton)
    }
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layout()
        setupProviderLoginView()
        print("check")
      }
      
    // Kakao Login
      @objc private func touchUpLoginButton(_ sender: UIButton) {
        guard let session = KOSession.shared() else {
          return
        }
        
        if session.isOpen() {
          session.close()
        }
        
        session.open { (error) in
          if error != nil || !session.isOpen() { return }
          KOSessionTask.userMeTask(completion: { (error, user) in
            guard let user = user,
                  let email = user.account?.email,
                  let nickname = user.nickname else { return }
            
            let mainVC = MainViewController()
            mainVC.emailLabel.text = email
            mainVC.nicnameLabel.text = nickname
            
            self.present(mainVC, animated: false, completion: nil)
          })
        }
      }

    // Apple 로그인 버튼 클릭
    @objc func handleAuthorizationAppleIDButtonPress() {
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
            
      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
    
      private func layout() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(loginButton)
        
        loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      }
}
