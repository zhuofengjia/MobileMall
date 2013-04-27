//
//  MeCenterViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "MeCenterViewController.h"

//#import "TestMyNavViewController.h"
//#import "TestTestViewController.h"
#import "EGOImageView.h"

@interface MeCenterViewController ()

@end

@implementation MeCenterViewController

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
    
    mainArr=[[NSMutableArray alloc]initWithObjects:@"我的订单",@"我的积分",@"我的评价",@"收藏夹",@"修改资料", nil];
    
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    [self layoutMyReplaceNav];
    [self layoutMyTopView];
    [self layoutMyMainTableView];
}

//-(void)testMyNav{
//    TestMyNavViewController *mytest=[[TestMyNavViewController alloc]init];
//    TestTestViewController *test2=[[TestTestViewController alloc]init];
//    DDMenuController *myMenuVc=[[DDMenuController alloc]initWithRootViewController:mytest];
//    myMenuVc.rightViewController=test2;
//    [self.navigationController pushViewController:myMenuVc animated:NO];
//}

-(void)layoutMyReplaceNav{
    UIImageView *bgNavView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"allNav.png"]];
    bgNavView.frame=CGRectMake(0, 0, 320, 48);
    [self.view addSubview:bgNavView];
    [bgNavView release];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 10, 120, 24)];
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.font=[UIFont boldSystemFontOfSize:20.0f];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textColor=[UIColor whiteColor];
    titleLab.shadowColor=[UIColor blackColor];
    titleLab.shadowOffset=CGSizeMake(0.5f, -0.5f);
    titleLab.text=@"个人中心";
    [self.view addSubview:titleLab];
    [titleLab release];
    
    UIButton *canceledBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"注销" frame:CGRectMake(270, 7, 42, 30) imageName:@"allRight.png" tappedImageName:@"allRight.png" target:self action:@selector(cancelMySelf) tag:101];
    
    [self.view addSubview:canceledBtn];
}

-(void)layoutMyTopView{
    UIView *headBgView=[[UIView alloc]initWithFrame:CGRectMake(15, 58, 64, 64)];
    headBgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:headBgView];
    [headBgView release];
    
    EGOImageView *headView=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"MeChenterHead.png"]];
    headView.tag=701;
    headView.frame=CGRectMake(17, 60, 60, 60);
    [self.view addSubview:headView];
    [headView release];
    
    [ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(90, 68, 55, 20) Font:[UIFont systemFontOfSize:14] Text:@"用户名:" Color:[UIColor blackColor]];
    
    [ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(90, 95, 90, 20) Font:[UIFont systemFontOfSize:14] Text:@"会员等级:" Color:[UIColor blackColor]];
    
    UILabel *mynameLab=[ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(145, 68, 160, 20) Font:[UIFont systemFontOfSize:14] Text:@"" Color:[UIColor blackColor]];
    mynameLab.tag=702;
    
    UILabel *mygradeLab=[ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(158, 95, 160, 20) Font:[UIFont systemFontOfSize:14] Text:@"" Color:[UIColor blackColor]];
    mynameLab.tag=703;
    
    mynameLab.text=@"angel";
    mygradeLab.text=@"非认证会员";
}


-(void)layoutMyMainTableView{
    UITableView *myTable=[[UITableView alloc]initWithFrame:CGRectMake(5, 130, 310, 44*5+15) style:UITableViewStyleGrouped];
    myTable.backgroundView.alpha=0.0f;
    myTable.scrollEnabled=NO;
    myTable.delegate=self;
    myTable.dataSource=self;
    [self.view addSubview:myTable];
    [myTable release];
}

-(void)cancelMySelf{
    UIAlertView *cancelAlert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"您确定要注销?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [cancelAlert show];
}

#pragma mark UITableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mainArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImageView *iconView;
    UILabel *mainLab;
    UIImageView *arrowIcon;
    //UIView *lineView;
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        iconView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 11, 22, 22)];
        iconView.tag=101;
        [cell.contentView addSubview:iconView];
        [iconView release];
        
        mainLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 10, 150, 22)];
        mainLab.tag=102;
        mainLab.backgroundColor=[UIColor clearColor];
        mainLab.textAlignment=NSTextAlignmentLeft;
        [cell.contentView addSubview:mainLab];
        [mainLab release];
        
        arrowIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jiantou.png"]];
        arrowIcon.frame=CGRectMake(268, 16, 7, 11);
        [cell.contentView addSubview:arrowIcon];
        [arrowIcon release];
        
    }else{
        iconView=(UIImageView *)[cell.contentView viewWithTag:101];
        mainLab=(UILabel *)[cell.contentView viewWithTag:102];
    }
    
    iconView.image=[UIImage imageNamed:[NSString stringWithFormat:@"MeCenter%d",indexPath.row]];
    mainLab.text=[mainArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark end

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BG.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_press.png"];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(mainArr);
    [super dealloc];
}

@end
