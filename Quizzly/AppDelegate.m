//
//  AppDelegate.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/3/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "AppDelegate.h"
#import <AirshipKit/AirshipKit.h>
#import "xxx.h"
#import "QuizManager.h"
#import "QuizViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UAConfig* config = [UAConfig defaultConfig];
    xxx* customPushDelegate = [xxx sharedInstance];
    [UAirship push].pushNotificationDelegate = customPushDelegate;
    [UAirship push].userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
    [UAirship push].userPushNotificationsEnabled = YES;

    NSLog(@"++++++++++++++++++++++++ hapepneding +++++++++++++++++++++++++++");
    [UAirship takeOff:config];
    
    _navigationControl = [[UINavigationController alloc] init];
    _storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.196 green:0.945 blue:0.659 alpha:1]];

    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[UAirship push] appRegisteredForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [[UAirship push] appRegisteredUserNotificationSettings];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[UAirship push] appReceivedRemoteNotification:userInfo
                                  applicationState:application.applicationState];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"$$$$$$$$$$$$$$$$$$ working $$$$$$$$$$$$$$$$$$$$$");
    NSLog(@">>>>>>>>>>THIS IS THE QUESTION ID: %@", [userInfo valueForKey:@"quest_id"]);
    //QuizManager *qm = [[QuizManager alloc] init];

    _questID = [userInfo valueForKey:@"quest_id"];
    
    
    _navigationControl = (UINavigationController *) self.window.rootViewController;
    
    QuizViewController* newView = [self.storyboard instantiateViewControllerWithIdentifier:@"QuizView"];
    newView.data = userInfo;

    [_navigationControl pushViewController:newView animated:YES];
    //[self.navigationControl pushViewController: newView animated: YES];
    
    
    
    
    
    [[UAirship push] appReceivedRemoteNotification:userInfo
                                  applicationState:application.applicationState
                            fetchCompletionHandler:completionHandler];
}

-(NSString *)getID
{
    return _questID;
}


- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())handler {
    [[UAirship push] appReceivedActionWithIdentifier:identifier
                                        notification:userInfo
                                    applicationState:application.applicationState
                                   completionHandler:handler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())handler {
    [[UAirship push] appReceivedActionWithIdentifier:identifier
                                        notification:userInfo
                                        responseInfo:responseInfo
                                    applicationState:application.applicationState
                                   completionHandler:handler];
}

@end
