//
//  FilterViewController.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  筛选界面

#import <UIKit/UIKit.h>

@protocol FilterDelegate;



@interface FilterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UIView *secondFilerView;
    NSMutableArray *selectArr;
}

@property(nonatomic,retain)NSMutableArray *filterArr;
@property(nonatomic,retain)NSMutableArray *fixedArr;
@property(nonatomic,assign)id<FilterDelegate>delegate;

- (void)layoutMyTable; 
- (void)setVisible:(BOOL)visible;          //隐藏自身（在入口类中被调用）
- (void)addMySecondFilterView;        //构建筛选的二级确定页面

@end

@protocol FilterDelegate <NSObject>

@optional

-(void)setMyFilterStr:(NSString *)filterStr;   //调用产品列表页（ProductListViewController）内的页面回滚方法并传值

@end
