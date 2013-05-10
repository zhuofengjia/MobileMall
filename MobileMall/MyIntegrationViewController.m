//
//  myIntegrationViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-9.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import "MyIntegrationViewController.h"

@interface MyIntegrationViewController ()

@end

@implementation MyIntegrationViewController

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
    self.title=@"我的积分";
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    [self setMyData];
    [self layoutMyNavView];
    [self layoutMyMainView];
	// Do any additional setup after loading the view.
}

-(void)setMyData{
    score=70;
    scoreArr=[[NSMutableArray alloc]initWithObjects:@"+50",@"+20",@"-50",@"+30",@"+20", nil];
    dateArr=[[NSMutableArray alloc]initWithObjects:@"2013-05-09",@"2013-05-07",@"2013-05-04",@"2013-05-01",@"2013-04-29", nil];
}

-(void)layoutMyNavView{
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
    
    UIImage *rightImage=[[UIImage imageNamed:@"allRight.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:15];
    //UIImage *rightImage=[[UIImage imageNamed:@"allRight.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 20)];
    UIButton *rightBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"积分规则" frame:CGRectMake(0, 0, 60, 30) imageName:@"" tappedImageName:@"" target:self action:@selector(showMyRule) tag:102];
    [rightBtn setBackgroundImage:rightImage forState:UIControlStateNormal];
    UIBarButtonItem *rightBarItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarItem];
    [rightBarItem release];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)showMyRule{
    
}

-(void)layoutMyMainView{
    scoreTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 5, 320, 60) style:UITableViewStyleGrouped];
    scoreTable.delegate=self;
    scoreTable.dataSource=self;
    scoreTable.scrollEnabled=NO;
    scoreTable.backgroundView.alpha=0.0f;
    [self.view addSubview:scoreTable];
    
    historyTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 65, 320, MY_HEIGHT-64-65) style:UITableViewStyleGrouped];
    historyTable.delegate=self;
    historyTable.dataSource=self;
    historyTable.backgroundView.alpha=0.0f;
    [self.view addSubview:historyTable];
    [self setExtraCellLineHidden:historyTable];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==scoreTable) {
        return 1;
    }else{
        if (isShowHistory) {
            return scoreArr.count+1;
        }else{
            return 1;
        }
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==scoreTable) {
        static NSString *CellIdentifier = @"scoreCellIdentifier";
        UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 50, 20) Font:[UIFont systemFontOfSize:18] Text:@"积分:" Color:[UIColor blackColor]];
        
        UILabel *numberLab=[[UILabel alloc]initWithFrame:CGRectMake(60, 14, 20, 20)];
        numberLab.backgroundColor=[UIColor clearColor];
        numberLab.font=[UIFont systemFontOfSize:18];
        numberLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        NSString *numberStr=[NSString stringWithFormat:@"%d",score];
        CGSize size=[numberStr sizeWithFont:numberLab.font constrainedToSize:CGSizeMake(MAXFLOAT, numberLab.frame.size.height)];
        [numberLab setFrame:CGRectMake(60, 14, size.width, 20)];
        numberLab.text=numberStr;
        [cell.contentView addSubview:numberLab];
        [numberLab release];
        
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(64+size.width, 14, 20, 20) Font:[UIFont systemFontOfSize:18] Text:@"分" Color:[UIColor blackColor]];
        
        return cell;
    }else{
        if (indexPath.row==0) {
            static NSString *CellIdentifier = @"historyCellIdentifier";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell==nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                reuseIdentifier:CellIdentifier] autorelease];
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
                
                [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 190, 20) Font:[UIFont systemFontOfSize:18] Text:@"历史积分纪录:" Color:[UIColor blackColor]];
                
                UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(272, 20, 13, 9)];
                if (!isShowHistory) {
                    arrow.image=[UIImage imageNamed:@"gayArrowDown.png"];
                }else{
                    arrow.image=[UIImage imageNamed:@"gayArrowUp.png"];
                }
                [cell.contentView addSubview:arrow];
                [arrow release];
            }
            return cell;
        }else{
            static NSString *CellIdentifier = @"downCellIdentifier";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell==nil){
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                reuseIdentifier:CellIdentifier] autorelease];
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
                
                [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 50, 20) Font:[UIFont systemFontOfSize:18] Text:@"积分:" Color:[UIColor blackColor]];
                
                UILabel *scoreLab=[[UILabel alloc]initWithFrame:CGRectMake(60, 14, 100, 20)];
                scoreLab.tag=601;
                scoreLab.backgroundColor=[UIColor clearColor];
                scoreLab.font=[UIFont systemFontOfSize:18];
                scoreLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
                [cell.contentView addSubview:scoreLab];
                [scoreLab release];
                
                UILabel *dateLab=[[UILabel alloc]initWithFrame:CGRectMake(190, 14, 100, 20)];
                dateLab.tag=602;
                dateLab.backgroundColor=[UIColor clearColor];
                dateLab.font=[UIFont systemFontOfSize:18];
                dateLab.textColor=[UIColor blackColor];
                [cell.contentView addSubview:dateLab];
                [dateLab release];
            }
            
            UILabel *scoreLab=(UILabel *)[cell.contentView viewWithTag:601];
            UILabel *dateLab=(UILabel *)[cell.contentView viewWithTag:602];
            
            scoreLab.text=(NSString *)[scoreArr objectAtIndex:indexPath.row-1];
            dateLab.text=(NSString *)[dateArr objectAtIndex:indexPath.row-1];
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==historyTable && indexPath.row==0) {
        isShowHistory=!isShowHistory;
        [historyTable reloadData];
    }
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
    TT_RELEASE_SAFELY(scoreTable);
    TT_RELEASE_SAFELY(historyTable);
    [super dealloc];
}

@end
