//
//  ViewController.swift
//  CustomAnimatedButton
//
//  Created by Rushikesh Potdar on 30/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateButton: UIButton!
    
    let upcomingBtn = UIButton()
    let exploreBtn = UIButton()
    let settingBtn = UIButton()
    let profileBtn = UIButton()
    var isOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons(option: upcomingBtn, btnColor: .white, bgImage: UIImage(systemName: "calendar")!)
        setupButtons(option: exploreBtn, btnColor: .white, bgImage: UIImage(systemName: "location.circle")!)
        setupButtons(option: settingBtn, btnColor: .white, bgImage: UIImage(systemName: "gearshape")!)
        setupButtons(option: profileBtn, btnColor: .white, bgImage: UIImage(systemName: "person")!)
        animateButton.layer.cornerRadius = 15
        view.backgroundColor = .black
        self.view.bringSubviewToFront(animateButton)
    }
    
    @IBAction func animateButtonPressed(_ sender: UIButton) {
        
        if isOpen{
            closeButtons(button: upcomingBtn)
            closeButtons(button: settingBtn)
            closeButtons(button: exploreBtn)
            closeButtons(button: profileBtn)
            
        }else{
            animateButtons(button: upcomingBtn)
            animateButtons(button: settingBtn)
            animateButtons(button: exploreBtn)
            animateButtons(button: profileBtn)
        }
        
        isOpen = !isOpen
        
    }

}

extension ViewController {
    
    func animateButtons(button : UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseInOut) {
            button.transform = CGAffineTransform(translationX: 0.0, y: -(button.bounds.height * 2 + 30))
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut) {
                    button.transform = CGAffineTransform(translationX: 0.0, y: -(button.bounds.height * 2))
                } completion: { done in
                    if done {
                        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut) {
                            button.transform = CGAffineTransform(translationX: 0.0, y: -(button.bounds.height * 2 + 15))
                        } completion: { done in
                            if done {
                                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut) {
                                    button.transform = CGAffineTransform(translationX: 0.0, y: -(button.bounds.height * 2))
                                } completion: { done in
                                    if done {
                                        self.spradeThebuttons()
                                    }
                                }

                            }
                        }

                    }
                }

            }
        }

    }
    
    func setupButtons(option button : UIButton, btnColor : UIColor, bgImage : UIImage){
        self.view.addSubview(button)
        button.tintColor = .black
        button.backgroundColor = btnColor
        button.setImage(bgImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: animateButton.topAnchor, constant: 55).isActive = true
    }
    
    
    func spradeThebuttons(){
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseInOut) {
            self.upcomingBtn.transform = CGAffineTransform(translationX: -(self.upcomingBtn.bounds.width * 2.4), y: -(self.upcomingBtn.bounds.height * 2))
            self.profileBtn.transform = CGAffineTransform(translationX: (self.profileBtn.bounds.width * 2.4), y: -(self.profileBtn.bounds.height * 2))
            self.exploreBtn.transform = CGAffineTransform(translationX: (self.exploreBtn.bounds.width * 0.8), y: -(self.exploreBtn.bounds.height * 2))
            self.settingBtn.transform = CGAffineTransform(translationX: -(self.settingBtn.bounds.width * 0.8), y: -(self.settingBtn.bounds.height * 2))
            
        } completion: { done in
            if done{
                
            }
        }

    }
    
    
    func closeButtons(button : UIButton){
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseInOut) {
            button.transform = CGAffineTransform(translationX: 0.0, y: -(button.bounds.height * 2))
        } completion: { done in
            if done{
                UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseInOut) {
                    button.transform = CGAffineTransform(translationX: 0.0, y: button.bounds.height * 0)
                } completion: { done in
                    
                }

            }
        }

    }
    
}

