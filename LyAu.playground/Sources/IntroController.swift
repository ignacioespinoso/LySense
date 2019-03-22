import Foundation
import PlaygroundSupport
import UIKit


public class IntroController: UIViewController {
    
    public override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 834, height: 1112))
        
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
        
//        Defines picker view
        let textPicker = UITextField(frame: CGRect(x: 230, y: 399, width: 375, height: 60))
        textPicker.placeholder = "Pick a song..."
//        textPicker.inputView = UIPickerView(frame: textPicker.frame)
        self.view.addSubview(textPicker)
        
//        Defines lyric submission button using the picker
        let submitButton : UIButton = UIButton()
        submitButton.frame = CGRect(x: 238, y: 501, width: 359, height: 56)
        let submitImage = UIImage(named:"SubmitButton")
        submitButton.setImage(submitImage, for: .normal)
        submitButton.addTarget(self, action: #selector(submitText), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
//        Defines text field view
        let textWriter = UITextView(frame: CGRect(x: 230, y: 649, width: 375, height: 240))
        textWriter.text = "Type or paste your chosen lyric..."
        self.view.addSubview(textWriter)
        
//        Defines lyric submission button using the text field
        let submitButton2 : UIButton = UIButton()
        submitButton2.frame = CGRect(x: 238, y: 940, width: 359, height: 56)
        submitButton2.setImage(submitImage, for: .normal)
        submitButton2.addTarget(self, action: #selector(submitText2), for: .touchUpInside)
        self.view.addSubview(submitButton2)
        
    }

    @objc func submitText() {
        self.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
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
        self.view.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        let newController = SadController()
        newController.probability = 1.0
        self.navigationController?.pushViewController(newController, animated: true)
    }
    
}
