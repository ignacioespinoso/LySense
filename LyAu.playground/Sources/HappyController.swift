import Foundation
import PlaygroundSupport
import UIKit

public class HappyController: UIViewController {
    var probability: Float = 0.0
    
    public override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 834, height: 1112))
        if let image = UIImage(named: "HappyBackground") {
            let imageView = UIImageView(image: image)
            imageView.frame = self.view.frame
            self.view.addSubview(imageView)
        } else {
            self.view.backgroundColor = .orange
        }
        
    }
    
    
    public override func viewDidLoad() {
        
        if let image = UIImage(named: "happy") {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 105, y: 58, width: 165, height: 165)
            imageView.center = self.view.center
            imageView.center.y = 1200
            self.view.addSubview(imageView)
            UIView.animate(withDuration: 2, animations: {
                imageView.frame = CGRect(x: 334, y: 150, width: 165, height: 165)
            })
            
            
            let buttonWidth: CGFloat = 359.0
            let buttonHeight: CGFloat = 56.0
            
            print("Probability: \(self.probability)")
            
            //            Agree Button definition
            let agreeButton : UIButton = UIButton()
            agreeButton.frame = CGRect(x: 238, y: 745, width: buttonWidth, height: buttonHeight)
            let agreeImage = UIImage(named:"AgreeButton")
            agreeButton.setImage(agreeImage, for: .normal)
            agreeButton.addTarget(self, action: #selector(goToAgreeView), for: .touchUpInside)
            self.view.addSubview(agreeButton)
            
            //            Disagree Button definition
            let disagreeButton : UIButton = UIButton()
            disagreeButton.frame = CGRect(x: 238,y: 841, width: buttonWidth, height: buttonHeight)
            let dontAgreeImage = UIImage(named:"DontAgreeButton")
            disagreeButton.setImage(dontAgreeImage, for: .normal)
            disagreeButton.addTarget(self, action: #selector(goToDisagreeView), for: .touchUpInside)
            self.view.addSubview(disagreeButton)
        }
    }
    
    @objc func goToAgreeView() {
        let newController = AgreeController()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.setViewControllers([newController], animated: true)
    }
    
    @objc func goToDisagreeView() {
        let newController = DontAgreeController()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.setViewControllers([newController], animated: true)
    }
    
}
