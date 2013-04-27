//
//  UIColumnViewCell.m
//  iProduct
//
//  Created by Hager Hu on 5/23/11.
//  Copyright 2011 dreamblock.net. All rights reserved.
//

#import "UIColumnViewCell.h"


@implementation UIColumnViewCell

@synthesize textLabel;
@synthesize imageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(4, 0, 92, 120)];
        bgView.backgroundColor=[UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:1.0];
        [self.contentView addSubview:bgView];
        [bgView release];
        
        imageView=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"homeWaitSmall.png"]];
        imageView.frame=CGRectMake(5, 1, 90, 94);
        [self.contentView addSubview:imageView];
        
        UIView *LabBgView=[[UIView alloc]initWithFrame:CGRectMake(5, 95, 90, 24)];
        LabBgView.backgroundColor=[UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0];
        [self.contentView addSubview:LabBgView];
        [LabBgView release];
        
        
        textLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 98, 90, 18)];
        textLabel.backgroundColor=[UIColor clearColor];
        textLabel.font=[UIFont systemFontOfSize:14];
        textLabel.textColor=[UIColor redColor];
        textLabel.textAlignment=NSTextAlignmentCenter;
        textLabel.text=@"￥1020.00";
        [self.contentView addSubview:textLabel];
    }
    
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
    textLabel.highlighted = YES;
    imageView.highlighted = YES;
}


- (void)dealloc {
    [textLabel release];
    [imageView release];
    
    [super dealloc];
}


@end