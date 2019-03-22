//: [Previous](@previous)
/*:
 ## Passion for data
 
 Hi! I am Ignácio, and I am passionate about finding meaning within data. This passion drives me to make an impact in a meaningful way.
*/
import Foundation
import PlaygroundSupport
import UIKit


let introVc = IntroController()
let navController = UINavigationController(rootViewController: introVc)
navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
navController.view.frame = introVc.view.frame

PlaygroundPage.current.liveView = navController.view

//: [Next](@next)
