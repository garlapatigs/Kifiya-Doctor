//
//  extensions.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func roundBorder(view: UIView) {
        view.layer.cornerRadius = view.frame.size.height/2
               view.layer.masksToBounds = true
               view.clipsToBounds = true
               
               view.layer.borderWidth = 2
               view.layer.borderColor = UIColor.yellow.cgColor
    }
    func border(view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
extension UIImageView{
    func roundedImg(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.clipsToBounds = true
    }
}
extension UITextField {
    func border(textField: UITextField) {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
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
extension UILabel {
    func border(label: UILabel) {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
extension UIButton {
    func corner(button: UIButton) {
        self.layer.cornerRadius = self.frame.size.height/2
        //self.clipsToBounds = true
    }
}
extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.5)
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 20, y: 10.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){ // image left
        seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }
    self.layer.cornerRadius = self.layer.frame.height/2
    self.layer.masksToBounds = true
    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = 1
}

}
