//
//  FilterViewController.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController

@synthesize filterArr;
@synthesize fixedArr;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.frame=CGRectMake(0, 0, 290, MY_HEIGHT);
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    filterArr=[[NSMutableArray alloc]initWithObjects:@"酒种分类:",@"价格区间",@"生产地区", nil];
    fixedArr=[[NSMutableArray alloc]initWithObjects:@"法国",@"英国",@"意大利",@"西班牙",@"澳大利亚",@"美国",@"加拿大",@"中国",@"日本",@"印度",@"墨西哥",@"巴西", nil];
    selectArr=[[NSMutableArray alloc]init];
    
    UIImageView *bgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT)];
    NSString *tempVersion = [[UIDevice currentDevice] systemVersion];
    NSString *subV = [tempVersion substringToIndex:1];
    if ([subV intValue]>=6) {
        bgView.image=[UIImage imageNamed:@"filterBg1136.png"];
    }else{
        bgView.image=[UIImage imageNamed:@"filterBg960.png"];
    }
    [self.view addSubview:bgView];
    [bgView release];
    
    [self layoutMyTable];
}

- (void)layoutMyTable{
    UITableView *filterTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, 290, filterArr.count*44) style:UITableViewStylePlain];
    filterTable.tag=701;
    filterTable.backgroundColor=[UIColor clearColor];
    filterTable.delegate=self;
    filterTable.dataSource=self;
    [self.view addSubview:filterTable];
    [filterTable release];
}

- (void)addMySecondFilterView{
//    if (!secondFilerView) {
//        
//    }
    secondFilerView=[[UIView alloc]initWithFrame:CGRectMake(290, 0, 290, MY_HEIGHT-20)];
    UIImageView *secondBgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT)];
    NSString *tempVersion = [[UIDevice currentDevice] systemVersion];
    NSString *subV = [tempVersion substringToIndex:1];
    if ([subV intValue]>=6) {
        secondBgView.image=[UIImage imageNamed:@"filterBg1136.png"];
    }else{
        secondBgView.image=[UIImage imageNamed:@"filterBg960.png"];
    }
    [secondFilerView addSubview:secondBgView];
    [secondBgView release];
    UIImageView *navView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    navView.image=[UIImage imageNamed:@"filterNav.png"];
    [secondFilerView addSubview:navView];
    [navView release];
    [self.view addSubview:secondFilerView];
    
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(10, 27, 45, 30) IconName:@"filterBack.png" Target:self Action:@selector(goMyBack) ButtonTag:101 TitleString:@"" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    [secondFilerView addSubview:leftBtn];
    
    
    UIButton *fixedBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(240, 27, 42, 30) imageName:@"filterFixed.png" tappedImageName:@"filterFixed.png" target:self action:@selector(fixedMyFilter) tag:101];
    [secondFilerView addSubview:fixedBtn];
    
    float myheight=(fixedArr.count*44<=MY_HEIGHT-64) ?fixedArr.count*44 : MY_HEIGHT-64;
    UITableView *fixedTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 290, myheight) style:UITableViewStylePlain];
    fixedTable.backgroundColor=[UIColor clearColor];
    fixedTable.tag=702;
    fixedTable.delegate=self;
    fixedTable.dataSource=self;
    [secondFilerView addSubview:fixedTable];
    [fixedTable release];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    secondFilerView.frame=CGRectMake(0, 0, 290, MY_HEIGHT-20);
    [UIView commitAnimations];
}

-(void)goMyBack{
    if (secondFilerView) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.30];
        [UIView setAnimationDelegate:self];
        secondFilerView.frame=CGRectMake(290, 0, 290, MY_HEIGHT-20);
        [UIView commitAnimations];
        
        [secondFilerView removeFromSuperview];
    }
}

