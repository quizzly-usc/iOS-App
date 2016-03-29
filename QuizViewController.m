//
//  QuizViewController.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/8/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "QuizViewController.h"
#import "QuizManager.h"

@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UIButton *answerA;
@property (weak, nonatomic) IBOutlet UIButton *answerB;
@property (weak, nonatomic) IBOutlet UIButton *answerC;
@property (weak, nonatomic) IBOutlet UIButton *answerD;
@property (nonatomic ) NSDictionary * dataArray;

@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.title = @"Quiz";
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    typeof (self) weakSelf = self;
    [self configure];
//    [[QuizManager sharedInstance] courses:@{} success:^(NSDictionary  * courses) {
//        
//            //weakSelf.dataArray = courses;
//            NSLog(@"Print data array: %@", _dataArray);
//
//
////        NSDictionary *dict = [_dataArray objectAtIndex:0];
////        NSDictionary *dict =
////        NSString *string = [_dataArray objectAtIndex:5];
////        NSLog(@" dict: %@", dict);
////        NSLog(@" array count: %lu", (unsigned long)_dataArray.count);
////        NSLog(@" answer arrays: %@");
////                NSLog(@" answer arrays: %@", [_dataArray objectAtIndex:<#(NSUInteger)#>]);
////        NSLog(@" answer 1: %@", [[[_dataArray objectAtIndex:0] objectAtIndex:0] objectForKey:@"text"]);
////                NSLog(@" answer 2: %@", [[[_dataArray objectAtIndex:0] objectAtIndex:1] objectForKey:@"text"]);
////                NSLog(@" answer 3: %@", [[[_dataArray objectAtIndex:0] objectAtIndex:2] objectForKey:@"text"]);
////                NSLog(@" answer 4: %@", [[[_dataArray objectAtIndex:0] objectAtIndex:3] objectForKey:@"text"]);
//        
//        
//    } failure:^(NSError * error) {
//        
//        NSLog(@"Error- %@",error.localizedDescription);
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configure {
    
    self.questionLabel.text = self.data[@"question"];
    
    NSLog(@"this is the: %@", self.data[@"question"]);

//    for(int i = 0; i < ; ++i) {
//        if(self.data[@"answer" + i] != nil) {
//            [_answerA setTitle:self.data[@"answer" + i] forState:UIControlStateNormal];
//        }
//    }
    
    [_answerA setTitle:self.data[@"answer0"] forState:UIControlStateNormal];
    [_answerB setTitle:self.data[@"answer1"] forState:UIControlStateNormal];
    [_answerC setTitle:self.data[@"answer2"] forState:UIControlStateNormal];
    [_answerD setTitle:self.data[@"answer3"] forState:UIControlStateNormal];
//    [_answerD setTitle:data[@"answers"][3][@"text"] forState:UIControlStateNormal];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)answer1:(id)sender {
}

- (IBAction)answer2:(id)sender {
}

- (IBAction)answer3:(id)sender {
}

- (IBAction)answer4:(id)sender {
}
@end
