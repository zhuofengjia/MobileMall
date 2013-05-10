//
//  OrdersObject.h
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-10.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrdersObject : NSObject

@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *price;
@end
