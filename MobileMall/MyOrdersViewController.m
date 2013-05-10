//
//  myOrdersViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-9.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import "MyOrdersViewController.h"
#import "UIColumnViewCell.h"
#import "orderListViewController.h"

@interface MyOrdersViewController ()

@end

@implementation MyOrdersViewController

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
    self.title=@"我的订单";
    imgArr=[[NSMutableArray alloc]initWithObjects:@"ad11.png",@"ad12.png",@"ad13.png",@"ad14.png",@"ad15.png", nil];
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    [self layoutMyNavView];
    [self layoutMyMainView];
	// Do any additional setup after loading the view.
}

-(void)layoutMyNavView{
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)layoutMyMainView{
    ordersTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 205) style:UITableViewStyleGrouped];
    ordersTable.delegate=self;
    ordersTable.dataSource=self;
    ordersTable.backgroundView.alpha=0.0f;
    ordersTable.scrollEnabled=NO;
    [self.view addSubview:ordersTable];
    
    historyTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 205, 320, 60) style:UITableViewStyleGrouped];
    historyTable.delegate=self;
    historyTable.dataSource=self;
    historyTable.backgroundView.alpha=0.0f;
    historyTable.scrollEnabled=NO;
    [self.view addSubview:historyTable];
    
    UIImageView *myInterestingIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeShowIcon.png"]];
    myInterestingIcon.frame=CGRectMake(5, 270, 16, 20);
    [self.view addSubview:myInterestingIcon];
    [myInterestingIcon release];
    
    UILabel *myInterestingLab=[[UILabel alloc]initWithFrame:CGRectMake(26, 273, 150, 16)];
    myInterestingLab.backgroundColor=[UIColor clearColor];
    myInterestingLab.font=[UIFont systemFontOfSize:15];
    myInterestingLab.textColor=[UIColor colorWithRed:210.0/255.0 green:5.0/255.0 blue:6.0/255.0 alpha:1.0];
    myInterestingLab.text=@"您可能感兴趣的";
    [self.view addSubview:myInterestingLab];
    [myInterestingLab release];
    
    interestingTbaleView=[[UIColumnView alloc]initWithFrame:CGRectMake(0, 295, 320, 130)];
    interestingTbaleView.viewDelegate=self;
    interestingTbaleView.viewDataSource=self;
    interestingTbaleView.backgroundColor=[UIColor clearColor];
    interestingTbaleView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:interestingTbaleView];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==ordersTable) {
        return 4;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==ordersTable) {
        UILabel *titleLab;
        UILabel *numberLab;
        UILabel *unitLab;
        static NSString *CellIdentifier = @"ordersCellIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            titleLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 14, 120, 20)];
            titleLab.tag=901;
            titleLab.backgroundColor=[UIColor clearColor];
            titleLab.font=[UIFont systemFontOfSize:18];
            [cell.contentView addSubview:titleLab];
            [titleLab release];
            
            numberLab=[[UILabel alloc]initWithFrame:CGRectMake(190, 14, 68, 20)];
            numberLab.tag=902;
            numberLab.backgroundColor=[UIColor clearColor];
            numberLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
            numberLab.textAlignment=NSTextAlignmentRight;
            numberLab.font=[UIFont systemFontOfSize:18];
            [cell.contentView addSubview:numberLab];
            [numberLab release];
            
            unitLab=[[UILabel alloc]initWithFrame:CGRectMake(258, 14, 20, 20)];
            unitLab.tag=903;
            unitLab.backgroundColor=[UIColor clearColor];
            unitLab.font=[UIFont systemFontOfSize:18];
            [cell.contentView addSubview:unitLab];
            [unitLab release];
            
            UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(283, 19, 7, 11)];
            arrow.image=[UIImage imageNamed:@"jiantou.png"];
            [cell.contentView addSubview:arrow];
            [arrow release];
            
        }else{
            titleLab=(UILabel *)[cell.contentView viewWithTag:901];
            numberLab=(UILabel *)[cell.contentView viewWithTag:902];
            unitLab=(UILabel *)[cell.contentView viewWithTag:903];
        }
        if (indexPath.row==0) {
            titleLab.text=@"等待付款订单";
            numberLab.text=@"2";
            unitLab.text=@"笔";
        }else if (indexPath.row==1){
            titleLab.text=@"待发货订单";
            numberLab.text=@"1";
            unitLab.text=@"笔";
        }else if (indexPath.row==2){
            titleLab.text=@"已发货订单";
            numberLab.text=@"2";
            unitLab.text=@"笔";
        }else{
            titleLab.text=@"等待评价商品";
            numberLab.text=@"0";
            unitLab.text=@"件";
        }
        return cell;
    }else{
        static NSString *CellIdentifier = @"historyCellIdentifier";
        UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 100, 20) Font:[UIFont systemFontOfSize:18] Text:@"历史订单" Color:[UIColor blackColor]];
        UILabel *numberLab=[ComponentsFactory drawLabelInView:cell.contentView Frame:CGRectMake(190, 14, 68, 20) Font:[UIFont systemFontOfSize:18] Text:@"60" Color:[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
        numberLab.textAlignment=NSTextAlignmentRight;
        
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(258, 14, 20, 20) Font:[UIFont systemFontOfSize:18] Text:@"笔" Color:[UIColor blackColor]];
        
        UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(283, 19, 7, 11)];
        arrow.image=[UIImage imageNamed:@"jiantou.png"];
        [cell.contentView addSubview:arrow];
        [arrow release];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListViewController *orderList=[[OrderListViewController alloc]init];
    switch (indexPath.row) {
        case 0:
        {
            orderList.title=@"等待付款订单";
        }
            break;
        case 1:
        {
            orderList.title=@"待发货订单";
        }
            break;
        case 2:
        {
            orderList.title=@"已发货订单";
        }
            break;
        case 3:
        {
            orderList.title=@"等待评价的商品";
        }
            break;
        default:
            break;
    }
    [self.navigationController  pushViewController:orderList animated:YES];
    [orderList release];
}

#pragma mark UIColumnViewDataSource method implementation

- (NSUInteger)numberOfColumnsInColumnView:(UIColumnView *)columnView{
    return 5;
}

- (UITableViewCell *)columnView:(UIColumnView *)columnView viewForColumnAtIndex:(NSUInteger)index{
    static NSString *cellIdentifier = @"startCell";
    UIColumnViewCell *cell = (UIColumnViewCell *)[columnView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UIColumnViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    cell.imageView.image=[UIImage imageNamed:[imgArr objectAtIndex:index]];
    return cell;
}



#pragma mark UIColumnViewDelegate

- (void)columnView:(UIColumnView *)columnView didSelectColumnAtIndex:(NSUInteger)index {
    NSLog(@"%s selected:%d", __FUNCTION__, index);
}

- (CGFloat)columnView:(UIColumnView *)columnView widthForColumnAtIndex:(NSUInteger)index {
    return 100.0f;
}

-(void)viewWillAppear:(BOOL)animated{
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app.myTabBar hide];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app.myTabBar show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(ordersTable);
    TT_RELEASE_SAFELY(historyTable);
    TT_RELEASE_SAFELY(interestingTbaleView);
    [super dealloc];
}

@end
