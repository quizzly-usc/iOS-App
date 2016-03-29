//
//  CourcesVC.m
//  Quizzly
//
//  Created by Jnix on 08/03/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "CourcesVC.h"
#import "AppManager.h"

@interface CourcesVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ) NSArray * dataArray;
@end

@implementation CourcesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //SETTING TITLE CHARACTERISTICS
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor],
       NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25]}];
    
    //HIDING BACKWARD BUTTON
    self.navigationItem.hidesBackButton = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    typeof (self) weakSelf = self;
    [[AppManager sharedInstance] courses:@{} success:^(NSArray  * courses) {
        
        weakSelf.dataArray = courses;
        NSLog(@"Course VC data array : %@ \n", weakSelf.dataArray);
        [weakSelf.tableView reloadData];
        
    } failure:^(NSError * error) {
        
        NSLog(@"Error- %@",error.localizedDescription);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CourseCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    [cell configure:self.dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"quizSegue" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
