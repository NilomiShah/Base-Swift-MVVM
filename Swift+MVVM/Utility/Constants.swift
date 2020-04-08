//
//  Constants.swift
//  BaseProject
//
//  Created by MAC240 on 04/06/18.
//  Copyright © 2018 MAC240. All rights reserved.
//

import Foundation
import UIKit



//MARK:- Alias for class name
//typealias AppDel            = AppDelegate


//MARK:- Global Variables
let Application    = UIApplication.shared.delegate as! AppDelegate
var AppDisplayName : String {return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String}
let Screen         = UIScreen.main.bounds.size
struct Constants {

    static var KeyWindow : UIWindow? {
           if #available(iOS 13.0, *) {
           return  UIApplication.shared.connectedScenes
               .filter({$0.activationState == .foregroundActive})
               .map({$0 as? UIWindowScene})
               .compactMap({$0})
               .first?.windows
               .filter({$0.isKeyWindow}).first
           } else {
               return UIApplication.shared.keyWindow
           }
       }
    
    //MARK: - device type
    enum UIUserInterfaceIdiom : Int{
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize {
        static let ScreenWidth         = UIScreen.main.bounds.size.width
        static let ScreenHeight        = UIScreen.main.bounds.size.height
        static let ScreenMaxLength     = max(ScreenSize.ScreenWidth, ScreenSize.ScreenHeight)
        static let SCREEN_MIN_LENGTH   = min(ScreenSize.ScreenWidth, ScreenSize.ScreenHeight)
    }
    
}
