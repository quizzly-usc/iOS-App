//
//  ViewController.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/3/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()

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

@end