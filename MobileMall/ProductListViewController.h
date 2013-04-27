//
//  ProductListViewController.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  商品列表页

#import <UIKit/UIKit.h>
#import "ProductGridCell.h"
#import "ProductListCell.h"

typedef enum{
    Sequence_Sales=1,      //按照销量从高到底排序
    Sequence_New,         //按照时间从新到旧排序
    Sequence_PriceUp,        //按照价格从低到高排序
    Sequence_PriceDown,        //按照价格从高到低排序
    Sequence_Assess        //按照好评排序
}SequenceType;         //商品排序类别

@interface ProductListViewController : UIViewController<FilterDelegate,UITableViewDelegate,UITableViewDataSource,GridDelegate>{
    BOOL homeViewIsOutOfStage;
    SequenceType myType;
    NSMutableArray *ProArr;
}
-(void)layoutMyReplaceNavBar;    //自定义导航条
-(void)layoutMySequenceBtn;    //排序按钮区的UI处理
-(void)layoutMyTableView;
-(void)setMyFilterStr:(NSString *)filterStr;       //FilterDelegate回调方法，可以用来传递筛选相关的字段
@end
