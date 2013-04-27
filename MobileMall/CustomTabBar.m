//
//  CustomTabBar.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "CustomTabBar.h"

#import "AppDelegate.h"
#import "JSBadgeView.h"

@implementation CustomTabBar

@synthesize currentSelectedIndex;
@synthesize buttons;
@synthesize ishidden;
@synthesize tempView;
@synthesize BgScrollView;

@synthesize imgView;
@synthesize slideBg;

- (void)viewDidAppear:(BOOL)animated{
    
}

-(void)viewDidLoad{
    
    slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TabBar_press.png"]];
    
    [self hideRealTabBar];

    [super viewDidLoad];
}

//隐藏
- (void)hide{
    
    self.tempView.hidden=YES;
    //[self hideRealTabBar];
    
}

//展示
- (void)show{
    self.tempView.hidden=NO;
}

- (void)hideRealTabBar{
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.hidden = YES;
			break;
		}
	}
}

//隐藏系统的tabBar
- (void)hideExistingTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

//-(void)hideRealTabBar:(CustomTabBar *)object{
//
//}
- (void)tabBarController:(CustomTabBar *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //int index=tabBarController.
}

//构建自己的tabBar
- (void)customTabBar{
	
    //	UIView *tabBarBackGroundView = [[UIView alloc] initWithFrame:self.tabBar.frame];
    //	tabBarBackGroundView.backgroundColor = [UIColor grayColor];
	
    tempView=[[UIView alloc] initWithFrame:CGRectMake(0, MY_HEIGHT-54, 320, 54)];
	imgView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"TabBar_BG.png"]];
    imgView.frame=CGRectMake(0, 0, 384, 54);
    [tempView addSubview:imgView];
    [imgView release];
    
    BgScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 54)];
    BgScrollView.delegate=self;
    //BgScrollView.clipsToBounds = YES;
	BgScrollView.scrollEnabled = YES;
    //BgScrollView.pagingEnabled =YES;
    BgScrollView.contentSize=CGSizeMake(384, 54);
    BgScrollView.bounces=NO;
    BgScrollView.showsHorizontalScrollIndicator=NO;
    BgScrollView.showsVerticalScrollIndicator=NO;
    BgScrollView.backgroundColor=[UIColor clearColor];
    
    [tempView addSubview:BgScrollView];
    
    leftArrow=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TabBar_left.png"]];
    rightArrow=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TabBar_right.png"]];
    
    leftArrow.frame=CGRectMake(3, 25, 3.5, 6.5);
    rightArrow.frame=CGRectMake(313.5, 25, 3.5, 6.5);
    
    leftArrow.hidden=YES;
    
    [tempView addSubview:leftArrow];
    [tempView addSubview:rightArrow];
    
    slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TabBar_press.png"]];
    slideBg.frame = CGRectMake(0, 0, 64, 54);
    [BgScrollView addSubview:slideBg];
    NSMutableArray *tempButtons = [[NSMutableArray alloc] init];
	for (int i = 0; i < 6; i++) {
        //  UIViewController *v = [self.viewControllers objectAtIndex:i];
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        double _width = 320 / 5;
        double _height = self.tabBar.frame.size.height;
		btn.frame = CGRectMake(i*_width,4, _width, _height);
        
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar_%d_normal.png",i]] forState:UIControlStateNormal];
		[btn addTarget:self action:@selector(slideTabBg:) forControlEvents:UIControlEventTouchUpInside];
        
        
		[BgScrollView  addSubview:btn];
        [tempButtons addObject:btn];
		
	}
    
    self.buttons=tempButtons;
    [tempButtons release];
	[self slideTabBg:[self.buttons objectAtIndex:0]];
    [self.view addSubview:tempView];
    
}

//箭头滑动动画的实现
- (void)slideTabBg:(UIButton *)btn{
    
    UIButton *lastBtn = [self.buttons objectAtIndex:self.currentSelectedIndex];
    [lastBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar_%d_normal.png",self.currentSelectedIndex]] forState:UIControlStateNormal];
    //NSLog(@"lastSelectIndex is========%d",self.currentSelectedIndex);
    
	self.currentSelectedIndex = btn.tag;
	self.selectedIndex = self.currentSelectedIndex;
    //NSLog(@"currentSelectedIndex is======%d",self.currentSelectedIndex);
    
    UIButton *curBtn = [self.buttons objectAtIndex:self.currentSelectedIndex];
    [curBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar_%d_press.png",self.currentSelectedIndex]] forState:UIControlStateNormal];
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.20];
	[UIView setAnimationDelegate:self];
	slideBg.frame = CGRectMake(btn.frame.origin.x, 0.0, 64, 54);
	[UIView commitAnimations];
    
    if (btn.tag==3) {
        if ([btn.subviews count]>=2) {
            JSBadgeView *tempBadge=[btn.subviews objectAtIndex:1];
            [tempBadge removeFromSuperview];
        }
        
    }
}

#pragma mark UIScrollViewDelegate

//tabBar滑动触发方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float xOffset=scrollView.contentOffset.x;
    //NSLog(@"------------>%f",xOffset);
    if (scrollView == BgScrollView) {
        if (xOffset==0) {
            //NSLog(@"隐藏左边");
            leftArrow.hidden=YES;
            rightArrow.hidden=NO;
        }else if(xOffset==64){
            rightArrow.hidden=YES;
            leftArrow.hidden=NO;
        }
        else{
            //NSLog(@"隐藏右边");
            rightArrow.hidden=NO;
            leftArrow.hidden=NO;
        }
    }
}


- (void) dealloc{
	[slideBg release];
	[buttons release];
    [BgScrollView release];
    [leftArrow release];
    [rightArrow release];
    //   [tempView release];
	[super dealloc];
}


@end

