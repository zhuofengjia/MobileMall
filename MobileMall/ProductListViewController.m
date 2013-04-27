//
//  ProductListViewController.m
//  SoftBestWine
//
//  Created by ChenYuanFang on 13-4-17.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductObject.h"


@interface ProductListViewController ()

@end

@implementation ProductListViewController

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
    
    [self setMyTestArr];
    //ProArr=[[NSMutableArray alloc]initWithObjects:<#(id), ...#>, nil];
    
    myType=Sequence_Sales;
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self layoutMyReplaceNavBar];
    [self layoutMySequenceBtn];
    [self layoutMyTableView];
	// Do any additional setup after loading the view.
}


//测试数据
-(void)setMyTestArr{
    ProductObject *pro1=[[ProductObject alloc]init];
    pro1.imageUrl=@"ad11.png";
    pro1.name=@"五粮醇红淡雅50度 五粮醇红淡雅500ml";
    pro1.price=@"￥1020.0";
    pro1.sales=@"售出188";
    
    ProductObject *pro2=[[ProductObject alloc]init];
    pro2.imageUrl=@"ad12.png";
    pro2.name=@"茅台贵州王金樽典藏8年辉煌500ml";
    pro2.price=@"￥820.0";
    pro2.sales=@"售出282";
    
    ProductObject *pro3=[[ProductObject alloc]init];
    pro3.imageUrl=@"ad13.png";
    pro3.name=@"东方特雕陶瓷原装黄酒";
    pro3.price=@"￥120.0";
    pro3.sales=@"售出764";
    
    ProductObject *pro4=[[ProductObject alloc]init];
    pro4.imageUrl=@"ad14.png";
    pro4.name=@"张裕特制三鞭酒500ml";
    pro4.price=@"￥90.0";
    pro4.sales=@"售出998";
    
    ProductObject *pro5=[[ProductObject alloc]init];
    pro5.imageUrl=@"ad15.png";
    pro5.name=@"剑南春10年窖藏典藏尊贵版500ml";
    pro5.price=@"￥770.0";
    pro5.sales=@"售出180";
    
    ProductObject *pro6=[[ProductObject alloc]init];
    pro6.imageUrl=@"ad16.png";
    pro6.name=@"杏花村汾酒12年经典窖藏500ml";
    pro6.price=@"￥980.0";
    pro6.sales=@"售出220";
    
    ProductObject *pro7=[[ProductObject alloc]init];
    pro7.imageUrl=@"ad17.png";
    pro7.name=@"洋河蓝色经典梦之蓝精品典藏版500ml";
    pro7.price=@"￥1000.0";
    pro7.sales=@"售出1718";
    
    ProArr=[[NSMutableArray alloc]initWithObjects:pro1,pro2,pro3,pro4,pro5,pro6,pro7, nil];
    [pro1 release];
    [pro2 release];
    [pro3 release];
    [pro4 release];
    [pro5 release];
    [pro6 release];
    [pro7 release];
}

-(void)layoutMyReplaceNavBar{
    UIImageView *bgNavView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"allNav.png"]];
    bgNavView.frame=CGRectMake(0, 0, 320, 48);
    [self.view addSubview:bgNavView];
    [bgNavView release];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 120, 20)];
    titleLab.tag=301;
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.font=[UIFont boldSystemFontOfSize:18.0f];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textColor=[UIColor whiteColor];
    titleLab.shadowColor=[UIColor blackColor];
    titleLab.shadowOffset=CGSizeMake(0.5f, -0.5f);
    titleLab.text=@"白酒";
    [self.view addSubview:titleLab];
    [titleLab release];
    
    UILabel *numberLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 25, 120, 15)];
    titleLab.tag=302;
    numberLab.textAlignment=NSTextAlignmentCenter;
    numberLab.font=[UIFont boldSystemFontOfSize:12.0f];
    numberLab.backgroundColor=[UIColor clearColor];
    numberLab.textColor=[UIColor whiteColor];
    numberLab.shadowColor=[UIColor blackColor];
    numberLab.shadowOffset=CGSizeMake(0.5f, -0.5f);
    numberLab.text=@"共200条结果";
    [self.view addSubview:numberLab];
    [numberLab release];
    
    UIButton *canceledBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"筛选" frame:CGRectMake(273, 7, 42, 30) imageName:@"allRight.png" tappedImageName:@"allRight.png" target:self action:@selector(doMyFilter) tag:101];
    [self.view addSubview:canceledBtn];
    
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(10, 7, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:102 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    [self.view addSubview:leftBtn];
    
    UIButton *gridBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(200, 6.5, 35, 30) imageName:@"gridSelect.png" tappedImageName:@"gridSelect.png" target:self action:@selector(showMyGrid) tag:103];
    [self.view addSubview:gridBtn];
    
    UIButton *listBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(234, 6.6, 35, 30) imageName:@"listCommon.png" tappedImageName:@"listCommon.png" target:self action:@selector(showMyList) tag:104];
    [self.view addSubview:listBtn];
}

