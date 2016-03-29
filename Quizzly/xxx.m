//
//  xxx.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/28/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "xxx.h"

@implementation xxx

+ (xxx *)sharedInstance {
    static xxx *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)receivedForegroundNotification:(NSDictionary *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // App received a foreground notification
    NSLog(@"------------------------NOTIFICATION-------------------------");
    // Call the completion handler
    completionHandler(UIBackgroundFetchResultNoData);
}
- (void)launchedFromNotification:(NSDictionary *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    // App was launched from a notification
    NSLog(@"------------------------NOTIFICATION-------------------------");
    // Call the completion handler
    completionHandler(UIBackgroundFetchResultNoData);
}
- (void)launchedFromNotification:(NSDictionary *)notification actionIdentifier:(NSString *)identifier completionHandler:(void (^)())completionHandler {
    // App was launched from a notification action button
    NSLog(@"------------------------NOTIFICATION-------------------------");
    // Call the completion handler
    completionHandler();
}
- (void)receivedBackgroundNotification:(NSDictionary *)notification actionIdentifier:(NSString *)identifier completionHandler:(void (^)())completionHandler {
    // App was launched in the background from a notificaiton action button
    NSLog(@"------------------------NOTIFICATION-------------------------");
    // Call the completion handler
    completionHandler();
}
- (void)receivedBackgroundNotification:(NSDictionary *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // App received a background notification
    NSLog(@"------------------------NOTIFICATION-------------------------");
    // Call the completion handler
    completionHandler(UIBackgroundFetchResultNoData);
}

@end
