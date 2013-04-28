//
//  AppDelegate.m
//  SoftBestWine
//
//  Created by Chenyuanfang on 13-4-8.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ClassificationViewController.h"
#import "ShoppingCartViewController.h"
#import "MeCenterViewController.h"
#import "MoreViewController.h"
#import "LoginViewController.h"
#import "UINavigationBar+Customized.h"
#import "JSBadgeView.h"

#define kNumBadges 100

#define kViewBackgroundColor [UIColor colorWithRed:0.357 green:0.757 blue:0.357 alpha:1]

#define kSquareSideLength 64.0f
#define kSquareCornerRadius 10.0f
#define kMarginBetweenSquares 10.0f
#define kSquareColor [UIColor colorWithRed:0.004 green:0.349 blue:0.616 alpha:1]


@implementation AppDelegate
@synthesize myTabBar;
@synthesize myFilter;
@synthesize loginNav;

- (void)dealloc
{
    [_window release];
    [myTabBar release];
    [myFilter release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque];        //设置手机上面的信号电量条为黑色
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self layoutTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark TabBarController

-(void)layoutTabBarController{
    HomeViewController *homeVC=[[HomeViewController alloc]init];
    SearchViewController *seachVC=[[SearchViewController alloc]init];
    ClassificationViewController *classVC=[[ClassificationViewController alloc]init];
    ShoppingCartViewController *shoppingVC=[[ShoppingCartViewController alloc]init];
    MeCenterViewController *selfVC=[[MeCenterViewController alloc]init];
    MoreViewController *myMoreVC=[[MoreViewController alloc]init];
    
    classVC.title=@"分类";
    shoppingVC.title=@"购物车";
    selfVC.title=@"个人中心";
    myMoreVC.title=@"更多";
    
    homeVC.hidesBottomBarWhenPushed=true;
    seachVC.hidesBottomBarWhenPushed=true;
    classVC.hidesBottomBarWhenPushed=true;
    shoppingVC.hidesBottomBarWhenPushed=true;
    selfVC.hidesBottomBarWhenPushed=true;
    myMoreVC.hidesBottomBarWhenPushed=true;
    
    UINavigationController *nav0=[[UINavigationController alloc]initWithRootViewController:homeVC];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:seachVC];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:classVC];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:shoppingVC];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:selfVC];
    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:myMoreVC];
    
//-------------------测试代码--------------------//
    
//    UINavigationController *nav44=[[UINavigationController alloc]initWithRootViewController:selfVC];
//    myMenuControl=[[DDMenuController alloc]initWithRootViewController:nav44];
//    
//    TestTestViewController *myTest=[[TestTestViewController alloc]init];
//    myMenuControl.rightViewController=myTest;
//    
//    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:myMenuControl];
    
//-------------------测试代码--------------------//    
    
    [homeVC release];
    [seachVC release];
    [classVC release];
    [shoppingVC release];
    [selfVC release];
    [myMoreVC release];
    
    //NSArray *VCArr=[[NSArray alloc]initWithObjects:nav0,nav1,nav2,nav3,nav4,nav5, nil];
    NSMutableArray *VCArr=[[NSMutableArray alloc]initWithObjects:nav0,nav1,nav2,nav3,nav4,nav5,nil];
    
    myTabBar=[[CustomTabBar alloc]init];
    myTabBar.viewControllers=VCArr;
    
    for (int i=0; i<[VCArr count]; i++) {
        UINavigationController *na=(UINavigationController *)[VCArr objectAtIndex:i];
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
            [na.navigationBar loadNavigationBar];
        else
        {
            [na.navigationBar setImage:[UIImage imageNamed:@"allNav.png"]];
            //[na.navigationBar drawRect:CGRectMake(0, 0, 0, 0)];
        }

        //na.navigationBar.tintColor=[UIColor colorWithRed:201/255.0 green:1/255.0 blue:1/255.0 alpha:1.0];
        // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"sheetqd.png"] forBarMetrics:UIBarMetricsDefault];
    }
    
    [nav0 release];
    [nav1 release];
    [nav2 release];
    [nav3 release];
    [nav4 release];
    [nav5 release];
    
    [VCArr release];
    
    myTabBar.delegate=self;
    myTabBar.selectedIndex=0;
    [myTabBar hideRealTabBar];
    [myTabBar customTabBar];
    
    
    
    myFilter=[[FilterViewController alloc]init];
    myFilter.view.frame=CGRectMake(320-myFilter.view.frame.size.width,
                                        0,
                                        self.myFilter.view.frame.size.width,
                                        self.myFilter.view.frame.size.height);
    [self.window addSubview:self.myFilter.view];
    [myFilter setVisible:NO];
    [self.window addSubview:myTabBar.view];
    
    //[self addBadgeOnTabBar:3];
}

