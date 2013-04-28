//
//  MyCollectViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-4-28.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "MyCollectViewController.h"
#import "EGOImageView.h"
#import "ProductObject.h"

@interface MyCollectViewController ()

@end

@implementation MyCollectViewController

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
    self.title=@"我的收藏";
    [self setMyTestArr];
    
    [self layoutMyNavView];
    [self layoutMyTableView];
	// Do any additional setup after loading the view.
}


//-------------------------测试数据-----------------------
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
    
    collectArr=[[NSMutableArray alloc]initWithObjects:pro1,pro2,pro3,pro4,pro5,pro6,pro7, nil];
    [pro1 release];
    [pro2 release];
    [pro3 release];
    [pro4 release];
    [pro5 release];
    [pro6 release];
    [pro7 release];
}

-(void)layoutMyNavView{
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
}

-(void)layoutMyTableView{
    collectTable=[[CMTableView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-20-44-52) style:UITableViewStylePlain];
    collectTable.curTarget=self;
    collectTable.delegate=self;
    collectTable.dataSource=self;
    [self.view addSubview:collectTable];
    [self setExtraCellLineHidden:collectTable];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return collectArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EGOImageView *proView;
    UILabel *nameLab;
    UILabel *priceLab;
    UIButton *shoppingBtn;
    UIButton *deleteBtn;
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        proView=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"homeWaitSmall.png"]];
        proView.tag=701;
        proView.frame=CGRectMake(5, 5, 85, 85);
        [cell.contentView addSubview:proView];
        [proView release];
        
        nameLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 36)];
        nameLab.tag=702;
        nameLab.backgroundColor=[UIColor clearColor];
        nameLab.font=[UIFont systemFontOfSize:16];
        nameLab.numberOfLines=2;
        nameLab.lineBreakMode=NSLineBreakByWordWrapping;
        [cell.contentView addSubview:nameLab];
        [nameLab release];
        
        priceLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 44, 190, 18)];
        priceLab.tag=703;
        priceLab.backgroundColor=[UIColor clearColor];
        priceLab.textColor=[UIColor redColor];
        priceLab.font=[UIFont systemFontOfSize:16];
        [cell.contentView addSubview:priceLab];
        [priceLab release];
        
        shoppingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        shoppingBtn.frame=CGRectMake(100, 65, 79, 25);
        shoppingBtn.tag=704;
        [shoppingBtn setImage:[UIImage imageNamed:@"addCartBtn.png"] forState:UIControlStateNormal];
        [shoppingBtn addTarget:self action:@selector(addToMyShoppingCart:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:shoppingBtn];
        
        deleteBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        deleteBtn.frame=CGRectMake(195, 65, 60, 25);
        deleteBtn.tag=705;
        [deleteBtn setImage:[UIImage imageNamed:@"cancelColectBtn.png"] forState:UIControlStateNormal];
        [deleteBtn addTarget:self action:@selector(cancelMyColect:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:deleteBtn];
        
        UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(305, 42, 7, 11)];
        arrow.image=[UIImage imageNamed:@"jiantou.png"];
        [cell.contentView addSubview:arrow];
        [arrow release];
        
    }else{
        proView=(EGOImageView *)[cell.contentView viewWithTag:701];
        nameLab=(UILabel *)[cell.contentView viewWithTag:702];
        priceLab=(UILabel *)[cell.contentView viewWithTag:703];
    }
    ProductObject *aObj=(ProductObject *)[collectArr objectAtIndex:indexPath.row];
    proView.image=[UIImage imageNamed:aObj.imageUrl];
    nameLab.text=aObj.name;
    priceLab.text=aObj.price;
    
    return cell;
}

//单元格内添加到购物车按钮调用的方法
-(void)addToMyShoppingCart:(id)sender{
    UIButton *addBtn=(UIButton *)sender;
    UITableViewCell *myCell=(UITableViewCell *)[[addBtn superview] superview];    //获得点击按钮所在的单元格
    NSIndexPath * path = [collectTable indexPathForCell:myCell];
    NSLog(@"行数----------%d",path.row);
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [myApp addBadgeOnTabBar:1];
}


//单元格内取消收藏按钮调用的方法
-(void)cancelMyColect:(id)sender{
    UIButton *addBtn=(UIButton *)sender;
    UITableViewCell *myCell=(UITableViewCell *)[[addBtn superview] superview];    //获得点击按钮所在的单元格
    NSIndexPath * path = [collectTable indexPathForCell:myCell];
    NSLog(@"行数----------%d",path.row);
    
    [collectArr removeObjectAtIndex:path.row];
    [collectTable reloadData];
}


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
//    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    [app.myTabBar hide];
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BGwhite.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_presswhite.png"];
}


-(void)viewWillDisappear:(BOOL)animated{
    //self.navigationController.navigationBar.hidden=NO;
//    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    [app.myTabBar show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(collectTable);
    TT_RELEASE_SAFELY(collectArr);
    [super dealloc];
}

@end
