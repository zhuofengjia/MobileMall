//
//  SearchViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
	// Do any additional setup after loading the view.
    hotArr=[[NSMutableArray alloc]initWithObjects:@"茅台",@"五粮液",@"泸州老窖",@"国窖",@"郎酒",@"剑南春", nil];
    historyArr=[[NSMutableArray alloc]initWithObjects:@"冰瑞",@"百丽甜酒",@"伏特加",@"琴酒",@"拉菲",@"杜松子酒",@"朗姆酒",@"皇家礼炮",@"XO",@"龙舌兰", nil];
    
    [self layoutMySelectView];
    
    [self layoutMyTableView];
    [self layoutMySearchView];
}

-(void)layoutMySearchView{
    UIImageView *SearchView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 47)];
    SearchView.image=[UIImage imageNamed:@"searchNav.png"];
    
    [self.view addSubview:SearchView];
    [SearchView release];
    
    dynamicBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    dynamicBtn.frame=CGRectMake(271, 8, 42, 29);
    [dynamicBtn setBackgroundImage:[UIImage imageNamed:@"searchScanning.png"] forState:UIControlStateNormal];
    [dynamicBtn addTarget:self action:@selector(SearchOrScanning) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dynamicBtn];
    
    mySearchFd=[[UITextField alloc]initWithFrame:CGRectMake(30, 11, 215, 30)];
    //mySearchFd.backgroundColor=[UIColor blackColor];
    mySearchFd.autocapitalizationType=UITextAutocapitalizationTypeNone;
    mySearchFd.delegate=self;
    mySearchFd.returnKeyType=UIReturnKeySearch;
    mySearchFd.userInteractionEnabled=YES;
    mySearchFd.backgroundColor=[UIColor clearColor];
    [self.view addSubview:mySearchFd];
    
    myDeleteBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //deleteBtn.tag=1101;
    myDeleteBtn.frame=CGRectMake(240, 10, 23, 24);
    [myDeleteBtn setImage:[UIImage imageNamed:@"homeSearchDelete.png"] forState:UIControlStateNormal];
    [myDeleteBtn addTarget:self action:@selector(deleteMySearchText) forControlEvents:UIControlEventTouchUpInside];
    myDeleteBtn.hidden=YES;
    [self.view addSubview:myDeleteBtn];
    
    cancelCor=[[UIControl alloc]initWithFrame:CGRectMake(0, 44, 320, MY_HEIGHT-44)];
    cancelCor.backgroundColor=[UIColor blackColor];
    cancelCor.alpha=0.6;
    [cancelCor addTarget:self action:@selector(cancelMySearch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelCor];
    cancelCor.hidden=YES;
}

