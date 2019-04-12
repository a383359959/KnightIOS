//
//  AppDelegate.m
//  Knight
//
//  Created by QiuHao on 2019/4/8.
//  Copyright © 2019年 QiuHao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSThread sleepForTimeInterval: 3];
    
    self.window = [[UIWindow alloc] init];
    
    User *user = [User getInstance];
    
    [LeanCloud getInstance];
    
    [user saveWindow: self.window];

    [user initApp];

    [self initJpushAPNs];
    
    [self initJpush: launchOptions];
    
    [self.window makeKeyAndVisible];
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [application setApplicationIconBadgeNumber: 0];
    
    [application cancelAllLocalNotifications];
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [application setApplicationIconBadgeNumber: 0];
    
    [application cancelAllLocalNotifications];
    
}

- (void)initJpushAPNs {
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        
        entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound | JPAuthorizationOptionProvidesAppNotificationSettings;
        
    } else {
        
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
    }
    
    [JPUSHService registerForRemoteNotificationConfig: entity delegate: self];
    
}

- (void)initJpush:(NSDictionary *)launchOptions {
    
    [JPUSHService setupWithOption: launchOptions appKey: @"5b57526a62393da1854d3947" channel: @"App Store" apsForProduction: YES];
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [JPUSHService registerDeviceToken: deviceToken];
    
    [JPUSHService resetBadge];
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
    
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)) {
    
    if (@available(iOS 10.0, *)) {
        
        if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            
        } else {
            
        }
        
    } else {
        
    }
    
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler  API_AVAILABLE(ios(10.0)) {
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    if (@available(iOS 10.0, *)) {
        
        if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            
            [JPUSHService handleRemoteNotification: userInfo];
            
        }
        
    }
    
    if (@available(iOS 10.0, *)) {
        
        completionHandler(UNNotificationPresentationOptionAlert);
        
    }
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [JPUSHService setBadge: 0];
    
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    
    if (@available(iOS 10.0, *)) {
        
        if([response.notification.request.trigger isKindOfClass: [UNPushNotificationTrigger class]]) {
            
            [JPUSHService handleRemoteNotification: userInfo];
            
        }
        
    }
    
    completionHandler();
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [JPUSHService setBadge: 0];
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [JPUSHService handleRemoteNotification: userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [JPUSHService handleRemoteNotification: userInfo];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
