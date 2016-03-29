//
//  ViewController.h
//  Quizzly
//
//  Created by Sagar Miglani on 3/3/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate, NSLayoutManagerDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


- (IBAction)fetchGreeting;

@end