-(void)layoutMySelectView{
    UIImageView *selectBgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchSelectBg.png"]];
    selectBgView.frame=CGRectMake(0, 44, 320, 35);
    [self.view addSubview:selectBgView];
    [selectBgView release];
    
    UIButton *hotBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    hotBtn.tag=101;
    hotBtn.frame=CGRectMake(7, 5+44, 153, 30);
    
    [hotBtn setBackgroundImage:[UIImage imageNamed:@"searchHot.png"] forState:UIControlStateNormal];
    [hotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [hotBtn setTitle:@"热门搜索" forState:UIControlStateNormal];
    [hotBtn addTarget:self action:@selector(showMyhot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hotBtn];
    
    UIButton *historyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    historyBtn.frame=CGRectMake(161, 5+44, 153, 30);
    historyBtn.tag=102;
    [historyBtn setTitle:@"历史搜索" forState:UIControlStateNormal];
    historyBtn.titleLabel.textColor=[UIColor blackColor];
    historyBtn.backgroundColor=[UIColor clearColor];
    [historyBtn addTarget:self action:@selector(showMyHistory) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:historyBtn];
}


-(void)layoutMyTableView{
//    float hotHeight=(hotArr.count*44<=MY_HEIGHT-80-54-20)? hotArr.count*44 : MY_HEIGHT-80-54-20;
//    
//    float historyHeight=(historyArr.count*44<=MY_HEIGHT-80-54-20)? historyArr.count*44 : MY_HEIGHT-80-54-20;
    
    hotTable=[[UITableView alloc]initWithFrame:CGRectMake(5, 80, 310, MY_HEIGHT-80-52-20) style:UITableViewStylePlain];
    hotTable.delegate=self;
    hotTable.dataSource=self;
    //hotTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:hotTable];
    [self setExtraCellLineHidden:hotTable];
    
    historyTable=[[UITableView alloc]initWithFrame:CGRectMake(5, 80, 310, MY_HEIGHT-80-52-20) style:UITableViewStylePlain];
    historyTable.delegate=self;
    historyTable.dataSource=self;
    //historyTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    historyTable.hidden=YES;
    [self.view addSubview:historyTable];
    [self setExtraCellLineHidden:historyTable];
}


//去掉无用单元格的分割线（以后每个类都用这个同名的方法实现该作用）
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}


-(void)showMyhot{
    UIButton *hotBtn=(UIButton *)[self.view viewWithTag:101];
    UIButton *historyBtn=(UIButton *)[self.view viewWithTag:102];
    
    [hotBtn setBackgroundImage:[UIImage imageNamed:@"searchHot.png"] forState:UIControlStateNormal];
    [hotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [historyBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [historyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    historyBtn.backgroundColor=[UIColor clearColor];
    
    historyTable.hidden=YES;
    hotTable.hidden=NO;
}
     
-(void)showMyHistory{
    UIButton *hotBtn=(UIButton *)[self.view viewWithTag:101];
    UIButton *historyBtn=(UIButton *)[self.view viewWithTag:102];
    
    [historyBtn setBackgroundImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
    [historyBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [hotBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [hotBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    hotBtn.backgroundColor=[UIColor clearColor];
    
    historyTable.hidden=NO;
    hotTable.hidden=YES;
}


#pragma mark UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==hotTable) {
        return hotArr.count;
    }else{
        return historyArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *nameLab;
    static NSString *CellIdentifier = @"HotCellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        nameLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 24)];
        nameLab.tag=2001;
        nameLab.backgroundColor=[UIColor clearColor];
        nameLab.textColor=[UIColor grayColor];
        nameLab.textAlignment=NSTextAlignmentLeft;
        nameLab.font=[UIFont systemFontOfSize:18];
        [cell.contentView addSubview:nameLab];
        [nameLab release];
    }else{
        nameLab=(UILabel *)[cell.contentView viewWithTag:2001];
    }
    if (tableView==hotTable) {
        nameLab.text=[hotArr objectAtIndex:indexPath.row];
    }else{
        nameLab.text=[historyArr objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark end


-(void)SearchOrScanning{
    if (isSearching) {
        [self cancelMySearch];
    }
}

-(void)cancelMySearch{
    if (mySearchFd) {
        [mySearchFd resignFirstResponder];
        mySearchFd.text=@"";
        isSearching=NO;
    }
    if (cancelCor) {
        cancelCor.hidden=YES;
    }
    [self changeMySearchToScanning];
}

//动态按钮的动画处理

-(void)changeMySearchToScanning{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    //[UIView setAnimationDelegate:self];
    dynamicBtn.frame=CGRectMake(292, 22, 0, 0);
    [UIView commitAnimations];
    [dynamicBtn setBackgroundImage:[UIImage imageNamed:@"searchScanning.png"] forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    //[UIView setAnimationDelegate:self];
    dynamicBtn.frame=CGRectMake(271, 8, 42, 29);
    [UIView commitAnimations];
}


-(void)changeMyScanningToSearch{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    //[UIView setAnimationDelegate:self];
    dynamicBtn.frame=CGRectMake(292, 22, 0, 0);
    [UIView commitAnimations];
    [dynamicBtn setBackgroundImage:[UIImage imageNamed:@"homeCancelBtn.png"] forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    //[UIView setAnimationDelegate:self];
    dynamicBtn.frame=CGRectMake(271, 8, 42, 29);
    [UIView commitAnimations];
}


-(void)deleteMySearchText{
    mySearchFd.text=@"";
    myDeleteBtn.hidden=YES;
}

//输入框系统协议
#pragma mark UITextFieldDelegate   

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    isSearching=YES;
    if (textField==mySearchFd) {
        [self changeMyScanningToSearch];
        cancelCor.hidden=NO;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //NSLog(@"开始搜索了++++++++++");
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (![textField.text isEqualToString:nil]) {
        myDeleteBtn.hidden=NO;
    }
    
    if ([string isEqualToString:@""] &&textField.text.length==1){
        
        myDeleteBtn.hidden=YES;
    }
    return YES;
}

#pragma mark end


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BGwhite.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_presswhite.png"];
}


-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
}

-(void)dealloc{
    TT_RELEASE_SAFELY(mySearchFd);
    TT_RELEASE_SAFELY(cancelCor);
    TT_RELEASE_SAFELY(hotArr);
    TT_RELEASE_SAFELY(historyArr);
    TT_RELEASE_SAFELY(hotTable);
    TT_RELEASE_SAFELY(historyTable);
    
    [super dealloc];
}

@end
