//
//  HomeViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  首页

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"
#import "UIColumnView.h"

@interface HomeViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,CycleScrollViewDelegate,UIColumnViewDelegate,UIColumnViewDataSource>{
    
    UITextField *mySearchFd;        //自定义搜索输入框
    UIButton *DynamicBtn;        //搜索取消按钮和打电话的按钮
    UIControl *cancelCor;        //搜索时候的黑色透明蒙版
    UIView *phongView;          //打电话控制的View
    UIScrollView *mainView;       //上下滑动的View
    BOOL isSearching;           //判断是否是搜索的状态
    UIButton *myDeleteBtn;        //搜索框内的删除按钮
    
    CycleScrollView *adShowView;       //自动左右循环滑动的View
    NSTimer *myTimer;             //定时器，实现图片的自动滑动
    
    
    //左右滑动的商品展示表
    UIColumnView *startTableView;      
    UIColumnView *interestingTbaleView;
    
}
//搜索部分的UI
-(void)layoutMySearchView;

//打电话UI处理
-(void)layoutMyPhoneView;

//自动滚动图片UI
-(void)layoutMyMainScrollView;

//取消打电话
-(void)cancelMyPhone;
//打电话
-(void)startMyPhone;

//动态按钮绑定的方法
-(void)SearchOrPhone;

//动态按钮的动画处理
-(void)changeMyPhoneToSearch;
-(void)changeMySearchToPhone;

//取消搜索操作
-(void)cancelMySearch;
@end
