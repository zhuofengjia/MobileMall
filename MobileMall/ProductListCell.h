//
//  ProductListCell.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-19.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  产品列表页的一般单元格

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "ProductObject.h"

@interface ProductListCell : UITableViewCell{
    EGOImageView *proView;          //商品展示图片(异步加载)
    UILabel *nameLab;               //商品名称Label
    UILabel *priceLab;              //商品价格Label
    UILabel *salesLab;              //商品销量Label
}
-(void)updateCellWithmyProduct:(ProductObject *)aObj;             //加载单元格数据的方法

@end
