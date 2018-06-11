//
//  ViewController.swift
//  Lottie_iOS
//
//  Created by Sandeep Mukherjee on 08/06/2018.
//  Copyright © 2018 Sandeep Mukherjee. All rights reserved.
//

import UIKit


import  Lottie

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        doInitialAnimation()
    }
    
    func doInitialAnimation()
    {
      let animationView = LOTAnimationView(name: "loading")
            animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill
            animationView.autoReverseAnimation = true
            view.addSubview(animationView)
            animationView.play()
            pushToViewOne()
            
        
    }
    func pushToViewOne()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.4) {
            
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SampleVC1") as UIViewController
            viewController.transitioningDelegate = self ;

            self.present(viewController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}
// MARK: -- View Controller Transitioning

func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animationController = LOTAnimationTransitionController(animationNamed: "vcTransition1", fromLayerNamed: "outLayer", toLayerNamed: "inLayer", applyAnimationTransform: false)
    
    return animationController
}

func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let animationController = LOTAnimationTransitionController(animationNamed: "vcTransition2", fromLayerNamed: "outLayer", toLayerNamed: "inLayer", applyAnimationTransform: false)
    return animationController
}



