import Foundation
import PlaygroundSupport
import UIKit


public class IntroController: UIViewController {
    public override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 812))
        
        if let image = UIImage(named: "IntroBackground") {
            let imageView = UIImageView(image: image)
            imageView.frame = self.view.frame
            self.view.addSubview(imageView)
            
//            self.view.backgroundColor = UIColor(patternImage: image)
        } else {
            self.view.backgroundColor = .red
        }
        
    }
    
    public override func viewDidLoad() {
//        Defines lyric submission button
        let submitButton : UIButton = UIButton()
        submitButton.frame = CGRect(x: 8, y: 328, width: 359, height: 56)
        submitButton.center.x = self.view.center.x
        let submitImage = UIImage(named:"SubmitButton")
        submitButton.setImage(submitImage, for: .normal)
        submitButton.addTarget(self, action: #selector(submitText), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
//        Test button
        let submitButton2 : UIButton = UIButton()
        submitButton2.frame = CGRect(x: 8, y: 699, width: 359, height: 56)
        submitButton2.center.x = self.view.center.x
        submitButton2.setImage(submitImage, for: .normal)
        submitButton2.addTarget(self, action: #selector(submitText2), for: .touchUpInside)
        self.view.addSubview(submitButton2)
    }

    @objc func submitText() {
        let lyric: String = "a"
        var isHappy: Bool
        var probability: Float
        (isHappy, probability) = isHappyLyric(text: lyric)   // Right now always returns true
        if isHappy {
            let newController = HappyController()
            newController.probability = probability
            self.navigationController?.pushViewController(newController, animated: true)

        } else {
            let newController = SadController()
            newController.probability = probability
            self.navigationController?.pushViewController(newController, animated: true)
        }
        
    }
    
//    For testing purposes
    @objc func submitText2() {
        let newController = SadController()
        newController.probability = 1.0
        self.navigationController?.pushViewController(newController, animated: true)
    }
    
}
