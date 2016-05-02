//
//  QuizViewController.m
//  Quizzly
//
//  Created by Sagar Miglani on 3/8/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#define SERVER_URL                          @"http://fontify.usc.edu"
#define COURSES                             @"/question/answer"

#import "QuizViewController.h"
#import "QuizManager.h"
#import "AFNetworking.h"
#import "freeResponseViewController.h"



@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UIButton *answerA;
@property (weak, nonatomic) IBOutlet UIButton *answerB;
@property (weak, nonatomic) IBOutlet UIButton *answerC;
@property (weak, nonatomic) IBOutlet UIButton *answerD;
@property (weak, nonatomic) IBOutlet UIButton *answerE;
@property (weak, nonatomic) IBOutlet UIButton *answerF;

@property (nonatomic ) NSDictionary * dataArray;
@property (nonatomic) AFHTTPSessionManager * manager;


@end

@implementation QuizViewController

- (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view
        self.title = @"TAKING QUIZ";
        
        _answerA.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _answerA.titleLabel.numberOfLines = 3;
        
        _answerB.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _answerB.titleLabel.numberOfLines = 3;
        
        _answerC.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _answerC.titleLabel.numberOfLines = 3;
        
        _answerD.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _answerD.titleLabel.numberOfLines = 3;
    
        _answerE.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _answerE.titleLabel.numberOfLines = 3;
        
        _answerF.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _answerF.titleLabel.numberOfLines = 3;
   
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
    
    
    NSString *a = self.data[@"num_answers"];
    NSInteger b = [a integerValue];
    
    
    
    

    
    
    freeResponseViewController *destinationController = [[freeResponseViewController alloc] init];
    destinationController.questionContainer = self.data;
    
    //b =0;
    if(b == 0)
    {
        
        [self.navigationController pushViewController:destinationController animated:NO];

        
        //[self performSegueWithIdentifier:@"freeResponse" sender:self];
    }
    else
    {
    
    
    self.questionLabel.text = self.data[@"question"];
    
    NSLog(@"this is the: %@", self.data[@"question"]);

//    for(int i = 0; i < ; ++i) {
//        if(self.data[@"answer" + i] != nil) {
//            [_answerA setTitle:self.data[@"answer" + i] forState:UIControlStateNormal];
//        }
//    }
    
    NSString *tempCount = self.data[@"time_limit"];
    secondsCount = [tempCount integerValue];
    
    countdown = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    
    
    if(self.data[@"answer0"] == nil)
    {
        [_answerA setHidden:YES];
    }
    if(self.data[@"answer1"] == nil)
    {
        [_answerB setHidden:YES];
    }
    if(self.data[@"answer2"] == nil)
    {
        [_answerC setHidden:YES];
    }
    if(self.data[@"answer3"] == nil)
    {
        [_answerD setHidden:YES];
    }
    if(self.data[@"answer4"] == nil)
    {
        [_answerE setHidden:YES];
    }
    if(self.data[@"answer5"] == nil)
    {
        [_answerF setHidden:YES];
    }
    
    [_answerA setTitle:self.data[@"answer0"] forState:UIControlStateNormal];
    [_answerB setTitle:self.data[@"answer1"] forState:UIControlStateNormal];
    [_answerC setTitle:self.data[@"answer2"] forState:UIControlStateNormal];
    //[_answerD setHidden:YES];
    [_answerD setTitle:self.data[@"answer3"] forState:UIControlStateNormal];
//    [_answerD setTitle:data[@"answers"][3][@"text"] forState:UIControlStateNormal];
    [_answerE setTitle:self.data[@"answer4"] forState:UIControlStateNormal];
    [_answerF setTitle:self.data[@"answer5"] forState:UIControlStateNormal];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) timerRun
{
    secondsCount = secondsCount - 1;
    int minutes = secondsCount / 60;
    int seconds = secondsCount - (minutes * 60);
    NSString *timerOutput = [NSString stringWithFormat:@"%2d:%.2d", minutes, seconds];
    
    countdownTimer.text = timerOutput;
    
    
    //*******************ADD A PUSH IN THIS "IF" STATEMENT TO GO TO A NEW PAGE THAT SAYS "QUIZ IS OVER"*******************
    if(secondsCount == 0)
    {
        
        [countdown invalidate];
        
        countdown = nil;
        
        [self performSegueWithIdentifier:@"expired" sender:self];
    }
}

-(void) setTimer
{
    countdownTimer.text = @"100";

    secondsCount = 100;
    countdown = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

-(AFHTTPSessionManager *)manager{
    
    if(!_manager){
        
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

-(void)sendAnswer: (NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *answer = self.data[@"answer0"];
    NSString *email = @"kobe@usc.edu";
    NSString *quest_id = self.data[@"quest_id"];
    NSString *quiz_id = self.data[@"quiz_id"];
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"quest_id":quest_id,@"quiz_id":quiz_id, @"user_email": email, @"answer": answer};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};

    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

-(void)sendAnswer2:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *answer = self.data[@"answer1"];
    NSString *email = @"kobe@usc.edu";
    NSString *quest_id = self.data[@"quest_id"];
    NSString *quiz_id = self.data[@"quiz_id"];
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"quest_id":quest_id,@"quiz_id":quiz_id, @"user_email": email, @"answer": answer};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};
    
    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

-(void)sendAnswer3:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *answer = self.data[@"answer2"];
    NSString *email = @"kobe@usc.edu";
    NSString *quest_id = self.data[@"quest_id"];
    NSString *quiz_id = self.data[@"quiz_id"];
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"quest_id":quest_id,@"quiz_id":quiz_id, @"user_email": email, @"answer": answer};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};
    
    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

