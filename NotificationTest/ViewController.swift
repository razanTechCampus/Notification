//
//  ViewController.swift
//  NotificationTest
//
//  Created by razan al ali on 7/29/18.
//  Copyright © 2018 razan. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get the notification center
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        //create content for the notification
        let content = UNMutableNotificationContent()
        content.title = "TechCampus"
        content.subtitle = "New Course"
        content.body = "Check the updated course"
        content.sound = UNNotificationSound.default()
        
        //add media to notification
        if let url = Bundle.main.url(forResource: "marker", withExtension: "png") {
            if let attachment = try?
                UNNotificationAttachment(identifier: "image", url: url, options: nil) {
                content.attachments = [attachment]
            }
        }
        
        //notification trigger can be based on time, calendar or location
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        
        //create request to display
        let request = UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: trigger)
        
        //add request to notification center
        center.add(request) { (error) in
            if error != nil {
                print("error")
            }
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
