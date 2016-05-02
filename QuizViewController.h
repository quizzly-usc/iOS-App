//
//  QuizViewController.h
//  Quizzly
//
//  Created by Sagar Miglani on 3/8/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xxx.h"
#import "freeResponseViewController.h"


typedef  void(^Success)(id);
typedef  void(^Error)(id);

@interface QuizViewController : UIViewController
{
    IBOutlet UILabel *countdownTimer;
    NSTimer *countdown;
    int secondsCount;
}

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
- (IBAction)answer1:(id)sender;
- (IBAction)answer2:(id)sender;
- (IBAction)answer3:(id)sender;
- (IBAction)answer4:(id)sender;
- (IBAction)answer5:(id)sender;
- (IBAction)answer6:(id)sender;

-(void)sendAnswer:(NSDictionary *)params
       success:(Success)success
       failure:(Error)success;
-(void)sendAnswer2:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;
-(void)sendAnswer3:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;
-(void)sendAnswer4:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;
-(void)sendAnswer5:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;
-(void)sendAnswer6:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;




-(void)configure:(NSDictionary * )data;
@property (strong, nonatomic) NSDictionary *data;

@property (strong, nonatomic) UIWindow *window;


@end
