//
//  AppManager.h
//  Apnapaisa
//
//  Created by Jnix on 29/12/15.
//  Copyright © 2015 Jnix. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void(^Success)(id);
typedef  void(^Error)(id);

@interface AppManager : NSObject

+(instancetype )sharedInstance;

-(void)courses:(NSDictionary *)params
         success:(Success)success
         failure:(Error)success;



@end
