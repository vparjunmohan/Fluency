//
//  LanguagesViewController.swift
//  Fluency
//
//  Created by Arjun Mohan on 10/11/22.
//

import UIKit
import MLKit

protocol UpdateLanguageDelegate {
    func updateSelectedLanguage(selected: String, buttonTag: Int)
}

class LanguagesViewController: UIViewController {

    @IBOutlet weak var languageTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var translator: Translator!
    let locale = Locale.current
    lazy var allLanguages = TranslateLanguage.allLanguages().sorted {
        return locale.localizedString(forLanguageCode: $0.rawValue)!
        < locale.localizedString(forLanguageCode: $1.rawValue)!
    }
    let localModels =  ModelManager.modelManager().downloadedTranslateModels
    var updateDelegate: UpdateLanguageDelegate!
    var currentButtonTag: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        if let parent = self.parent {
            if parent is TranslationViewController {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        }
    }
    
    

}

extension LanguagesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguagesTableViewCell", for: indexPath) as! LanguagesTableViewCell
        let languageModel = allLanguages[indexPath.row]
        if localModels.description.contains(languageModel.rawValue) == false {
            cell.downloadButton.isHidden = false
        } else {
            cell.downloadButton.isHidden = true
        }
        if AppUtils().retrieveLanguageName(languageCode: languageModel.rawValue) != "" {
            cell.languageName.text = AppUtils().retrieveLanguageName(languageCode: languageModel.rawValue)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) as? LanguagesTableViewCell {
            if updateDelegate != nil {
                updateDelegate.updateSelectedLanguage(selected: selectedCell.languageName.text!, buttonTag: currentButtonTag)
            }
            if let parent = self.parent {
                if parent is TranslationViewController {
                    self.willMove(toParent: nil)
                    self.view.removeFromSuperview()
                    self.removeFromParent()
                }
            }
        }
    }
    
    
}



