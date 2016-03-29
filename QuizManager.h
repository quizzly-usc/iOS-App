//
//  QuizManager.h
//  Quizzly
//
//  Created by Sagar Miglani on 3/8/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void(^Success)(id);
typedef  void(^Error)(id);

@interface QuizManager : NSObject

+(instancetype )sharedInstance;

-(void)courses:(NSDictionary *)params
       success:(Success)success
       failure:(Error)success;

@end
