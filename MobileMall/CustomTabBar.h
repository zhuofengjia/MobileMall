//
//  CustomTabBar.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  整个项目的页面控制器

#import <UIKit/UIKit.h>

@interface CustomTabBar : UITabBarController <UITabBarControllerDelegate,UIScrollViewDelegate>{
	NSMutableArray *buttons;
	int currentSelectedIndex;
	UIImageView *slideBg;
    UIView *tempView;
    UIScrollView *BgScrollView;
    
    UIImageView *leftArrow;
    UIImageView *rightArrow;
    
    BOOL ishidden;
    
    BOOL isLock;
}
@property(nonatomic,retain) UIView *tempView;
@property(nonatomic,retain) UIScrollView *BgScrollView;
@property (nonatomic, assign) int	currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;
@property (nonatomic,assign )BOOL ishidden;

@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UIImageView *slideBg;
@property(nonatomic,assign)BOOL isLock;;

- (void)hideRealTabBar;
- (void)customTabBar;
//- (void)selectedTab:(UIButton *)button;
- (void)tabBarController:(CustomTabBar *)tabBarController didSelectViewController:(UIViewController *)viewController;
- (void)hide;
- (void)show;
@end
