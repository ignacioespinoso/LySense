//
// LyricClassifier.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML

/// Model Prediction Input Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class LyricClassifierInput : MLFeatureProvider {
    
    /// Input text as string value
    var text: String
    
    var featureNames: Set<String> {
        get {
            return ["text"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "text") {
            return MLFeatureValue(string: text)
        }
        return nil
    }
    
    init(text: String) {
        self.text = text
    }
}

/// Model Prediction Output Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class LyricClassifierOutput : MLFeatureProvider {
    
    /// Source provided by CoreML
    
    private let provider : MLFeatureProvider
    
    
    /// Text label as string value
    lazy var label: String = {
        [unowned self] in return self.provider.featureValue(for: "label")!.stringValue
        }()
    
    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }
    
    init(label: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["label" : MLFeatureValue(string: label)])
    }
    
    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
class LyricClassifier {
    var model: MLModel
    
    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: LyricClassifier.self)
        return bundle.url(forResource: "LyricClassifier", withExtension:"mlmodelc")!
    }
    
    /**
     Construct a model with explicit path to mlmodelc file
     - parameters:
     - url: the file url of the model
     - throws: an NSError object that describes the problem
     */
    init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }
    
    /// Construct a model that automatically loads the model from the app's bundle
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
    
    /**
     Construct a model with configuration
     - parameters:
     - configuration: the desired model configuration
     - throws: an NSError object that describes the problem
     */
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct a model with explicit path to mlmodelc file and configuration
     - parameters:
     - url: the file url of the model
     - configuration: the desired model configuration
     - throws: an NSError object that describes the problem
     */
    init(contentsOf url: URL, configuration: MLModelConfiguration) throws {
        self.model = try MLModel(contentsOf: url, configuration: configuration)
    }
    
    /**
     Make a prediction using the structured interface
     - parameters:
     - input: the input to the prediction as LyricClassifierInput
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as LyricClassifierOutput
     */
    func prediction(input: LyricClassifierInput) throws -> LyricClassifierOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }
    
    /**
     Make a prediction using the structured interface
     - parameters:
     - input: the input to the prediction as LyricClassifierInput
     - options: prediction options
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as LyricClassifierOutput
     */
    func prediction(input: LyricClassifierInput, options: MLPredictionOptions) throws -> LyricClassifierOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return LyricClassifierOutput(features: outFeatures)
    }
    
    /**
     Make a prediction using the convenience interface
     - parameters:
     - text: Input text as string value
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as LyricClassifierOutput
     */
    func prediction(text: String) throws -> LyricClassifierOutput {
        let input_ = LyricClassifierInput(text: text)
        return try self.prediction(input: input_)
    }
    
    /**
     Make a batch prediction using the structured interface
     - parameters:
     - inputs: the inputs to the prediction as [LyricClassifierInput]
     - options: prediction options
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as [LyricClassifierOutput]
     */
    func predictions(inputs: [LyricClassifierInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [LyricClassifierOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [LyricClassifierOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  LyricClassifierOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
