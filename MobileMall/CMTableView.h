//
//  CMTableView.h
//  JIAYI
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright 2011年 softbest1. All rights reserved.
//  自己封装的下拉刷新的表

#import <Foundation/Foundation.h>
#import "EGORefreshTableHeaderView.h"


typedef enum {
	CELLTYPE_NORMAL = 10,
	CELLTYPE_GETMORE
}CELLTYPE;


@interface CMTableView : UITableView<EGORefreshTableHeaderDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    //EGO refresh
    EGORefreshTableHeaderView *_refreshHeaderView;    //引用的第三方类，用于表头的下拉刷新
    BOOL _reloading;
    
    //加载更多
    int currentPage;        //当前页码
    int totalPage;          //总页码
    CELLTYPE mCellType;        //单元格的类型（在实现上拉加载更多时候使用）
    
    //当前控制者
    id curTarget;
}
@property(assign)CELLTYPE mCellType;
@property(assign)BOOL _reloading;
@property(assign) id curTarget;


- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

-(void)setRefreshTableHeaderHidden:(BOOL)aHidden;



@end
