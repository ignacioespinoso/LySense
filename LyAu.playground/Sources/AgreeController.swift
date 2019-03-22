import Foundation
import PlaygroundSupport
import UIKit

public class AgreeController : UIViewController {
    public override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 834, height: 1112))
        if let image = UIImage(named: "AgreeBackground") {
            let imageView = UIImageView(image: image)
            imageView.frame = self.view.frame
            self.view.addSubview(imageView)
        } else {
            self.view.backgroundColor = .blue
        }
    }
    
    
    public override func viewDidLoad() {
        let buttonWidth: CGFloat = 359.0
        let buttonHeight: CGFloat = 56.0
        
//            Back to the beginning Button definition
        let agreeButton : UIButton = UIButton()
        agreeButton.frame = CGRect(x: 238, y: 621, width: buttonWidth, height: buttonHeight)
        let agreeImage = UIImage(named:"goToIntroButton")
        agreeButton.setImage(agreeImage, for: .normal)
        agreeButton.addTarget(self, action: #selector(backToIntro), for: .touchUpInside)
        self.view.addSubview(agreeButton)
    }
    
    @objc func backToIntro() {
        let newController = IntroController()
        self.navigationController?.setViewControllers([newController], animated: true)
    }
}
