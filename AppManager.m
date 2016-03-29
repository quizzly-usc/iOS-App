//
//  AppManager.m
//  Apnapaisa
//
//  Created by Jnix on 29/12/15.
//  Copyright © 2015 Jnix. All rights reserved.
//

#define SERVER_URL                          @"http://fontify.usc.edu"

#define COURSES                             @"/courses/student/1"

#import "AppManager.h"
#import "AFNetworking.h"

@interface AppManager()
@property (nonatomic) AFHTTPSessionManager * manager;
@end

@implementation AppManager

-(void)dealloc{
    
    
}

-(AFHTTPSessionManager *)manager{
    
    if(!_manager){
        
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

-(void)courses:(NSDictionary *)params
            success:(Success)success
            failure:(Error)failure{
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    [self.manager POST:url parameters:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

+(AppManager *)sharedInstance{
    
    static AppManager *sharedInstance;
    if (sharedInstance == nil) {
        
        sharedInstance = [[AppManager alloc] init];
    }
    return sharedInstance;
}

@end
