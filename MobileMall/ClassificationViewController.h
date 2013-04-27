//
//  ClassificationViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
// 分类首页

#import <UIKit/UIKit.h>

@interface ClassificationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *mainTable;         //分类表
    NSMutableArray *mainArr;        //分类表数据
}
-(void)layouMyTable;
@end
