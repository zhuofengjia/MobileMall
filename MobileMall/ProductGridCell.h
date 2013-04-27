//
//  PorductGridCell.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-19.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  产品列表页的的横格cell

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@protocol GridDelegate;

@interface ProductGridCell : UITableViewCell{
    UIView *ProductBgView[2];                   //背景图片数组
    EGOImageView *productView[2];                  //商品展示图片数组
    UILabel *priceLab[2];                     //价格Label数组
    UILabel *salesLab[2];                     //销量Label数组
    int nMaxIndex;                 
}

@property(nonatomic,assign)id<GridDelegate> delegate;
@property(retain)NSIndexPath *mIndexPath;
-(void)updateCellWithArray:(NSArray*)aArr withIndexPath:(NSIndexPath *)indexPath;        //加载单元格数据的方法
@end

@protocol GridDelegate <NSObject>

@optional
-(void)toucCellhWithIndex:(int)aIndex withIndexPath:(NSIndexPath *)indexPath;    //代替原来的单元格点击触发的方法

@end