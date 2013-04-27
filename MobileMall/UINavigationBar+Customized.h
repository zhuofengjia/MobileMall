//
//  HomeViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  扩展系统的导航条，可以自定义颜色和背景图片

#import <Foundation/Foundation.h>


@interface UINavigationBar (Customized)

+ (void) initImageDictionary;
- (void) drawRect:(CGRect)rect;
- (void) setImage:(UIImage*)image;      
-(void)loadNavigationBar;
@end
