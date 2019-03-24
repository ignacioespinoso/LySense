//: [Previous](@previous)
/*:

 # Behind the Scenes

Here it is the code I used to train the model. After training, I used it to integrate to the playground and acquire the previously mentioned behaviour.

```swift
 import Foundation
 import CoreML
 import NaturalLanguage
 import CreateML
 
 /// Create a training data table from a CSV file in the playground’s `Resources` folder.
 let TrainCsvFile = Bundle.main.url(forResource: "train_lyrics_1000_filtered_rows", withExtension: "csv")!
 let trainDataTable = try MLDataTable(contentsOf: TrainCsvFile)
 print(trainDataTable)
 
 
 /// Create a test data table from a CSV file in the playground’s `Resources` folder.
 let TestCsvFile = Bundle.main.url(forResource: "validation_lyrics_200_filtered_rows", withExtension: "csv")!
 let testDataTable = try MLDataTable(contentsOf: TestCsvFile)
 print(testDataTable)
 
 //Model 1:
 //let sentimentClassifier = try MLTextClassifier(trainingData: trainDataTable,
 //                                               textColumn: "lyrics",
 //                                               labelColumn: "mood")
 
 // Model 2:
 //let algorithm = MLTextClassifier.ModelAlgorithmType.crf(revision: nil)
 //let language = NLLanguage.english
 //let parameters = MLTextClassifier.ModelParameters(validationData: testDataTable, algorithm: algorithm, language: language)
 //let sentimentClassifier = try MLTextClassifier(trainingData: trainDataTable, textColumn: "lyrics", labelColumn: "mood", parameters: parameters)
 
 //Model 3:
 //let algorithm = MLTextClassifier.ModelAlgorithmType.maxEnt(revision: nil)
 //let language = NLLanguage.english
 //let parameters = MLTextClassifier.ModelParameters(validationData: testDataTable, algorithm: algorithm, language: language)
 //let sentimentClassifier = try MLTextClassifier(trainingData: trainDataTable, textColumn: "lyrics", labelColumn: "mood", parameters: parameters)
 
 //Model 4 (and final):
 let algorithm = MLTextClassifier.ModelAlgorithmType.crf(revision: 1)
 let language = NLLanguage.english
 let parameters = MLTextClassifier.ModelParameters(validationData: testDataTable, algorithm: algorithm, language: language)
 let sentimentClassifier = try MLTextClassifier(trainingData: trainDataTable, textColumn: "lyrics", labelColumn: "mood", parameters: parameters)
 
 // Training accuracy as a percentage
 let trainingAccuracy = (1.0 - sentimentClassifier.trainingMetrics.classificationError) * 100
 
 // Validation accuracy as a percentage
 let validationAccuracy = (1.0 - sentimentClassifier.validationMetrics.classificationError) * 100
 
 let evaluationMetrics = sentimentClassifier.evaluation(on: testDataTable)
 
 // Evaluation accuracy as a percentage
 let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100
 
 print("Training_acc: \(trainingAccuracy), Validation_acc: \(validationAccuracy), Test_acc: \(evaluationAccuracy)")
 
 let metadata = MLModelMetadata(author: "Ignácio Espinoso Ribeiro",
 shortDescription: "A model trained to classify lyrics as either happy or sad",
 version: "1.0")
 
 try sentimentClassifier.write(to: URL(fileURLWithPath: "DESIRED_MODEL_LOCATION/LyricClassifier.mlmodel"),
 metadata: metadata)
 print("Done!")
```

*/

//: [Next](@next)


