//
//  LoginViewController.swift
//  TodaysOutside
//
//  Created by sapere4ude on 2021/02/08.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(appleLoginBtn)
        view.addSubview(kakaoLoginButton)
    }
    
    private let appleLoginBtn: ASAuthorizationAppleIDButton = {
       let button = ASAuthorizationAppleIDButton()
        button.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        return button
    }()
    
    private let kakaoLoginButton: KOLoginButton = {
    let button = KOLoginButton()
    button.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
    }()
    
    // Apple Login
    @objc func handleAuthorizationAppleIDButtonPress() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
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
    
    // layout setting
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        appleLoginBtn.frame = CGRect(x: 30, y: view.bounds.height/2, width: view.bounds.width-50, height: 50)
        kakaoLoginButton.frame = CGRect(x: 30, y: (view.bounds.height/2)+70, width: view.bounds.width-50, height: 50)
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
