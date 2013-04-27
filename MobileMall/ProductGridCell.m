//
//  PorductGridCell.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-19.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ProductGridCell.h"
#import "ProductObject.h"

@implementation ProductGridCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        float imageX=10.0f;
        float imageY=5.0f;
        
        for (int i=0; i<2; i++) {
            ProductBgView[i]=[[UIView alloc]initWithFrame:CGRectMake(imageX-1, imageY-1, 147, 147)];
            ProductBgView[i].backgroundColor=[UIColor lightGrayColor];
            [self.contentView addSubview:ProductBgView[i]];
            
            productView[i]=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"homeWaitSmall.png"]];
            productView[i].frame=CGRectMake(imageX, imageY, 145, 145);
            [self.contentView addSubview:productView[i]];
            
            priceLab[i]=[[UILabel alloc]initWithFrame:CGRectMake(imageX+5, imageY+150, 80, 20)];
            priceLab[i].backgroundColor=[UIColor clearColor];
            priceLab[i].textColor=[UIColor redColor];
            priceLab[i].font=[UIFont systemFontOfSize:18];
            [self.contentView addSubview:priceLab[i]];
            
            salesLab[i]=[[UILabel alloc]initWithFrame:CGRectMake(imageX+90, imageY+153, 60, 18)];
            salesLab[i].backgroundColor=[UIColor clearColor];
            salesLab[i].textColor=[UIColor grayColor];
            salesLab[i].font=[UIFont systemFontOfSize:14];
            [self.contentView addSubview:salesLab[i]];
            
            UIButton *temBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            temBtn.backgroundColor=[UIColor clearColor];
            temBtn.tag=i;
            temBtn.frame=CGRectMake(imageX, imageY, 145, 170);
            [temBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:temBtn];
            
            imageX=imageX+155;
        }
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
        for (int i = 0; i < 2; i++) {
            [productView[i] cancelImageLoad];        //取消图片加载
        }
        
	}
}

-(void)updateCellWithArray:(NSArray*)aArr withIndexPath:(NSIndexPath *)indexPath{
    self.mIndexPath = indexPath;
    nMaxIndex=[aArr count]-1;
    for (int i=0; i<[aArr count]; i++) {
        ProductBgView[i].hidden=NO;
        productView[i].hidden=NO;
        priceLab[i].hidden=NO;
        salesLab[i].hidden=NO;
        
        ProductObject *proObj=(ProductObject *)[aArr objectAtIndex:i];
        productView[i].image=[UIImage imageNamed:proObj.imageUrl];
        priceLab[i].text=proObj.price;
        salesLab[i].text=proObj.sales;
        
    }
    for (int i = [aArr count]; i < 2; i++) {             //让最后多出来的一个没有数据的方格隐藏
        ProductBgView[i].hidden=YES;
        productView[i].hidden = YES;
        priceLab[i].hidden = YES;
        salesLab[i].hidden = YES;
    }
}

-(void) buttonAction:(id)sender{
    UIButton *tBtn = (UIButton *)sender;
    int tag = tBtn.tag;
    
    NSLog(@"%d",tag);
    if(tag <= nMaxIndex  && [self.delegate respondsToSelector:@selector(toucCellhWithIndex:withIndexPath:)]) {
        [self.delegate toucCellhWithIndex:tag withIndexPath:self.mIndexPath];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc{
    for (int i=0; i<2; i++) {
        TT_RELEASE_SAFELY(ProductBgView[i]);
        TT_RELEASE_SAFELY(productView[i]);
        TT_RELEASE_SAFELY(priceLab[i]);
        TT_RELEASE_SAFELY(salesLab[i]);
    }
    [super dealloc];
}

@end
