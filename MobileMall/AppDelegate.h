//
//  AppDelegate.h
//  SoftBestWine
//
//  Created by Chenyuanfang on 13-4-8.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  项目的入口类

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "CustomTabBar.h"
#import "FilterViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate,UITabBarControllerDelegate>{
    int shoppingNum;
}

@property (strong, nonatomic) UIWindow *window; 
@property (nonatomic,retain) CustomTabBar *myTabBar;    //自定义tabBar（页面选项卡）
@property (nonatomic,retain) FilterViewController *myFilter;    //筛选界面
@property (nonatomic,retain) UINavigationController *loginNav;    //注册登陆界面

-(void)layoutTabBarController;              //构建自定义的TabBar选择器
-(void)makeRightViewVisible;               //显示筛选界面
-(void)makeRightViewUnVisible;               //隐藏筛选界面
-(void)addBadgeOnTabBar:(int)badges;             //购物车按钮上的数字编辑
-(void)addLoginViewController;            //添加注册登陆界面
-(BOOL)checkIfLogin;                //检查是否登陆
@end
