//
//  Tost.swift
//  Kifia Doctor
//
//  Created by apple on 20/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit

class Toast: NSObject{
    static func makeToast(message: String,in vc: UIView){
        let ToastLbl = UILabel()
        ToastLbl.text = message
        ToastLbl.textAlignment = .center
        ToastLbl.font = UIFont.boldSystemFont(ofSize: 15)
        ToastLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ToastLbl.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        ToastLbl.numberOfLines = 0
        let LblSize = ToastLbl.intrinsicContentSize
        let lblHeight = (LblSize.width / vc.frame.width) * 30
        let lblWidth = min(LblSize.width, vc.frame.width - 40)
        let ContentHeight = max(lblHeight, LblSize.height + 20)
        ToastLbl.frame = CGRect(x: 20, y: (vc.frame.height - 80) - ContentHeight, width: lblWidth + 20, height: ContentHeight)
        ToastLbl.center.x = vc.center.x
        ToastLbl.layer.cornerRadius = ToastLbl.frame.size.height / 3
        ToastLbl.layer.masksToBounds = true
        vc.addSubview(ToastLbl)
        UIView.animate(withDuration: 5.0, animations: {
            ToastLbl.alpha = 0
        }) { (_) in
            ToastLbl.removeFromSuperview()
        }
    }
    
}
class BaseVC : UIViewController{
    var viewFooter = UIView()
    var topSafeArea: CGFloat = 0
    var bottomSafeArea: CGFloat = 0
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            bottomSafeArea = bottomLayoutGuide.length
      }
    }
    func designFooter() {
        viewFooter = UIView(frame: CGRect(x:0, y:self.view.bounds.size.height - (50 + bottomSafeArea), width:self.view.bounds.size.width, height:50))
        viewFooter.backgroundColor = UIColor.red
        self.view.addSubview(viewFooter)
        self.view.bringSubviewToFront(viewFooter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        designFooter()
    }
    
}
