//
//  freeResponseViewController.m
//  Quizzly
//
//  Created by Sagar Miglani on 4/12/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "freeResponseViewController.h"

@interface freeResponseViewController ()

@property (weak, nonatomic) IBOutlet UITextView *FRTextView;

@end

@implementation freeResponseViewController

- (void)viewDidLoad {

    self.questionLabel.text = self.questionContainer[@"question"];

    [super viewDidLoad];
    
    
    //self.questionLabel.text = self.questionContainer[@"question"];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    //[self configure];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)submitButton:(id)sender {
}
@end
