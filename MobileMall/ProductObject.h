//
//  ProductObject.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-19.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  商品类，包含商品的id，名字，销量，价格，介绍，数量（以后根据需求扩充属性）

#import <Foundation/Foundation.h>

@interface ProductObject : NSObject

@property(nonatomic,copy)NSString *uid;        //商品id
@property(nonatomic,copy)NSString *imageUrl;       //商品图片地址
@property(nonatomic,copy)NSString *name;        //商品名称
@property(nonatomic,assign)float price;       //商品价格
@property(nonatomic,assign)float discount;      //优惠金额
@property(nonatomic,copy)NSString *sales;       //商品销量
@property(nonatomic,copy)NSString *introduction;       //商品介绍
@property(nonatomic,assign)int number;      //商品数量

@end
