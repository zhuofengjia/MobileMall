//
//  MoreViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "MoreViewController.h"
#import "SiteViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

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
    mainArr=[[NSMutableArray alloc]initWithObjects:@"设置",@"给我评分",@"发送建议",@"关于酒便利",@"联系我们",@"版本号", nil];
    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    [self layoutMyReplaceNav];
    [self layoutMyMainTableView];
	// Do any additional setup after loading the view.
}

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
    titleLab.text=@"更多";
    [self.view addSubview:titleLab];
    [titleLab release];
}

-(void)layoutMyMainTableView{
    UITableView *myTable=[[UITableView alloc]initWithFrame:CGRectMake(5, 50, 310, 44*56+15) style:UITableViewStyleGrouped];
    myTable.backgroundView.alpha=0.0f;
    myTable.scrollEnabled=NO;
    myTable.delegate=self;
    myTable.dataSource=self;
    [self.view addSubview:myTable];
    [myTable release];
}

#pragma mark UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mainArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *mainLab;
    UIImageView *arrowIcon;
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        mainLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 10, 150, 22)];
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
        mainLab=(UILabel *)[cell.contentView viewWithTag:102];
    }
    mainLab.text=[mainArr objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            SiteViewController *mySet=[[SiteViewController alloc]init];
            [self.navigationController  pushViewController:mySet animated:NO];
            [mySet release];
        }
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        default:
            break;
    }
}

#pragma mark end

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
}


@end
