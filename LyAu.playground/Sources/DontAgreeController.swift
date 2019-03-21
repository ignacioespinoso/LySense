import Foundation
import PlaygroundSupport
import UIKit

public class DontAgreeController: UIViewController {
    public override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 812))
        if let image = UIImage(named: "DontAgreeBackground") {
            let imageView = UIImageView(image: image)
            imageView.frame = self.view.frame
            self.view.addSubview(imageView)
        } else {
            self.view.backgroundColor = .blue
        }
    }
    
    
    public override func viewDidLoad() {
        //        let string:String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempor neque eget fringilla varius. Pellentesque velit ante, faucibus sit amet commodo non, cursus a ante. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla facilisi. Aliquam metus odio, tempor quis suscipit sed, eleifend vel leo. Vivamus sit amet diam nec risus cursus eleifend. Nam id lectus vehicula, pellentesque purus quis, elementum sapien. In ultrices arcu dignissim scelerisque aliquam. Pellentesque at est tortor."
        //        let text = UILabel()
        //        text.text = "Hello Agree!"
        //        text.textColor = .white
        //        text.backgroundColor = .black
        //        self.view = text
        let buttonWidth: CGFloat = 359.0
        let buttonHeight: CGFloat = 56.0
        
        //            Back to the beginning Button definition
        let agreeButton : UIButton = UIButton()
        agreeButton.frame = CGRect(x: 8, y: 508, width: buttonWidth, height: buttonHeight)
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
