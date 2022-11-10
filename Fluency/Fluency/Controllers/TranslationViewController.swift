//
//  TranslationViewController.swift
//  Fluency
//
//  Created by Arjun Mohan on 09/11/22.
//

import UIKit
import MLKit

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var fromLanguageView: UIView!
    @IBOutlet weak var toLanguageView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var targetTextView: UITextView!
    @IBOutlet weak var sourceButton: UIButton!
    @IBOutlet weak var targetButton: UIButton!
    
    var translator: Translator!
    let locale = Locale.current
    let localModels =  ModelManager.modelManager().downloadedTranslateModels
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        displayLanguagesController()
    }
    
    @IBAction func sourceButton(_ sender: UIButton) {
        displayLanguagesController()
    }
    
    
    @IBAction func swapLanguage(_ sender: UIButton) {
        let sourceLanguage = sourceButton.title(for: .normal)
        let targetLanguage = targetButton.title(for: .normal)
        sourceButton.setTitle(targetLanguage, for: .normal)
        targetButton.setTitle(sourceLanguage, for: .normal)
    }
    
    
    @IBAction func translate(_ sender: UIButton) {
        // Create an English-German translator:
        let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
        let englishGermanTranslator = Translator.translator(options: options)
        
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: true,
            allowsBackgroundDownloading: true
        )
        englishGermanTranslator.downloadModelIfNeeded(with: conditions) { [self] error in
            guard error == nil else { return }
            
            // Model downloaded successfully. Okay to start translating.
//            let enteredText = inputTextField.text!
            
//            englishGermanTranslator.translate(enteredText) { [self] translatedText, error in
//                guard error == nil, let translatedText = translatedText else { return }
//
//                // Translation succeeded.
////                translatedTextView.text = translatedText
//
//            }
        }
    }
    
    
}

extension TranslationViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
