//
//  ComponentsFactory.h
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-11.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

//项目中各种处理方法（公用）
#import <Foundation/Foundation.h>

@interface ComponentsFactory : NSObject

+ (UIButton *)buttonWithType:(UIButtonType)type
                       title:(NSString *)title
                       frame:(CGRect)frame
                   imageName:(NSString *)imageName
             tappedImageName:(NSString *)tappedImageName
                      target:(id)target
                      action:(SEL)selector
                         tag:(NSInteger)tag;     //自定义创建按钮


+ (UILabel *)drawLabelInView:(UIView *)mainView Frame:(CGRect)frame Font:(UIFont *)font Text:(NSString *)text Color:(UIColor *)color;    //自定义创建UILabel
+ (void)drawMyLabelInView:(UIView *)mainView Frame:(CGRect)frame Font:(UIFont *)font Text:(NSString *)text Color:(UIColor *)color;    //自定义创建UILabel
+ (UIButton *)drawStringInMyButtonWithFrame:(CGRect)frame IconName:(NSString *)name Target:(id)target Action:(SEL)action ButtonTag:(NSInteger)buttonTag
                          TitleString:(NSString *)titleStr StringFont:(NSInteger)stringFont IsBold:(BOOL)isBold Color:(UIColor *)aColor;    //自定义按钮

+ (UIButton *)drawSelectStringInMyButtonWithFrame:(CGRect)frame IconName:(NSString *)name Target:(id)target Action:(SEL)action ButtonTag:(NSInteger)buttonTag
                                TitleString:(NSString *)titleStr StringFont:(NSInteger)stringFont IsBold:(BOOL)isBold Color:(UIColor *)aColor;    //自定义按钮，用于商品列表页的排序按钮

+ (UIColor*) createColorByHex:(NSString *)hexColor;     
@end