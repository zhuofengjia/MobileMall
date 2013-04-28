//
//  ClassificationViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ClassificationViewController.h"
#import "SecondCategoryViewController.h"

@interface ClassificationViewController ()

@end

@implementation ClassificationViewController

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
    //self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    mainArr=[[NSMutableArray alloc]initWithObjects:@"产地",@"类型",@"价格", nil];
    
    [self layouMyTable];
	// Do any additional setup after loading the view.
}

-(void)layouMyTable{
    mainTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-44-52-20) style:UITableViewStylePlain];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    //mainTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTable];
    [self setExtraCellLineHidden:mainTable];
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
    UIImageView *iconView;
    UILabel *mainLab;
    UIImageView *arrowIcon;
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
        arrowIcon.frame=CGRectMake(295, 16, 7, 11);
        [cell.contentView addSubview:arrowIcon];
        [arrowIcon release];
    }else{
        iconView=(UIImageView *)[cell.contentView viewWithTag:101];
        mainLab=(UILabel *)[cell.contentView viewWithTag:102];
    }
    
    iconView.image=[UIImage imageNamed:[NSString stringWithFormat:@"Classification%d",indexPath.row]];
    mainLab.text=[mainArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondCategoryViewController *myCate=[[SecondCategoryViewController alloc]init];
    myCate.title=[mainArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:myCate animated:YES];
    [myCate release];
}



-(void)viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBar.hidden=YES;
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BGwhite.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_presswhite.png"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(mainTable);
    TT_RELEASE_SAFELY(mainArr);
    [super dealloc];
}

@end
