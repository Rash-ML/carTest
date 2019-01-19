//
//  ApplicationNavigationController.swift
//  CarSample
//
//  Created by Admin on 1/17/19.
//  Copyright © 2019 Arash. All rights reserved.
//

import UIKit

class ApplicationNavigationController: UINavigationController {

    let applicationViewModel: ApplicationViewModel
    init(applicationViewModel: ApplicationViewModel) {
        self.applicationViewModel = applicationViewModel
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
        self.applicationViewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .babyPowder
        
        //modify navigationbar attributes
        navigationBar.isTranslucent = false
        
        //if you want to remove 1px bottom line of navigation bar , uncomnet below codes
        navigationBar.setValue(true, forKey: "hidesShadow")
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                             .foregroundColor: UIColor.smockyBlack]
        
        //create root view controller
        let spalshViewController = load(SplashViewController.self, from: .mainStoryBoard)
        spalshViewController.delegate = self
        setViewControllers([spalshViewController], animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - Splash delegate
extension ApplicationNavigationController: SplashViewControllerDelegate {
    func splashDidPresent() {
        print("splash did Present")
    }
}

//MARK: - NavigationController Delegate
extension ApplicationNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        switch viewController {
        case is ManufactureListViewController:
            viewController.navigationItem.title = "Manufactures"
        default:
            break
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        switch viewController {
        default:
            break
        }
    }
}


//MARK: - Application View Model delegate
extension ApplicationNavigationController: ApplicationViewModelDelegate {
    
    func applciationLaunchedFromUrl(_ url: URL) {
        
    }
    
    func applicationDidLaunchNormally() {
        
        let viewModel = ManufactureListViewModel()
        let manufactureListViewController = ManufactureListViewController(viewModel: viewModel)
        manufactureListViewController.delegate = self
        //FIXME: - remove delay...its because of spalsh animation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.0) {
            self.setViewControllers([manufactureListViewController], animated: true)
        }
    }
    
}


//MARK: - Manufacure Delegate
extension ApplicationNavigationController: ManufactureListViewControllerDelegate {
    
    func didSelectManufacture(_ manufacture: Manufacture) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            print("did select manufacture")
            let modelListVC = ModelListViewController()
            self.pushViewController(modelListVC, animated: true)
        }
    }
    
}



