//
//  TranslationViewController.swift
//  Fluency
//
//  Created by Arjun Mohan on 09/11/22.
//

import UIKit
import MLKit
import AVFoundation
import Speech
import AVFAudio

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var fromLanguageView: UIView!
    @IBOutlet weak var toLanguageView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var targetTextView: UITextView!
    @IBOutlet weak var sourceButton: UIButton!
    @IBOutlet weak var targetButton: UIButton!
    @IBOutlet weak var transcribeButton: UIButton!
    
    var translator: Translator!
    let locale = Locale.current
    let localModels =  ModelManager.modelManager().downloadedTranslateModels
    let synthesizer = AVSpeechSynthesizer()


    private var speechRecognitionRequest:
       SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        authorizeSR()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == toLanguageView || touch.view == targetTextView || touch.view == view {
                sourceTextView.resignFirstResponder()
            }
        }
    }
    
    
    @IBAction func clearTextView(_ sender: UIButton) {
        sourceTextView.text = ""
        targetTextView.text = ""
    }
    
    @IBAction func targetButton(_ sender: UIButton) {
        displayLanguagesController(buttonTag: sender.tag)
    }
    
    @IBAction func sourceButton(_ sender: UIButton) {
        displayLanguagesController(buttonTag: sender.tag)
    }
    
    @IBAction func swapLanguage(_ sender: UIButton) {
        let sourceLanguage = sourceButton.title(for: .normal)
        let targetLanguage = targetButton.title(for: .normal)
        sourceButton.setTitle(targetLanguage, for: .normal)
        targetButton.setTitle(sourceLanguage, for: .normal)
        let sourceText = sourceTextView.text
        let targetText = targetTextView.text
        sourceTextView.text = targetText
        targetTextView.text = sourceText
        translate()
    }
    
    @IBAction func dictateAction(_ sender: UIButton) {
        let dictateText = targetTextView.text.trimmingCharacters(in: .whitespaces)
        if dictateText != "" {
            let utterance = AVSpeechUtterance(string: dictateText)
            let targetLanguage = AppUtils().retrieveLanguageCode(rawValue: targetButton.title(for: .normal)!.lowercased())
            utterance.voice = AVSpeechSynthesisVoice(language: targetLanguage.rawValue)
            utterance.rate = 0.5
            utterance.volume = 1
            synthesizer.speak(utterance)
        }
    }
    
    @IBAction func copyToClipboard(_ sender: UIButton) {
        let translated = targetTextView.text.trimmingCharacters(in: .whitespaces)
        if translated != "" {
            UIPasteboard.general.string = translated
            AppUtils().createToast(message: "Copied", parentView: view, bottomView: bottomView)
        }
    }
    
    @IBAction func transcribeAction(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//        if sender.isSelected == true {
//            print("transcribe selected")
//            try! startSession()
//        } else {
//            print("transcribe not selected")
//            if audioEngine.isRunning {
//                  audioEngine.stop()
//                  speechRecognitionRequest?.endAudio()
////                  transcribeButton.isEnabled = true
//
//              }
//        }
    }
    
//    func startSession() throws {
//
//        if let recognitionTask = speechRecognitionTask {
//            recognitionTask.cancel()
//            self.speechRecognitionTask = nil
//        }
//
//        let audioSession = AVAudioSession.sharedInstance()
//
//        try audioSession.setCategory(AVAudioSession.Category.record)
//
//
//        let sourceLanguage = AppUtils().retrieveLanguageCode(rawValue: sourceButton.title(for: .normal)!.lowercased())
//        let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: sourceLanguage.rawValue))!
//
//        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
//
//        guard let recognitionRequest = speechRecognitionRequest else { fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed") }
//
//        let inputNode = audioEngine.inputNode
//
//
//        recognitionRequest.shouldReportPartialResults = true
//
//        speechRecognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
//
//            var finished = false
//
//            if let result = result {
//                self.sourceTextView.text =
//                result.bestTranscription.formattedString
//                finished = result.isFinal
//            }
//
//            if error != nil || finished {
//                self.audioEngine.stop()
//                inputNode.removeTap(onBus: 0)
//
//                self.speechRecognitionRequest = nil
//                self.speechRecognitionTask = nil
//
////                self.transcribeButton.isEnabled = true
//            }
//        }
//        inputNode.removeTap(onBus: 0)
//        let recordingFormat = inputNode.outputFormat(forBus: 0)
//
//        inputNode.installTap(onBus: 0, bufferSize: 2048, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
//
//            self.speechRecognitionRequest?.append(buffer)
//        }
//
//        audioEngine.prepare()
//        try audioEngine.start()
//    }
    
    
//    func authorizeSR() {
//        SFSpeechRecognizer.requestAuthorization { authStatus in
//
//            OperationQueue.main.addOperation {
//                switch authStatus {
//                case .authorized:
//                    self.transcribeButton.isEnabled = true
//
//                case .denied:
//                    self.transcribeButton.isEnabled = false
//                    self.transcribeButton.setTitle("Speech recognition access denied by user", for: .disabled)
//
//                case .restricted:
//                    self.transcribeButton.isEnabled = false
//                    self.transcribeButton.setTitle("Speech recognition restricted on device", for: .disabled)
//
//                case .notDetermined:
//                    self.transcribeButton.isEnabled = false
//                    self.transcribeButton.setTitle("Speech recognition not authorized", for: .disabled)
//                @unknown default:
//                    break
//                }
//            }
//        }
//    }
    
    func translate() {
        let sourceLanguage = AppUtils().retrieveLanguageCode(rawValue: sourceButton.title(for: .normal)!.lowercased())
        let targetLanguage = AppUtils().retrieveLanguageCode(rawValue: targetButton.title(for: .normal)!.lowercased())
        let options = TranslatorOptions(sourceLanguage: sourceLanguage , targetLanguage: targetLanguage)
        let translator = Translator.translator(options: options)
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: true,
            allowsBackgroundDownloading: true
        )
        translator.downloadModelIfNeeded(with: conditions) { [self] error in
            guard error == nil else { return }
            // Model downloaded successfully. Okay to start translating.
            let enteredText = sourceTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
            if enteredText != "" {
                translator.translate(enteredText) { [self] translatedText, error in
                    guard error == nil, let translatedText = translatedText else { return }
                    // Translation succeeded.
                    targetTextView.text = translatedText
                }
            }
        }
    }

    
    
}

extension TranslationViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            translate()
            return false
        }
        return true
    }
}

extension TranslationViewController: UpdateLanguageDelegate {
    func updateSelectedLanguage(selected: String, buttonTag: Int) {
        if let currentButton = topView.viewWithTag(buttonTag) as? UIButton {
            currentButton.setTitle(selected, for: .normal)
        }
        translate()
    }
    
}