-(void)fixedMyFilter{
    [self goMyBack];
    if (delegate) {
        [delegate setMyFilterStr:@""];
    }

}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==701) {
        return filterArr.count;
    }else{
        return fixedArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==701) {
        UILabel *filterLab;
        UILabel *myFilter;
        UIImageView *arrowIcon;
        static NSString *CellIdentifier = @"CellIdentifier";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil){
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.backgroundColor=[UIColor clearColor];
            
            filterLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 22)];
            filterLab.tag=101;
            filterLab.backgroundColor=[UIColor clearColor];
            filterLab.textAlignment=NSTextAlignmentLeft;
            [cell.contentView addSubview:filterLab];
            [filterLab release];
            
            myFilter=[[UILabel alloc]initWithFrame:CGRectMake(120, 10, 100, 22)];
            myFilter.tag=102;
            myFilter.backgroundColor=[UIColor clearColor];
            myFilter.textAlignment=NSTextAlignmentLeft;
            [cell.contentView addSubview:myFilter];
            [myFilter release];
            
            arrowIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jiantou.png"]];
            arrowIcon.frame=CGRectMake(265, 16, 7, 11);
            [cell.contentView addSubview:arrowIcon];
            [arrowIcon release];
            
            UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 42, 290, 1)];
            lineView.backgroundColor=[UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:184.0/255.0 alpha:1.0];
            [cell.contentView addSubview:lineView];
            [lineView release];
            
            
        }else{
            filterLab=(UILabel *)[cell.contentView viewWithTag:101];
            //myFilter=(UILabel *)[cell.contentView viewWithTag:102];
        }
        filterLab.text=[filterArr objectAtIndex:indexPath.row];
        return cell;
    }else{
        UILabel *fixedLab;
        UIImageView *selectView;
        static NSString *CellIdentifier = @"SelectCellIdentifier";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil){
            cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            //cell.backgroundColor=[UIColor clearColor];
            
            fixedLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 150, 22)];
            fixedLab.tag=201;
            fixedLab.backgroundColor=[UIColor clearColor];
            fixedLab.textAlignment=NSTextAlignmentLeft;
            [cell.contentView addSubview:fixedLab];
            [fixedLab release];
            
            selectView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"filterCommon.png"]];
            selectView.tag=202;
            selectView.frame=CGRectMake(255, 12, 20, 20);
            [cell.contentView addSubview:selectView];
            [selectView release];
            
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 42, 290, 1)];
            line.backgroundColor=[UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:184.0/255.0 alpha:1.0];
            [cell.contentView addSubview:line];
            [line release];
        }else{
            fixedLab=(UILabel *)[cell.contentView viewWithTag:201];
            selectView=(UIImageView *)[cell.contentView viewWithTag:202];
        }
        fixedLab.text=[fixedArr objectAtIndex:indexPath.row];
        BOOL isSelect=NO;
        for (int i=0; i<selectArr.count; i++) {
            NSString *selectName=[selectArr objectAtIndex:i];
            if ([selectName isEqualToString:[fixedArr objectAtIndex:indexPath.row]]) {
                isSelect=YES;
            }
        }
        if (isSelect) {
            [selectView setImage:[UIImage imageNamed:@"filterSelect.png"]];
        }else{
            [selectView setImage:[UIImage imageNamed:@"filterCommon.png"]];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==701) {
        [self addMySecondFilterView];
    }else{
        UITableViewCell *myCell = [tableView cellForRowAtIndexPath:indexPath];
        UIImageView *selectView=(UIImageView *)[myCell.contentView viewWithTag:202];
        [selectView setImage:[UIImage imageNamed:@"filterSelect.png"]];
        NSString *myStr=[fixedArr objectAtIndex:indexPath.row];
        [selectArr addObject:myStr];
    }
}

#pragma mark end

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)setVisible:(BOOL)visible {
    self.view.hidden = !visible;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [filterArr release];
    [fixedArr release];
    [secondFilerView release];
    [super dealloc];
}

@end
