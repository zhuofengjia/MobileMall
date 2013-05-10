//
//  DetailColumnCell.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-2.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  封装商品详情页左右滑动的单元格

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface DetailColumnCell : UITableViewCell{
    EGOImageView *myView;
}
@property(nonatomic,retain)EGOImageView *myView;
@end
