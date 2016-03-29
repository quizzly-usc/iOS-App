//
//  QuizManager.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/8/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#define SERVER_URL                          @"http://fontify.usc.edu"
#define COURSES                             @"/question/1"

#import "QuizManager.h"
#import "AFNetworking.h"

@interface QuizManager()
@property (nonatomic) AFHTTPSessionManager * manager;
@property (nonatomic ) NSDictionary * dataArray;
@end

@implementation QuizManager

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

+(QuizManager *)sharedInstance{
    
    static QuizManager *sharedInstance;
    if (sharedInstance == nil) {
        
        sharedInstance = [[QuizManager alloc] init];
    }
    return sharedInstance;
}


@end
