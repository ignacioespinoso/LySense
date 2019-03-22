import Foundation
import PlaygroundSupport
import UIKit


public class IntroController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let textPickerField = UITextField()
    let textWriter = UITextView()
    
    let myPickerData = [String](arrayLiteral: "Peter", "Jane", "Paul", "Mary", "Kevin", "Lucy")
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    public func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textPickerField.text = myPickerData[row]
    }
    
    public override func loadView() {
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: 834, height: 1112))
        if let image = UIImage(named: "IntroBackground") {
            let imageView = UIImageView(image: image)
            imageView.frame = self.view.frame
            self.view.addSubview(imageView)

        } else {
            self.view.backgroundColor = .red
        }
        
    }
    
    public override func viewDidLoad() {
        
//        Defines picker view
        textPickerField.frame = CGRect(x: 230, y: 399, width: 375, height: 60)
        textPickerField.placeholder = "Pick a song..."
        let picker = UIPickerView()
        textPickerField.inputView = picker
        picker.delegate = self
        picker.dataSource = self
        self.view.addSubview(textPickerField)
        
//        Defines lyric submission button using the picker
        let submitButton : UIButton = UIButton()
        submitButton.frame = CGRect(x: 238, y: 501, width: 359, height: 56)
        let submitImage = UIImage(named:"SubmitButton")
        submitButton.setImage(submitImage, for: .normal)
        submitButton.addTarget(self, action: #selector(submitText), for: .touchUpInside)
        self.view.addSubview(submitButton)
        
//        Defines text field view
        textWriter.frame = CGRect(x: 230, y: 649, width: 375, height: 240)
        textWriter.text = "Type or paste your chosen lyric..."
        self.view.addSubview(textWriter)
        
//        Defines lyric submission button using the text field
        let submitButton2 : UIButton = UIButton()
        submitButton2.frame = CGRect(x: 238, y: 940, width: 359, height: 56)
        submitButton2.setImage(submitImage, for: .normal)
        submitButton2.addTarget(self, action: #selector(submitText2), for: .touchUpInside)
        self.view.addSubview(submitButton2)
        
    }

//    Proccess content coming from song picker
    @objc func submitText() {
        if let lyric = textPickerField.text {
            print("\(lyric)")
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
        } else {
            print("ERROR! Submited from picker without content")
        }
    }
    
//    Proccess content coming from the text field
    @objc func submitText2() {
        let newController = SadController()
        newController.probability = 0.5
        self.navigationController?.pushViewController(newController, animated: true)
//        if let lyric = textWriter.text {
//            print("\(lyric)")
//            var isHappy: Bool
//            var probability: Float
//            (isHappy, probability) = isHappyLyric(text: lyric)   // Right now always returns true
//            if isHappy {
//                let newController = HappyController()
//                newController.probability = probability
//                self.navigationController?.pushViewController(newController, animated: true)
//                
//            } else {
//                let newController = SadController()
//                newController.probability = probability
//                self.navigationController?.pushViewController(newController, animated: true)
//            }
//        } else {
//            print("ERROR! Submited from TextField without content")
//        }
    }
    
}
