//
//  CourseCell.m
//  Quizzly
//
//  Created by Jnix on 08/03/16.
//  Copyright © 2016 Sagar Miglani. All rights reserved.
//

#import "CourseCell.h"

@interface CourseCell()
@property (weak, nonatomic) IBOutlet UILabel *courseNameLabel;

@end

@implementation CourseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configure:(NSDictionary * )data{
    
    self.courseNameLabel.text = data[@"title"];
}
@end
