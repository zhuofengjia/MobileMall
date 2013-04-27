//
//  MeCenterViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  个人中心首页

#import <UIKit/UIKit.h>

@interface MeCenterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *mainArr;
}

-(void)layoutMyReplaceNav;        //隐藏掉系统的导航条，换成自己的自定义导航条

-(void)layoutMyTopView;
-(void)layoutMyMainTableView;
@end
