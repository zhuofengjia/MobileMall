//
//  SecondCategoryViewController.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  分类二级页面

#import <UIKit/UIKit.h>

@interface SecondCategoryViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
}
@property(nonatomic,retain)NSMutableArray *mainArr;
-(void)layoutMyNav;
-(void)layoutMyMainTable;
@end