-(void)layoutMySequenceBtn{
    UIImageView *selectBgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchSelectBg.png"]];
    selectBgView.frame=CGRectMake(0, 44, 320, 35);
    [self.view addSubview:selectBgView];
    [selectBgView release];
    
    UIButton *selectBtn1=[ComponentsFactory drawSelectStringInMyButtonWithFrame:CGRectMake(0, 49, 80, 30) IconName:@"searchHistory.png" Target:self Action:@selector(doMySequence:) ButtonTag:501 TitleString:@"销量" StringFont:14 IsBold:NO Color:[UIColor redColor]];
    [self.view addSubview:selectBtn1];
    
    UIButton *selectBtn2=[ComponentsFactory drawSelectStringInMyButtonWithFrame:CGRectMake(80, 49, 80, 30) IconName:@"" Target:self Action:@selector(doMySequence:) ButtonTag:502 TitleString:@"新品" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn2];
    
    UIButton *selectBtn3=[ComponentsFactory drawSelectStringInMyButtonWithFrame:CGRectMake(160, 49, 80, 30) IconName:@"" Target:self Action:@selector(doMySequence:) ButtonTag:503 TitleString:@"价格" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn3];
    
    UIButton *selectBtn4=[ComponentsFactory drawSelectStringInMyButtonWithFrame:CGRectMake(240, 49, 80, 30) IconName:@"" Target:self Action:@selector(doMySequence:) ButtonTag:504 TitleString:@"评价" StringFont:14 IsBold:NO Color:[UIColor blackColor]];
    [self.view addSubview:selectBtn4];
}

-(void)layoutMyTableView{
    UITableView *gridTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 80, 320, MY_HEIGHT-80-20) style:UITableViewStylePlain];
    gridTable.tag=881;
    gridTable.delegate=self;
    gridTable.dataSource=self;
    gridTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:gridTable];
    [self setExtraCellLineHidden:gridTable];
    [gridTable release];
    
    
    UITableView *listTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 80, 320, MY_HEIGHT-80-20) style:UITableViewStylePlain];
    listTable.tag=882;
    listTable.delegate=self;
    listTable.dataSource=self;
    [self.view addSubview:listTable];
    [self setExtraCellLineHidden:listTable];
    listTable.hidden=YES;
    [listTable release];
}

//调出筛选界面
-(void)doMyFilter{
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] makeRightViewVisible];
    [self moveToLeftSide];
}

-(void)goBack{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)showMyGrid{
    UIButton *gridBtn=(UIButton *)[self.view viewWithTag:103];
    UIButton *listBtn=(UIButton *)[self.view viewWithTag:104];
    
    [gridBtn setImage:[UIImage imageNamed:@"gridSelect.png"] forState:UIControlStateNormal];
    [listBtn setImage:[UIImage imageNamed:@"listCommon.png"] forState:UIControlStateNormal];
    
    UITableView *gridTable=(UITableView *)[self.view viewWithTag:881];
    UITableView *listTable=(UITableView *)[self.view viewWithTag:882];
    gridTable.hidden=NO;
    listTable.hidden=YES;
}

-(void)showMyList{
    UIButton *gridBtn=(UIButton *)[self.view viewWithTag:103];
    UIButton *listBtn=(UIButton *)[self.view viewWithTag:104];
    
    [gridBtn setImage:[UIImage imageNamed:@"gridCommon.png"] forState:UIControlStateNormal];
    [listBtn setImage:[UIImage imageNamed:@"listSelect.png"] forState:UIControlStateNormal];
    
    UITableView *gridTable=(UITableView *)[self.view viewWithTag:881];
    UITableView *listTable=(UITableView *)[self.view viewWithTag:882];
    gridTable.hidden=YES;
    listTable.hidden=NO;
}

