//
//  freeResponseViewController.h
//  Quizzly
//
//  Created by Sagar Miglani on 4/12/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface freeResponseViewController : UIViewController
- (IBAction)submitButton:(id)sender;

@property (strong, nonatomic) NSDictionary *questionContainer;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@end