-(void)sendAnswer4:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *answer = self.data[@"answer3"];
    NSString *email = @"kobe@usc.edu";
    NSString *quest_id = self.data[@"quest_id"];
    NSString *quiz_id = self.data[@"quiz_id"];
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"quest_id":quest_id,@"quiz_id":quiz_id, @"user_email": email, @"answer": answer};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};
    
    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

-(void)sendAnswer5:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *answer = self.data[@"answer4"];
    NSString *email = @"kobe@usc.edu";
    NSString *quest_id = self.data[@"quest_id"];
    NSString *quiz_id = self.data[@"quiz_id"];
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"quest_id":quest_id,@"quiz_id":quiz_id, @"user_email": email, @"answer": answer};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};
    
    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

-(void)sendAnswer6:(NSDictionary *)params success:(Success)success failure:(Error)failure
{
    NSString *answer = self.data[@"answer5"];
    NSString *email = @"kobe@usc.edu";
    NSString *quest_id = self.data[@"quest_id"];
    NSString *quiz_id = self.data[@"quiz_id"];
    
    NSString * url = [SERVER_URL stringByAppendingString:COURSES];
    NSLog(@"REQUEST : %@",url);
    
    NSDictionary *dict = @{@"quest_id":quest_id,@"quiz_id":quiz_id, @"user_email": email, @"answer": answer};
    //NSDictionary *dict = @{@"student": @1,@"course":@1, @"section": @1, @"quiz": @1, @"question": @1, @"answer": @1};
    
    [self.manager POST:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

- (IBAction)answer1:(id)sender
{
 
    [self sendAnswer:nil success:^(NSArray  * response) {
        NSLog(@"************************************SUCCESS*******************************");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];

    
    [self performSegueWithIdentifier:@"confirmation" sender: self];
    
}

- (IBAction)answer2:(id)sender
{
    [self sendAnswer2:nil success:^(NSArray  * response) {
        NSLog(@"************************************SUCCESS*******************************");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];
    
    
    [self performSegueWithIdentifier:@"confirmation" sender: self];
}

- (IBAction)answer3:(id)sender
{
    [self sendAnswer3:nil success:^(NSArray  * response) {
        NSLog(@"************************************SUCCESS*******************************");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];
    
    
    [self performSegueWithIdentifier:@"confirmation" sender: self];

}

- (IBAction)answer4:(id)sender
{
    [self sendAnswer4:nil success:^(NSArray  * response) {
        NSLog(@"************************************SUCCESS*******************************");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];
    
    
    [self performSegueWithIdentifier:@"confirmation" sender: self];
}

- (IBAction)answer5:(id)sender {
    [self sendAnswer5:nil success:^(NSArray  * response) {
        NSLog(@"************************************SUCCESS*******************************");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];
    
    
    [self performSegueWithIdentifier:@"confirmation" sender: self];
}

- (IBAction)answer6:(id)sender {
    [self sendAnswer6:nil success:^(NSArray  * response) {
        NSLog(@"************************************SUCCESS*******************************");
        
    } failure:^(NSError * error) {
        
        NSLog(@"************************************Error*********************************");
    }];
    
    
    [self performSegueWithIdentifier:@"confirmation" sender: self];
}
@end
