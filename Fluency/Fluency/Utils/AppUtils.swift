//
//  AppUtils.swift
//  Fluency
//
//  Created by Arjun Mohan on 10/11/22.
//

import UIKit
import MLKit

class AppUtils: NSObject {
    
    func retrieveLanguageName(languageCode: String) -> String {
        var language = ""
        switch languageCode {
        case "af":
            language = "Afrikaans"
        case "am":
            language = "Amharic"
        case "ar":
            language = "Arabic"
        case "ar-Latn":
            language = "Arabic"
        case "az":
            language = "Azerbaijani"
        case "be":
            language = "Belarusian"
        case "bg":
            language = "Bulgarian"
        case "bg-Latn":
            language = "Bulgarian"
        case "bn":
            language = "Bengali"
        case "bs":
            language = "Bosnian"
        case "ca":
            language = "Catalan"
        case "ceb":
            language = "Cebuano"
        case "co":
            language = "Corsican"
        case "cs":
            language = "Czech"
        case "cy":
            language = "Welsh"
        case "da":
            language = "Danish"
        case "de":
            language = "German"
        case "el":
            language = "Greek"
        case "el-Latn":
            language = "Greek"
        case "en":
            language = "English"
        case "eo":
            language = "Esperanto"
        case "es":
            language = "Spanish"
        case "et":
            language = "Estonian"
        case "eu":
            language = "Basque"
        case "fa":
            language = "Persian"
        case "fi":
            language = "Finnish"
        case "fil":
            language = "Filipino"
        case "fr":
            language = "French"
        case "fy":
            language = "Western Frisian"
        case "ga":
            language = "Irish"
        case "gd":
            language = "Scots Gaelic"
        case "gl":
            language = "Galician"
        case "gu":
            language = "Gujarati"
        case "ha":
            language = "Hausa"
        case "haw":
            language = "Hawaiian"
        case "he":
            language = "Hebrew"
        case "hi":
            language = "Hindi"
        case "hi-Latn":
            language = "Hindi"
        case "hmn":
            language = "Hmong"
        case "hr":
            language = "Croatian"
        case "ht":
            language = "Haitian"
        case "hu":
            language = "Hungarian"
        case "hy":
            language = "Armenian"
        case "id":
            language = "Indonesian"
        case "ig":
            language = "Igbo"
        case "is":
            language = "Icelandic"
        case "it":
            language = "Italian"
        case "ja":
            language = "Japanese"
        case "ja-Latn":
            language = "Japanese"
        case "jv":
            language = "Javanese"
        case "ka":
            language = "Georgian"
        case "kk":
            language = "Kazakh"
        case "km":
            language = "Khmer"
        case "kn":
            language = "Kannada"
        case "ko":
            language = "Korean"
        case "ku":
            language = "Kurdish"
        case "ky":
            language = "Kyrgyz"
        case "la":
            language = "Latin"
        case "lb":
            language = "Luxembourgish"
        case "lo":
            language = "Lao"
        case "lt":
            language = "Lithuanian"
        case "lv":
            language = "Latvian"
        case "mg":
            language = "Malagasy"
        case "mi":
            language = "Maori"
        case "mk":
            language = "Macedonian"
        case "ml":
            language = "Malayalam"
        case "mn":
            language = "Mongolian"
        case "mr":
            language = "Marathi"
        case "ms":
            language = "Malay"
        case "mt":
            language = "Maltese"
        case "my":
            language = "Burmese"
        case "ne":
            language = "Nepali"
        case "nl":
            language = "Dutch"
        case "no":
            language = "Norwegian"
        case "ny":
            language = "Nyanja"
        case "pa":
            language = "Punjabi"
        case "pl":
            language = "Polish"
        case "ps":
            language = "Pashto"
        case "pt":
            language = "Portuguese"
        case "ro":
            language = "Romanian"
        case "ru":
            language = "Russian"
        case "ru-Latn":
            language = "Russian"
        case "sd":
            language = "Sindhi"
        case "si":
            language = "Sinhala"
        case "sk":
            language = "Slovak"
        case "sl":
            language = "Slovenian"
        case "sm":
            language = "Samoan"
        case "sn":
            language = "Shona"
        case "so":
            language = "Somali"
        case "sq":
            language = "Albanian"
        case "sr":
            language = "Serbian"
        case "st":
            language = "Sesotho"
        case "su":
            language = "Sundanese"
        case "sv":
            language = "Swedish"
        case "sw":
            language = "Swahili"
        case "ta":
            language = "Tamil"
        case "te":
            language = "Telugu"
        case "tg":
            language = "Tajik"
        case "th":
            language = "Thai"
        case "tr":
            language = "Turkish"
        case "uk":
            language = "Ukrainian"
        case "ur":
            language = "Urdu"
        case "uz":
            language = "Uzbek"
        case "vi":
            language = "Vietnamese"
        case "xh":
            language = "Xhosa"
        case "yi":
            language = "Yiddish"
        case "yo":
            language = "Yoruba"
        case "zh":
            language = "Chinese"
        case "zh-Latn":
            language = "Chinese"
        case "zu":
            language = "Zulu"
        default:
            break
        }
        return language
    }
    