- (void)makeRightViewVisible {
    [self.myFilter setVisible:YES];
}

-(void)makeRightViewUnVisible{
    [self.myFilter setVisible:NO];
}

-(void)addBadgeOnTabBar:(int)badges{
    UIButton *tempBut=(UIButton *)[myTabBar.buttons objectAtIndex:3];
    
    JSBadgeView *oldbadgeView=(JSBadgeView *)[tempBut viewWithTag:10086];
    if (oldbadgeView) {
        [oldbadgeView removeFromSuperview];
    }
    
    CGFloat viewWidth = self.window.frame.size.width;
    
    NSUInteger numberOfSquaresPerRow = floor(viewWidth / (kSquareSideLength + kMarginBetweenSquares));
    const CGFloat kInitialXOffset = (viewWidth - (numberOfSquaresPerRow * kSquareSideLength)) / (float)numberOfSquaresPerRow;
    CGFloat xOffset = kInitialXOffset;
    
    const CGFloat kInitialYOffset = kInitialXOffset;
    CGFloat yOffset = kInitialYOffset;
    
    CGRect rectangleBounds = CGRectMake(0.0f,
                                        0.0f,
                                        kSquareSideLength,
                                        kSquareSideLength);
    
    CGPathRef rectangleShadowPath = [UIBezierPath bezierPathWithRoundedRect:rectangleBounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(kSquareCornerRadius, kSquareCornerRadius)].CGPath;
    UIView *rectangle = [[UIView alloc] initWithFrame:CGRectIntegral(CGRectMake(xOffset,
                                                                                yOffset,
                                                                                rectangleBounds.size.width,
                                                                                rectangleBounds.size.height))];
    rectangle.backgroundColor = kSquareColor;
    rectangle.layer.cornerRadius = kSquareCornerRadius;
    rectangle.layer.shadowColor = [UIColor blackColor].CGColor;
    rectangle.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    rectangle.layer.shadowOpacity = 0.4;
    rectangle.layer.shadowRadius = 1.0;
    rectangle.layer.shadowPath = rectangleShadowPath;
    
    
    JSBadgeView *badgeView = [[JSBadgeView alloc] initWithParentView:rectangle alignment:JSBadgeViewAlignmentTopRight];
    badgeView.tag=10086;
    //badgeView.badgeText = [NSString stringWithFormat:@"%d", shoppingNum];
    
    shoppingNum=shoppingNum+badges;
    badgeView.badgeText=[NSString stringWithFormat:@"%d", shoppingNum];
    
    //UIButton *tempBut=(UIButton *)[myTabBar.buttons objectAtIndex:3];
    [tempBut addSubview:badgeView];
    [badgeView release];
    TT_RELEASE_SAFELY(rectangle);
    
}

#pragma mark LoginVCController
-(void)addLoginViewController{
    if (!loginNav) {
        LoginViewController *myLogin=[[LoginViewController alloc]init];
        loginNav=[[UINavigationController alloc]initWithRootViewController:myLogin];
        [myLogin release];
    }
    [loginNav popViewControllerAnimated:YES];
    //[myTabBar presentModalViewController:loginNav animated:YES];
    [myTabBar presentViewController:loginNav animated:YES completion:nil];
}

-(BOOL)checkIfLogin{
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
