//
//  ViewController.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/3/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#define SERVER_URL                          @"http://fontify.usc.edu"
#define COURSES                             @"/login"

#import "ViewController.h"
#import "AFNetworking.h"
#import <AirshipKit/AirshipKit.h>



@interface ViewController ()
@property (nonatomic) AFHTTPSessionManager * manager;

@end

@implementation ViewController

- (IBAction)fetchGreeting;
{
    
}

- (void)viewDidLoad
{
    [self.navigationController.navigationBar setTranslucent:YES];
    self.view.backgroundColor = [UIColor colorWithRed:0.196 green:0.945 blue:0.659 alpha:1];


    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
        [self.emailTF resignFirstResponder];
        [self.passwordTF resignFirstResponder];
}

//TO DISMISS KEYBOARD
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
        if(textField) {
                [textField resignFirstResponder];
            }
        return NO;
}

-(AFHTTPSessionManager *)manager{
    
    if(!_manager){
        
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

-(void)sendSignIn:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    if([_emailTF.text isEqualToString:@""]|| [_passwordTF.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please input your email or password first" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSString *email = self.emailTF.text;
        NSString *password = self.passwordTF.text;
        NSString *deviceType = @"ios";
        NSString *channelID = [UAirship push].channelID;
        
        NSDictionary *dict = @{@"email": email, @"password": password, @"deviceType": deviceType, @"channelID": channelID};
        
        NSString * url = [SERVER_URL stringByAppendingString:COURSES];
        NSLog(@"REQUEST : %@",url);
        
        [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self performSegueWithIdentifier:@"login" sender:self];
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failure(error);
            
        }];

    }
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    UIColor *color = [UIColor whiteColor];
    _emailTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"School Email" attributes:@{NSForegroundColorAttributeName: color}];
    
    color = [UIColor whiteColor];
    _passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    //BOTTOM BORDER FOR EMAIL TEXTFIELD
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _emailTF.frame.size.height - borderWidth, _emailTF
                              .frame.size.width, _emailTF.frame.size.height);
    border.borderWidth = borderWidth;
    [_emailTF.layer addSublayer:border];
    _emailTF.layer.masksToBounds = YES;
    
    //BOTTOM BORDER FOR PASSWORD TEXTFIELD
    border = [CALayer layer];
    borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _passwordTF.frame.size.height - borderWidth, _passwordTF
                              .frame.size.width, _passwordTF.frame.size.height);
    border.borderWidth = borderWidth;
    [_passwordTF.layer addSublayer:border];
    _passwordTF.layer.masksToBounds = YES;
    
    [self.navigationController.navigationBar setTranslucent:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signIn:(id)sender {
        //[self performSegueWithIdentifier:@"login" sender:self];
        //    //CHECK IF EITHER OF THEM ARE EMPTY, IF SO THEN THROW AN ALERT
        //    if([_emailTF.text isEqualToString:@""]|| [_passwordTF.text isEqualToString:@""]){
        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please input your email or password first" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        //        [alert show];
        //    }else{
        //
        //        //THIS IS WHERE TO CREDENTIALS:EMAIL AND PASSWORD
        //
        //        //        //SET VALUES FROM PARSING
        //        //        PFQuery *userQuery = [PFUser query];
        //        //        [userQuery whereKey:@"username" equalTo:_emailTF.text];
        //
        //        //        //CONFIRMING THAT USER EXISTS
        //        //        NSInteger userExist = [userQuery countObjects];
        //        //
        //        //        //PULL PASSWORD AND EMAIL FROM DATABASE AND CHECK IF THEY ARE MATCHING
        //        //        [PFUser logInWithUsernameInBackground:_emailTF.text password:_passwordTF.text block:^(PFUser *user, NSError *error){
        //        //
        //        //            //IF THERE IS NOT AN ERROR WHEN LOGGING IN
        //        //            if(!error){
        //        //                NSLog(@"User login!");
        //
        //        //                //SEGUE TO THE NEXT PAGE
        //        //                [self performSegueWithIdentifier:@"login" sender:self];
        //        //            }
        //        //
        //        //            //IF THERE IS AN ERROR WHEN LOGGING IN, SHOW AN ALERT
        //        //            if(error){
        //        //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please confirm your username/or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        //        //                [alert show];
        //        //            }
        //        //        }];
        //        //    }
        //    }
    
    [self sendSignIn:nil success:^(NSArray  * response) {
        NSLog(@"-----------------------------SIGN UP SUCCESS--------------------------");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please confirm your username/or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }];
}

@end