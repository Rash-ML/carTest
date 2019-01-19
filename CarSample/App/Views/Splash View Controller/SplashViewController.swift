//
//  SplashViewController.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import UIKit

protocol SplashViewControllerDelegate: class {
    func splashDidPresent()
}

//MARK: - SplashViewController
class SplashViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    weak var delegate: SplashViewControllerDelegate?
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .babyPowder
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let inset: CGFloat = 5.0
        let xTransform = CGAffineTransform(translationX: self.loadingIndicator.bounds.width + inset,
                                           y: 0.0)
        let animator = UIViewPropertyAnimator(duration: 0.3,
                                              curve: .easeInOut,
                                              animations: nil)
        animator.addAnimations {
            self.loadingIndicator.isHidden = false
            self.loadingIndicator.alpha = 1.0
            self.loadingIndicator.startAnimating()
            self.subtitleLabel.transform = xTransform
        }
        animator.addCompletion { ( position ) in
            if
                position == .end {
                self.delegate?.splashDidPresent()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            animator.startAnimation()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
