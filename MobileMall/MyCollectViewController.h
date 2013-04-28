//
//  MyCollectViewController.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-4-28.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  收藏列表界面，首页点击我的收藏和个人中心点击收藏夹的时候弹出

#import <UIKit/UIKit.h>
#import "CMTableView.h"

@interface MyCollectViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * collectArr;        //保存收藏夹内的数据
    CMTableView *collectTable;        //自定义的TableView实现下拉刷新和上拉加载更多
}

-(void)layoutMyTableView;

@end
