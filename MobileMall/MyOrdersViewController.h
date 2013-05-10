//
//  myOrdersViewController.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-9.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColumnView.h"

@interface MyOrdersViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIColumnViewDelegate,UIColumnViewDataSource>{
    UITableView *ordersTable;
    UITableView *historyTable;
    UIColumnView *interestingTbaleView;
    
    NSMutableArray *imgArr;
}

@end
