//
//  ProductDetailsViewController.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-2.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColumnView.h"

@interface ProductDetailsViewController : UIViewController<UIActionSheetDelegate,UIColumnViewDelegate,UIColumnViewDataSource,UITableViewDelegate,UITableViewDataSource>{
    UIColumnView *imgView;
    NSMutableArray *imgArr;
    BOOL isPromotions;       //商品是否促销
    int myScore;     //商品的评分
}
-(void)layoutMyNav;
-(void)layoutMyImageScrollView;
-(void)layoutmyDetailView;
-(void)layoutMyGoToCollectView;

@end
