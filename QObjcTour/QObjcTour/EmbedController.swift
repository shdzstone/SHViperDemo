//
//  EmbedController.swift
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

/*
import Foundation
import UIKit

class EmbedController {
    
    public private(set) weak var rootViewController: UIViewController?
    
    public private(set) var controllers = [UIViewController]()
    
    init (rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func append(viewController: UIViewController) {
        if let rootViewController = self.rootViewController {
            controllers.append(viewController)
            rootViewController.addChildViewController(viewController)
            rootViewController.view.addSubview(viewController.view)
        }
    }
    
    deinit {
        if self.rootViewController != nil {
            for controller in controllers {
                controller.view.removeFromSuperview()
                controller.removeFromParentViewController()
            }
            controllers.removeAll()
            self.rootViewController = nil
        }
    }
}


class SampleViewController: UIViewController {
    private var embedController: EmbedController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedController = EmbedController(rootViewController: self)
        
        let newViewController = ViewControllerWithButton()
        newViewController.view.frame = CGRect(origin: CGPoint(x: 50, y: 150), size: CGSize(width: 200, height: 80))
        newViewController.view.backgroundColor = .lightGray
        embedController?.append(viewController: newViewController)
    }
}



class ViewController: UIViewController {
    
    private var embedController: EmbedController?
    private var button: UIButton?
    private let addEmbedButtonTitle = "Add embed"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton(frame: CGRect(x: 50, y: 50, width: 150, height: 20))
        button?.setTitle(addEmbedButtonTitle, for: .normal)
        button?.setTitleColor(.black, for: .normal)
        button?.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button!)
        
        print("viewDidLoad")
        printChildViewControllesInfo()
    }
    
    func addChildViewControllers() {
        
        var newViewController = ViewControllerWithButton()
        newViewController.view.frame = CGRect(origin: CGPoint(x: 50, y: 150), size: CGSize(width: 200, height: 80))
        newViewController.view.backgroundColor = .lightGray
        embedController?.append(viewController: newViewController)
        
        newViewController = ViewControllerWithButton()
        newViewController.view.frame = CGRect(origin: CGPoint(x: 50, y: 250), size: CGSize(width: 200, height: 80))
        newViewController.view.backgroundColor = .blue
        embedController?.append(viewController: newViewController)
        
        print("\nChildViewControllers added")
        printChildViewControllesInfo()
    }
    
    func buttonTapped() {
        
        if embedController == nil {
            embedController = EmbedController(rootViewController: self)
            button?.setTitle("Remove embed", for: .normal)
            addChildViewControllers()
        } else {
            embedController = nil
            print("\nChildViewControllers removed")
            printChildViewControllesInfo()
            button?.setTitle(addEmbedButtonTitle, for: .normal)
        }
    }
    
    func printChildViewControllesInfo() {
        print("view.subviews.count: \(view.subviews.count)")
        print("childViewControllers.count: \(childViewControllers.count)")
    }
}

class ViewControllerWithButton:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addButon() {
        let buttonWidth: CGFloat = 150
        let buttonHeight: CGFloat = 20
        let frame = CGRect(x: (view.frame.width-buttonWidth)/2, y: (view.frame.height-buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        let button = UIButton(frame: frame)
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewWillLayoutSubviews() {
        addButon()
    }
    
    func buttonTapped() {
        print("Button tapped in \(self)")
    }
}

 
 */
