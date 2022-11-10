//
//  AppUtils.swift
//  Fluency
//
//  Created by Arjun Mohan on 10/11/22.
//

import UIKit

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
}
