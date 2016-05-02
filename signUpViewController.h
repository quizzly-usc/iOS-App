//
//  signUpViewController.h
//  Quizzly
//
//  Created by Sagar Miglani on 4/13/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  void(^Success)(id);
typedef  void(^Error)(id);

@interface signUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


- (IBAction)submitButton:(id)sender;

-(void)sendSignUp:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;

-(void)configure:(NSDictionary * )data;

@end
