import Foundation
import PlaygroundSupport
import UIKit


public class IntroController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let textPickerField = UITextField()
    let textWriter = UITextView()
    
    let myPickerData = [String](arrayLiteral: "Portugal the man - Feel it Still", "Ed Sheeran - Shape of You", "Camila Cabello - Havana", "Justin Timberlake - Cry Me a River", "Queen - Bohemian Rapsody", "Smash Mouth - All Star", "Gary Jules - Mad World", "ABBA - Dancing Queen", "Backstreet Boys - I Want It That Way", "The Mamas & the Papas - California Dreamin")
    
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
//        Sets frame and background
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
//        Defines lyric picker
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
        
//        Extracts lyric file into string
        if textPickerField.text != "" {
            if let title = textPickerField.text {
                var lyric = ""
//            Loads selected lyric into a string
                if title == "Portugal the man - Feel it Still"{
                   lyric = loadToString(name: "lyric1", withExtension: ".txt")
                } else if title == "Ed Sheeran - Shape of You" {
                    lyric = loadToString(name: "lyric2", withExtension: ".txt")
                } else if title == "Camila Cabello - Havana" {
                    lyric = loadToString(name: "lyric3", withExtension: ".txt")
                } else if title == "Justin Timberlake - Cry Me a River" {
                    lyric = loadToString(name: "lyric4", withExtension: ".txt")
                } else if title == "Queen - Bohemian Rapsody" {
                    lyric = loadToString(name: "lyric5", withExtension: ".txt")
                } else if title == "Smash Mouth - All Star" {
                    lyric = loadToString(name: "lyric6", withExtension: ".txt")
                } else if title == "Gary Jules - Mad World" {
                    lyric = loadToString(name: "lyric7", withExtension: ".txt")
                } else if title == "ABBA - Dancing Queen" {
                    lyric = loadToString(name: "lyric8", withExtension: ".txt")
                } else if title == "Backstreet Boys - I Want It That Way" {
                    lyric = loadToString(name: "lyric9", withExtension: ".txt")
                } else if title == "The Mamas & the Papas - California Dreamin" {
                    lyric = loadToString(name: "lyric10", withExtension: ".txt")
                }
                
                var isHappy: Bool
                var probability: Float
    //            Let's use the Machine Learning model!
                (isHappy, probability) = isHappyLyric(text: lyric)
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
    }
    
//    Proccess content coming from the text field
    @objc func submitText2() {
        if textWriter.text != "" {
            if let lyric = textWriter.text {
                var isHappy: Bool
                var probability: Float
//            Let's use the Machine Learning model!
                (isHappy, probability) = isHappyLyric(text: lyric)
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
                print("ERROR! Submited from TextField without content")
            }
        }
    }
    
//    Helper function to load text file into a string
    public func loadToString(name:String, withExtension:String) -> String {
        if let lyricURL = Bundle.main.url(forResource: name, withExtension: withExtension) {
            do {
                return try String(contentsOf: lyricURL, encoding: .utf8)
            }
            catch{
                print("Lyric not found!")
            }
        }
        return "NULL"
    }
    
}
