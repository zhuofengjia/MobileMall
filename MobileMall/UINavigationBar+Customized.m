//
//  HomeViewController.h
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "UINavigationBar+Customized.h"

static NSMutableDictionary *navigationBarImages = NULL;

@implementation UINavigationBar (Customized)

+ (void)initImageDictionary
{
    if(navigationBarImages==NULL){
        navigationBarImages=[[NSMutableDictionary alloc] init];
    }  
}

- (void)drawRect:(CGRect)rect
{
    NSString *imageName=[navigationBarImages objectForKey:[NSValue valueWithNonretainedObject: self]];
    if (imageName==nil) {
        imageName=@"allNav.png";
    }
    UIImage *image = [UIImage imageNamed: imageName];
    [image drawInRect:CGRectMake(0, 0, 320, 48)];
}

-(void)loadNavigationBar{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
        UIImage *bgImage=[UIImage imageNamed:@"allNav.png"];
        [[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
//        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:kNavigationBarRed/255.0 green:kNavigationBarGreen/255.0 blue:kNavigationBarBlack/255.0 alpha:1.0f]];
//        [[UISearchBar appearance]setBackgroundImage: [UIImage imageNamed: @"searchBar.png"]];
    }
} 



//Allow the setting of an image for the navigation bar
- (void)setImage:(UIImage*)image
{
    self.tintColor=[UIColor blueColor];
    [navigationBarImages setObject:image forKey:[NSValue valueWithNonretainedObject: self]];
}

@end
