//
//  SecondCategoryViewController.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "SecondCategoryViewController.h"
#import "ProductListViewController.h"

@interface SecondCategoryViewController ()

@end

@implementation SecondCategoryViewController

@synthesize mainArr;

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
    mainArr=[[NSMutableArray alloc]initWithObjects:@"白酒",@"红酒",@"洋酒",@"啤酒",@"黄酒",nil];
    [self layoutMyNav];
    [self layoutMyMainTable];
	// Do any additional setup after loading the view.
}

-(void)layoutMyNav{
//    UIButton *leftBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"返回" frame:CGRectMake(0, 0, 45, 29) imageName:@"allLeft.png" tappedImageName:@"" target:self action:@selector(goBack) tag:0];
    
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)layoutMyMainTable{
    UITableView *mainTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-44-54-20)];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    [self.view addSubview:mainTable];
    [self setExtraCellLineHidden:mainTable];
    
    [mainTable release];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mainArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *nameLab;
    UIImageView *arrowIcon;
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        nameLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 10, 150, 22)];
        nameLab.tag=101;
        nameLab.backgroundColor=[UIColor clearColor];
        nameLab.textAlignment=NSTextAlignmentLeft;
        [cell.contentView addSubview:nameLab];
        [nameLab release];
        
        arrowIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jiantou.png"]];
        arrowIcon.frame=CGRectMake(295, 16, 7, 11);
        [cell.contentView addSubview:arrowIcon];
        [arrowIcon release];
    }else{
        nameLab=(UILabel *)[cell.contentView viewWithTag:101];
    }
    nameLab.text=[mainArr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *app=(AppDelegate *)[[UIApplication  sharedApplication]delegate];
    
    ProductListViewController *myList=[[ProductListViewController alloc]init];
    
    app.myFilter.delegate=myList;    //实现筛选类的协议
    [self.navigationController pushViewController:myList animated:YES];
    [myList release];
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

-(void)dealloc{
    TT_RELEASE_SAFELY(mainArr);
    [super dealloc];
}

@end
