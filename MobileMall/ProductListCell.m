//
//  ProductListCell.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-19.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ProductListCell.h"

@implementation ProductListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        proView=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"homeWaitSmall.png"]];
        proView.frame=CGRectMake(5, 5, 85, 85);
        [self.contentView addSubview:proView];
        
        nameLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 10, 200, 36)];
        nameLab.backgroundColor=[UIColor clearColor];
        nameLab.font=[UIFont systemFontOfSize:16];
        nameLab.numberOfLines=2;
        nameLab.lineBreakMode=NSLineBreakByWordWrapping;
        [self.contentView addSubview:nameLab];
        
        priceLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 49, 190, 18)];
        priceLab.backgroundColor=[UIColor clearColor];
        priceLab.textColor=[UIColor redColor];
        priceLab.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:priceLab];
        
        salesLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 70, 180, 15)];
        salesLab.backgroundColor=[UIColor clearColor];
        salesLab.textColor=[UIColor grayColor];
        salesLab.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:salesLab];
        
        UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(300, 42, 7, 11)];
        arrow.image=[UIImage imageNamed:@"jiantou.png"];
        [self.contentView addSubview:arrow];
        [arrow release];
    }
    return self;
}

-(void)updateCellWithmyProduct:(ProductObject *)aObj{
    proView.image=[UIImage imageNamed:aObj.imageUrl];
    nameLab.text=aObj.name;
    priceLab.text=aObj.price;
    salesLab.text=aObj.sales;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
		[proView cancelImageLoad];
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc{
    TT_RELEASE_SAFELY(proView);
    TT_RELEASE_SAFELY(nameLab);
    TT_RELEASE_SAFELY(priceLab);
    TT_RELEASE_SAFELY(salesLab);
    [super dealloc];
}

@end
