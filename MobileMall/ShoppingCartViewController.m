//
//  ShoppingCartViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ShoppingCartViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
	// Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BG.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_press.png"];
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
