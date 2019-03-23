import Foundation
import CoreML
import NaturalLanguage

func isHappyLyric(text: String) -> (result:Bool, prob: Float) {
    do {
        let sentimentPredictor = try NLModel(mlModel: LyricClassifier().model)
        if let predictedLabel: String = sentimentPredictor.predictedLabel(for: text) {
            print("Prediction: \(predictedLabel)")
            return (predictedLabel == "happy" ? true : false, 0.0)
        }
        print("NULL")
        
    } catch {
        print("Model not loaded")
    }
    return (false, 0.0)
}
