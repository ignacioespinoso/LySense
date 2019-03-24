import Foundation
import CoreML
import NaturalLanguage

// Applies the machine learning model to the given lyric
func isHappyLyric(text: String) -> (result:Bool, prob: Float) {
    do {
        let sentimentPredictor = try NLModel(mlModel: LyricClassifier().model)
        if let predictedLabel: String = sentimentPredictor.predictedLabel(for: text) {
            print("\n-------------------------------------------------------")
            print("Lyric:\n\(text)")
            print("Prediction: \(predictedLabel)")
            print("-------------------------------------------------------")
            return (predictedLabel == "happy" ? true : false, 0.0)
        }
        print("NULL")
        
    } catch {
        print("Model not loaded")
    }
    return (false, 0.0)
}
