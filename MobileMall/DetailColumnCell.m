//
//  DetailColumnCell.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-2.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "DetailColumnCell.h"

@implementation DetailColumnCell

@synthesize myView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        myView=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"homeWaitSmall.png"]];
        myView.frame=CGRectMake(5, 5, 178, 188);
        [self.contentView addSubview:myView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc{
    [myView release];
    
    [super dealloc];
}

@end
