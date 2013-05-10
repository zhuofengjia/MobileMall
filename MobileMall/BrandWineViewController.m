//
//  BrandWineViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-2.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "BrandWineViewController.h"

@interface BrandWineViewController ()

@end

@implementation BrandWineViewController

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
    self.title=@"名酒品牌";
    [super viewDidLoad];
    [self layoutMyNavView];
    [self layoutMySelectView];
	// Do any additional setup after loading the view.
}

-(void)layoutMyNavView{
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
}

-(void)layoutMySelectView{
    UIImageView *selectBgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchSelectBg.png"]];
    selectBgView.frame=CGRectMake(0, 0, 320, 35);
    [self.view addSubview:selectBgView];
    [selectBgView release];
    
    UIButton *selectBtn1=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 5, 64, 39) IconName:@"searchHistory.png" Target:self Action:@selector(doMySelect:) ButtonTag:501 TitleString:@"白酒" StringFont:14 IsBold:NO Color:[UIColor redColor]];
    [self.view addSubview:selectBtn1];
    
    UIButton *selectBtn2=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(64, 5, 64, 39) IconName:@"" Target:self Action:@selector(doMySelect:) ButtonTag:502 TitleString:@"葡萄酒" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn2];
    
    UIButton *selectBtn3=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(128, 5, 64, 39) IconName:@"" Target:self Action:@selector(doMySelect:) ButtonTag:503 TitleString:@"进口烈酒" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn3];
    
    UIButton *selectBtn4=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(192, 5, 64, 39) IconName:@"" Target:self Action:@selector(doMySelect:) ButtonTag:504 TitleString:@"黄酒" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn4];
    
    UIButton *selectBtn5=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(256, 5, 64, 39) IconName:@"" Target:self Action:@selector(doMySelect:) ButtonTag:505 TitleString:@"饮料" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn5];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doMySelect:(id)sender{
    UIButton *myBtn=(UIButton *)sender;
    for (int i=501; i<506; i++) {
        UIButton *aBtn=(UIButton *)[self.view viewWithTag:i];
        [aBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        UILabel *aLab=(UILabel *)[aBtn viewWithTag:i+100];
        aLab.textColor=[UIColor blackColor];
    }
    
    switch (myBtn.tag) {
        case 501:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:601];
            aLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        }
            break;
        case 502:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:602];
            aLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        }
            break;
        case 503:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:603];
            aLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        }
            break;
        case 504:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:604];
            aLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        }
        case 505:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:605];
            aLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        }
            break;
        default:
            break;
    }
}


-(void)viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBar.hidden=NO;
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app.myTabBar hide];
}

-(void)viewWillDisappear:(BOOL)animated{
    //self.navigationController.navigationBar.hidden=NO;
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app.myTabBar show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
