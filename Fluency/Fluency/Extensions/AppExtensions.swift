//
//  AppExtensions.swift
//  Fluency
//
//  Created by Arjun Mohan on 10/11/22.
//

import Foundation
import UIKit

extension UIView {
    func applyCommonDropShadow(radius:CGFloat, opacity: Float) {
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = false
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension TranslationViewController {
    func setupUI() {
        topView.layer.cornerRadius = AppConstants.commonCornerRadius
        fromLanguageView.layer.cornerRadius = AppConstants.commonCornerRadius
        toLanguageView.layer.cornerRadius = AppConstants.commonCornerRadius
        bottomView.layer.cornerRadius = bottomView.frame.height / 2
        fromLanguageView.applyCommonDropShadow(radius: 5, opacity: 0.1)
        toLanguageView.applyCommonDropShadow(radius: 5, opacity: 0.1)
        topView.applyCommonDropShadow(radius: 5, opacity: 0.1)
        bottomView.applyCommonDropShadow(radius: 5, opacity: 0.1)
        let padding = sourceTextView.textContainer.lineFragmentPadding
        sourceTextView.textContainerInset =  UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: -padding)
        targetTextView.textContainerInset =  UIEdgeInsets(top: 0, left: -padding, bottom: 0, right: -padding)
        sourceTextView.delegate = self
        targetTextView.delegate = self
        sourceTextView.returnKeyType = .go
        sourceTextView.enablesReturnKeyAutomatically = true
    }
    
    func displayLanguagesController() {
        let languagesController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LanguagesViewController") as! LanguagesViewController
        self.addChild(languagesController)
        self.view.addSubview(languagesController.view)
        languagesController.didMove(toParent: self)
    }
}


extension LanguagesViewController {
    func setupUI() {
        languageTableView.register(UINib(nibName: "LanguagesTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguagesTableViewCell")
        searchTextField.setLeftPaddingPoints(10)
        searchTextField.setRightPaddingPoints(10)
        searchTextField.layer.cornerRadius = AppConstants.commonCornerRadius
        
        
        
    }
}
