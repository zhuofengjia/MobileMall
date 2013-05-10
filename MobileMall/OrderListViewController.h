//
//  orderListViewController.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-10.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *ordersArr;
}

@end
