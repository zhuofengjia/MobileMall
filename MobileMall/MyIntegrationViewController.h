//
//  myIntegrationViewController.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-9.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyIntegrationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *scoreTable;
    UITableView *historyTable;
    
    BOOL isShowHistory;
    int score;
    NSMutableArray *scoreArr;
    NSMutableArray *dateArr;
}

@end
