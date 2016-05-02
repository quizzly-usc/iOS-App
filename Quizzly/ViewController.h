//
//  ViewController.h
//  Quizzly
//
//  Created by Sagar Miglani on 3/3/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^Success)(id);
typedef  void(^Error)(id);

@interface ViewController : UIViewController<NSXMLParserDelegate, NSLayoutManagerDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

-(void)sendSignIn:(NSDictionary *)params
          success:(Success)success
          failure:(Error)success;

- (IBAction)fetchGreeting;

@end