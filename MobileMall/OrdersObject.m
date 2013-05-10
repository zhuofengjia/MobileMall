//
//  OrdersObject.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-10.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import "OrdersObject.h"

@implementation OrdersObject
@synthesize uid,date,status,price;

-(void)dealloc{
    TT_RELEASE_SAFELY(uid);
    TT_RELEASE_SAFELY(date);
    TT_RELEASE_SAFELY(status);
    TT_RELEASE_SAFELY(price);
    [super dealloc];
}
@end
