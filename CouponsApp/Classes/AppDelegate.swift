/**
 * Copyright 2016 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
//  AppDelegate.swift
//  MyCoupons
//
//  Created by Ishai Borovoy on 14/08/2016.
//

import UIKit
import IBMMobileFirstPlatformFoundation
import BMSCore
import BMSAnalytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        _ = UserLoginChallengeHandler()
        BMSClient.sharedInstance.initialize(bluemixRegion: BMSClient.Region.usSouth)
        // Add Bluemix Mobile Analytics Key below
        Analytics.initialize(appName: "Coupons_Application", apiKey: "Your-Mobile-Analytics-Service-Key", hasUserContext: true, collectLocation: true, deviceEvents: .lifecycle, .network)
        Analytics.isEnabled = true
        Logger.isLogStorageEnabled = true
        Logger.isInternalDebugLoggingEnabled = true
        Logger.logLevelFilter = LogLevel.debug
        
     
        
        Analytics.send();
        return true
    }

}

