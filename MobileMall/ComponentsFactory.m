//
//  ComponentsFactory.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-11.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ComponentsFactory.h"

@implementation ComponentsFactory

+ (UIButton *)buttonWithType:(UIButtonType)type
                       title:(NSString *)title
                       frame:(CGRect)frame
                   imageName:(NSString *)imageName
             tappedImageName:(NSString *)tappedImageName
                      target:(id)target
                      action:(SEL)selector
                         tag:(NSInteger)tag{
	UIButton *button = [UIButton buttonWithType:type];
	button.frame = frame;
	if( title!=nil && title.length>0 ){
		[button setTitle:title forState:UIControlStateNormal];
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		button.titleLabel.font = [UIFont boldSystemFontOfSize:12];
	}
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	button.tag = tag;
	if( imageName!=nil && ![imageName isEqualToString:@""]){
		[button setBackgroundImage:[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:0 topCapHeight:0] forState:UIControlStateNormal];
	}
	if( tappedImageName!=nil && ![tappedImageName isEqualToString:@""]){
		[button setBackgroundImage:[[UIImage imageNamed:tappedImageName] stretchableImageWithLeftCapWidth:0 topCapHeight:0] forState:UIControlStateHighlighted];
	}
	
	return button;
}

+ (UILabel *)drawLabelInView:(UIView *)mainView Frame:(CGRect)frame Font:(UIFont *)font Text:(NSString *)text Color:(UIColor *)color {
	UILabel *lb = [[[UILabel alloc] initWithFrame:frame] autorelease];
    lb.backgroundColor = [UIColor clearColor];
	lb.font = font;
	lb.text = text;
	lb.textColor = color;
    [mainView addSubview:lb];
	return lb;
}


+ (void)drawMyLabelInView:(UIView *)mainView Frame:(CGRect)frame Font:(UIFont *)font Text:(NSString *)text Color:(UIColor *)color {
	UILabel *lb = [[[UILabel alloc] initWithFrame:frame] autorelease];
    lb.backgroundColor = [UIColor clearColor];
	lb.font = font;
	lb.text = text;
	lb.textColor = color;
    [mainView addSubview:lb];
}

+ (UIButton *)drawStringInMyButtonWithFrame:(CGRect)frame IconName:(NSString *)name Target:(id)target Action:(SEL)action ButtonTag:(NSInteger)buttonTag
                 TitleString:(NSString *)titleStr StringFont:(NSInteger)stringFont IsBold:(BOOL)isBold Color:(UIColor *)aColor{
	UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lb=nil;
    if ([titleStr isEqualToString:@"返回"]) {
        lb = [self drawLabelInView:btn Frame:CGRectMake(5, 0, btn.frame.size.width-5, btn.frame.size.height) Font:(isBold?[UIFont boldSystemFontOfSize:stringFont]:[UIFont systemFontOfSize:stringFont]) Text:titleStr Color:[UIColor blackColor]];
    }else{
        lb = [self drawLabelInView:btn Frame:CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height) Font:(isBold?[UIFont boldSystemFontOfSize:stringFont]:[UIFont systemFontOfSize:stringFont]) Text:titleStr Color:[UIColor blackColor]];
    }
	
	lb.textAlignment = NSTextAlignmentCenter;
    lb.textColor=aColor;
	btn.tag=buttonTag;
    
    return btn;
}
+ (UIButton *)drawSelectStringInMyButtonWithFrame:(CGRect)frame IconName:(NSString *)name Target:(id)target Action:(SEL)action ButtonTag:(NSInteger)buttonTag
                                      TitleString:(NSString *)titleStr StringFont:(NSInteger)stringFont IsBold:(BOOL)isBold Color:(UIColor *)aColor{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lb=nil;
    
    UIImageView *arrowView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 12, 8, 6)];
    
    if (buttonTag==503) {
        arrowView.tag=703;
        arrowView.image=[UIImage imageNamed:@"arrowUp.png"];
    }else{
        arrowView.image=[UIImage imageNamed:@"arrowDown.png"];
    }
    [btn addSubview:arrowView];
    [arrowView release];
    
    lb = [self drawLabelInView:btn Frame:CGRectMake(10, 0, btn.frame.size.width-10, btn.frame.size.height) Font:(isBold?[UIFont boldSystemFontOfSize:stringFont]:[UIFont systemFontOfSize:stringFont]) Text:titleStr Color:[UIColor blackColor]];
    lb.tag=buttonTag+100;
	lb.textAlignment = NSTextAlignmentCenter;
    lb.textColor=aColor;
    
	btn.tag=buttonTag;
    
    
    
    return btn;
}

+ (UIColor*) createColorByHex:(NSString *)hexColor
{
    
    if (hexColor == nil) {
        return nil;
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}


@end