-(void)doMySequence:(id)sender{
    UIButton *myBtn=(UIButton *)sender;
    for (int i=501; i<505; i++) {
        UIButton *aBtn=(UIButton *)[self.view viewWithTag:i];
        [aBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        UILabel *aLab=(UILabel *)[aBtn viewWithTag:i+100];
        aLab.textColor=[UIColor blackColor];
    }
    switch (myBtn.tag) {
        case 501:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:601];
            aLab.textColor=[UIColor redColor];
            myType=Sequence_Sales;
        }
            break;
        case 502:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:602];
            aLab.textColor=[UIColor redColor];
            myType=Sequence_New;
        }
            break;
        case 503:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:603];
            aLab.textColor=[UIColor redColor];
            UIImageView *myArrow=(UIImageView *)[myBtn viewWithTag:703];
            if (myType==Sequence_PriceUp) {
                [myArrow setImage:[UIImage imageNamed:@"arrowDown.png"]];
                myType=Sequence_PriceDown;
            }else{
                [myArrow setImage:[UIImage imageNamed:@"arrowUp.png"]];
                myType=Sequence_PriceUp;
            }
        }
            break;
        case 504:{
            [myBtn setImage:[UIImage imageNamed:@"searchHistory.png"] forState:UIControlStateNormal];
            UILabel *aLab=(UILabel *)[myBtn viewWithTag:604];
            aLab.textColor=[UIColor redColor];
            myType=Sequence_Assess;
        }
            break;
        default:
            break;
    }
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
    if (tableView.tag==881) {
        return 190;
    }else{
        return 95;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==881) {
        int num1 = 0;
        int nCount =  [ProArr count];
        if (0 == nCount) {
            num1= 0;
        }
        else if( 0 != nCount/2 && 0 == nCount % 2 ){
            num1= nCount/2;
        }
        else{
            num1= (nCount/2 + 1);
        }
        NSLog(@"一共右%d行",num1);
        return num1;
        
    }else{
        return ProArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==881) {
        int row=indexPath.row;
        static NSString *CellIdentifier = @"GridCellIdentifier";
        ProductGridCell *cell = (ProductGridCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
//        int tempnum ;
//        int nCount =  [ProArr count];
//        if (0 == nCount) {
//            tempnum = 0;
//        }
//        else if( 0 != nCount/2 && 0 == nCount % 2 ){
//            tempnum = nCount/2;
//        }
//        else{
//            tempnum = (nCount/2 + 1);
//        }
        
        if (cell==nil) {
            cell = [[[ProductGridCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.delegate=self;
        }
        
        if (ProArr.count==0) {
            return cell;
        }else{
            
            NSRange tempRange;
            tempRange.location = row*2;
            
            int tempNum = [ProArr count] / 2;
            
            if (tempNum == row && 0 != ([ProArr count]% 2)) {
                tempRange.length = [ProArr count]% 2;
            }
            else{
                tempRange.length = 2;
            }
            [cell updateCellWithArray:[ProArr subarrayWithRange:tempRange] withIndexPath:indexPath];
        }
        return cell;
    }else{
        static NSString *CellIdentifier = @"ListCellIdentifier";
        ProductListCell *cell=(ProductListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            cell = [[[ProductListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        ProductObject *myObj=(ProductObject *)[ProArr objectAtIndex:indexPath.row];
        [cell updateCellWithmyProduct:myObj];
        return cell;
    }
}

#pragma mark  end

//主界面向左滑动
- (void)moveToLeftSide {
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    homeViewIsOutOfStage = YES;
    [self animateHomeViewToSide:CGRectMake(-290.0f,
                                           app.myTabBar.view.frame.origin.y,
                                           app.myTabBar.view.frame.size.width,
                                           app.myTabBar.view.frame.size.height)];
}


//主界面向右滑动（暂时没用到）
- (void)moveToRightSide {
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    homeViewIsOutOfStage = YES;
    [self animateHomeViewToSide:CGRectMake(290.0f,
                                           app.myTabBar.view.frame.origin.y,
                                           app.myTabBar.view.frame.size.width,
                                           app.myTabBar.view.frame.size.height)];
}

//从主界面滑动到筛选页面（动画）
- (void)animateHomeViewToSide:(CGRect)newViewRect {
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [UIView animateWithDuration:0.2
                     animations:^{
                         app.myTabBar.view.frame = newViewRect;
                     }
                     completion:^(BOOL finished){
                         UIControl *overView = [[UIControl alloc] init];
                         overView.tag = 10086;
                         overView.backgroundColor = [UIColor clearColor];
                         overView.frame = app.myTabBar.view.frame;
                         [overView addTarget:self action:@selector(restoreViewLocation) forControlEvents:UIControlEventTouchDown];
                         [[[UIApplication sharedApplication] keyWindow] addSubview:overView];
                         [overView release];
                     }];
}

//从筛选界面返回（动画）
- (void)restoreViewLocation {
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    homeViewIsOutOfStage = NO;
    [UIView animateWithDuration:0.3
                     animations:^{
                         app.myTabBar.view.frame = CGRectMake(0,
                                                                           app.myTabBar.view.frame.origin.y,
                                                                           app.myTabBar.view.frame.size.width,
                                                                           app.myTabBar.view.frame.size.height);
                         
                     }
                     completion:^(BOOL finished){
                         UIControl *overView = (UIControl *)[[[UIApplication sharedApplication] keyWindow] viewWithTag:10086];
                         [overView removeFromSuperview];
                         [app makeRightViewUnVisible];
                     }];
    
}


#pragma  mark FilterDelegate
-(void)setMyFilterStr:(NSString *)filterStr{
    [self restoreViewLocation];
}


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app.myTabBar hide];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [app.myTabBar show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
