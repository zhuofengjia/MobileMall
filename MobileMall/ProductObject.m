//
//  ProductObject.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-19.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ProductObject.h"

@implementation ProductObject
@synthesize uid,imageUrl,name,price,sales,introduction;

-(void)dealloc{
    TT_RELEASE_SAFELY(uid);
    TT_RELEASE_SAFELY(imageUrl);
    TT_RELEASE_SAFELY(name);
    TT_RELEASE_SAFELY(price);
    TT_RELEASE_SAFELY(sales);
    TT_RELEASE_SAFELY(introduction);
    [super dealloc];
}
@end
