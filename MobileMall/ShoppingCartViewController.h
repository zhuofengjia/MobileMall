//
//  ShoppingCartViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  购物车首页

#import <UIKit/UIKit.h>

@interface ShoppingCartViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *cartArr;
    UITableView *cartTable;
    UIButton *leftBtn;
    BOOL isEditing;
    int totalNumber;
    float totalDiscount;
    float totalPrice;
}
-(void)layoutMyNavView;
-(void)layoutMyNothingView;
-(void)layoutMyMainTableView;
@end
