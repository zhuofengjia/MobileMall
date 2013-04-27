//
//  SearchViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  搜索首页

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{

    UIButton *dynamicBtn;    //扫描和取消的动态按钮
    UITextField *mySearchFd;
    UIButton *myDeleteBtn;
    UIControl *cancelCor;    //透明挡板，搜索时候显示
    BOOL  isSearching;       //判断是否是搜索的状态
    NSMutableArray *hotArr;         //热门搜索的数据
    NSMutableArray *historyArr;          //搜索历史的数据
    
    UITableView *hotTable;         //热门搜索列表
    UITableView *historyTable;        //搜索历史列表
}

-(void)layoutMySearchView;

//扫描和搜索的动态处理
-(void)changeMySearchToScanning;

-(void)changeMyScanningToSearch;

//添加热门搜获和搜索历史的View
-(void)layoutMySelectView;

-(void)layoutMyTableView;
@end
