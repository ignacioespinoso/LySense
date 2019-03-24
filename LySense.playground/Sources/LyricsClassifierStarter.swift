import Foundation
import PlaygroundSupport
import UIKit

public func run() {
    let introVc = IntroController()
    let navController = UINavigationController(rootViewController: introVc)
    navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navController.view.frame = introVc.view.frame
        
    PlaygroundPage.current.liveView = navController.view
}

