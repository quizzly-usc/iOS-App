//
//  signUpViewController.m
//  Quizzly
//
//  Created by Sagar Miglani on 4/13/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#define SERVER_URL                          @"http://fontify.usc.edu"
#define COURSES                             @"/signup"

#import "AFNetworking.h"
#import "signUpViewController.h"

@interface signUpViewController ()
@property (nonatomic) AFHTTPSessionManager * manager;

@end

@implementation signUpViewController

- (void)viewDidLoad {
    [self.navigationController.navigationBar setTranslucent:YES];
    self.view.backgroundColor = [UIColor colorWithRed:0.196 green:0.945 blue:0.659 alpha:1];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
        [self.firstName resignFirstResponder];
        [self.lastName resignFirstResponder];
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

-(void)viewDidAppear:(BOOL)animated{
    //BOTTOM BORDER FOR FIRST NAME
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _firstName.frame.size.height - borderWidth, _firstName
                              .frame.size.width, _firstName.frame.size.height);
    border.borderWidth = borderWidth;
    [_firstName.layer addSublayer:border];
    _firstName.layer.masksToBounds = YES;
    
    //BOTTOM BORDER FOR LAST NAME
    border = [CALayer layer];
    borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _lastName.frame.size.height - borderWidth, _lastName
                              .frame.size.width, _lastName.frame.size.height);
    border.borderWidth = borderWidth;
    [_lastName.layer addSublayer:border];
    _lastName.layer.masksToBounds = YES;
    
    //BOTTOM BORDER FOR PASSWORD
    border = [CALayer layer];
    borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _passwordTF.frame.size.height - borderWidth, _passwordTF
                              .frame.size.width, _passwordTF.frame.size.height);
    border.borderWidth = borderWidth;
    [_passwordTF.layer addSublayer:border];
    _passwordTF.layer.masksToBounds = YES;
    
    //BOTTOM BORDER FOR EMAIL
    border = [CALayer layer];
    borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, _emailTF.frame.size.height - borderWidth, _emailTF
                              .frame.size.width, _emailTF.frame.size.height);
    border.borderWidth = borderWidth;
    [_emailTF.layer addSublayer:border];
    _emailTF.layer.masksToBounds = YES;
    
    [self.navigationController.navigationBar setTranslucent:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AFHTTPSessionManager *)manager{
    
    if(!_manager){
        
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)sendSignUp:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *firstName = self.firstName.text;
    NSString *lastName = self.lastName.text;
    NSString *email = self.emailTF.text;
    NSString *password = self.passwordTF.text;
    BOOL isProfessor = NO;
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"firstName":firstName,@"lastName":lastName, @"email": email, @"password": password, @"isProfessor": [NSNumber numberWithBool:NO]};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};
    
    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];

}




- (IBAction)submitButton:(id)sender
{
    [self sendSignUp:nil success:^(NSArray  * response) {
        NSLog(@"-----------------------------SIGN UP SUCCESS--------------------------");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];
}
@end
