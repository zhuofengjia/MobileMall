//
//  UIColumnViewCell.h
//  iProduct
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  封装首页左右滑动表的单元格

#import <UIKit/UIKit.h>
#import "EGOImageView.h"


@interface UIColumnViewCell : UITableViewCell {
    UILabel *textLabel;
    EGOImageView *imageView;        //用于异步加载图片
}

@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, retain) UIImageView *imageView;


@end