    func retrieveLanguageCode(rawValue: String) -> TranslateLanguage {
        var languageCode: TranslateLanguage!
        switch rawValue{
        case "afrikaans":
            languageCode = .afrikaans
        case "albanian":
            languageCode = .albanian
        case "arabic":
            languageCode = .arabic
        case "bengali":
            languageCode = .bengali
        case "belarusian":
            languageCode = .belarusian
        case "bulgarian":
            languageCode = .bulgarian
        case "catalan":
            languageCode = .catalan
        case "chinese":
            languageCode = .chinese
        case "croatian":
            languageCode = .croatian
        case "czech":
            languageCode = .czech
        case "danish":
            languageCode = .danish
        case "dutch":
            languageCode = .dutch
        case "english":
            languageCode = .english
        case "esperanto":
            languageCode = .eperanto
        case "estonian":
            languageCode = .estonian
        case "finnish":
            languageCode = .finnish
        case "french":
            languageCode = .french
        case "galician":
            languageCode = .galician
        case "georgian":
            languageCode = .georgian
        case "german":
            languageCode = .german
        case "greek":
            languageCode = .greek
        case "gujarati":
            languageCode = .gujarati
        case "haitian":
            languageCode = .haitianCreole
        case "hebrew":
            languageCode = .hebrew
        case "hindi":
            languageCode = .hindi
        case "hungarian":
            languageCode = .hungarian
        case "icelandic":
            languageCode = .icelandic
        case "indonesian":
            languageCode = .indonesian
        case "irish":
            languageCode = .irish
        case "italian":
            languageCode = .italian
        case "japanese":
            languageCode = .japanese
        case "kannada":
            languageCode = .kannada
        case "korean":
            languageCode = .korean
        case "latvian":
            languageCode = .latvian
        case "lithuanian":
            languageCode = .lithuanian
        case "macedonian":
            languageCode = .macedonian
        case "malay":
            languageCode = .malay
        case "maltese":
            languageCode = .maltese
        case "marathi":
            languageCode = .marathi
        case "norwegian":
            languageCode = .norwegian
        case "persian":
            languageCode = .persian
        case "polish":
            languageCode = .polish
        case "portuguese":
            languageCode = .portuguese
        case "romanian":
            languageCode = .romanian
        case "russian":
            languageCode = .russian
        case "slovak":
            languageCode = .slovak
        case "slovenian":
            languageCode = .slovenian
        case "spanish":
            languageCode = .spanish
        case "swahili":
            languageCode = .swahili
        case "swedish":
            languageCode = .swedish
        case "tamil":
            languageCode = .tamil
        case "telugu":
            languageCode = .telugu
        case "thai":
            languageCode = .thai
        case "turkish":
            languageCode = .turkish
        case "ukrainian":
            languageCode = .ukrainian
        case "urdu":
            languageCode = .urdu
        case "vietnamese":
            languageCode = .vietnamese
        case "welsh":
            languageCode = .welsh
        default:
            break
        }
        return languageCode
    }
    
    func downloadLanguage(language: TranslateLanguage) {
        let downloadModel = TranslateRemoteModel.translateRemoteModel(language: language)
        
        // Keep a reference to the download progress so you can check that the model
        // is available before you use it.
        let progress = ModelManager.modelManager().download(
            downloadModel,
            conditions: ModelDownloadConditions(
                allowsCellularAccess: true,
                allowsBackgroundDownloading: true
            )
        )
//        if progress.isFinished == true {
//            print("finished")
//        } else {
//            ModelManager.modelManager().download(
//                downloadModel,
//                conditions: ModelDownloadConditions(
//                    allowsCellularAccess: true,
//                    allowsBackgroundDownloading: true
//                )
//            )
//        }
    }
    
    // Create a toast message view
    func createToast(message: String, parentView: UIView, bottomView: UIView) {
        if let currentToast = parentView.viewWithTag(101010101) as? UILabel {
            currentToast.removeFromSuperview()
        }
        let toastLabel = UILabel()
        toastLabel.tag = 101010101
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.text = message
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "Avenir Next Medium", size: 14)
        toastLabel.textAlignment = .center
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        parentView.addSubview(toastLabel)
        parentView.bringSubviewToFront(toastLabel)
        toastLabel.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -20).isActive = true
        toastLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        toastLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseInOut, animations: {
                toastLabel.alpha = 0.5
           }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
           })
    }
    
}
