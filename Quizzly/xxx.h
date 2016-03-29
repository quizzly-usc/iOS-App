//
//  xxx.h
//  Quizzly
//
//  Created by Sagar Miglani on 3/28/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AirshipKit/AirshipKit.h>

@interface xxx : NSObject <UAPushNotificationDelegate>

+ (id)sharedInstance;

- (void)receivedForegroundNotification:(NSDictionary *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;
- (void)launchedFromNotification:(NSDictionary *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;
- (void)launchedFromNotification:(NSDictionary *)notification actionIdentifier:(NSString *)identifier completionHandler:(void (^)())completionHandler;
- (void)receivedBackgroundNotification:(NSDictionary *)notification actionIdentifier:(NSString *)identifier completionHandler:(void (^)())completionHandler;
- (void)receivedBackgroundNotification:(NSDictionary *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end