//
//  AppDelegate.swift
//  TVSample
//
//  Created by Diogo Brito on 01/10/15.
//  Copyright © 2015 Mokriya. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    
    var window: UIWindow?
    var appController: TVApplicationController?

    static let BaseURL = "http://localhost:1906/"
    static let BootURL = "\(BaseURL)js/application.js"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Create Controller Context
        let appControllerContext = TVApplicationControllerContext()
        
        //Create the NSURL for the landing javascript path
        guard let javaScriptURL = NSURL(string: AppDelegate.BootURL) else {
            fatalError("unable to create NSURL")
        }
        //Set the javascript path and base url
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.BaseURL
        
        //Create the controller
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        
        return true
    }
    
    
}

