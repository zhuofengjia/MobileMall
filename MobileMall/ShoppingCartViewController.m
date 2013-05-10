//
//  ShoppingCartViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "MyCollectViewController.h"
#import "ProductObject.h"
#import "EGOImageView.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    
    [self setMyTestArr];
    [self getMyTotalData];
    [self layoutMyNothingView];
    
    if (cartArr.count==0) {
        UIView *nothingView=(UIView *)[self.view viewWithTag:51];
        nothingView.hidden=NO;
    }else{
        UIView *nothingView=(UIView *)[self.view viewWithTag:51];
        nothingView.hidden=YES;
        [self layoutMyNavView];
        [self layoutMyMainTableView];
    }
	// Do any additional setup after loading the view.
}

//-------------------------测试数据-----------------------
-(void)setMyTestArr{
    ProductObject *pro1=[[ProductObject alloc]init];
    pro1.imageUrl=@"ad11.png";
    pro1.name=@"五粮醇红淡雅50度 五粮醇红淡雅500ml";
    pro1.price=1020.0;
    pro1.discount=10.0;
    pro1.number=5;
    pro1.sales=@"售出188";
    
    ProductObject *pro2=[[ProductObject alloc]init];
    pro2.imageUrl=@"ad12.png";
    pro2.name=@"茅台贵州王金樽典藏8年辉煌500ml";
    pro2.price=820.0;
    pro2.discount=20.0;
    pro2.number=2;
    pro2.sales=@"售出282";
    
    ProductObject *pro3=[[ProductObject alloc]init];
    pro3.imageUrl=@"ad13.png";
    pro3.name=@"东方特雕陶瓷原装黄酒";
    pro3.price=120.0;
    pro3.discount=70.0;
    pro3.number=1;
    pro3.sales=@"售出764";
    
//    ProductObject *pro4=[[ProductObject alloc]init];
//    pro4.imageUrl=@"ad14.png";
//    pro4.name=@"张裕特制三鞭酒500ml";
//    pro4.price=90.0;
//    pro4.discount=0.0;
//    pro4.number=1;
//    pro4.sales=@"售出998";
//    
//    ProductObject *pro5=[[ProductObject alloc]init];
//    pro5.imageUrl=@"ad15.png";
//    pro5.name=@"剑南春10年窖藏典藏尊贵版500ml";
//    pro5.price=770.0;
//    pro5.discount=15.0;
//    pro5.number=2;
//    pro5.sales=@"售出180";
//    
//    ProductObject *pro6=[[ProductObject alloc]init];
//    pro6.imageUrl=@"ad16.png";
//    pro6.name=@"杏花村汾酒12年经典窖藏500ml";
//    pro6.price=980.0;
//    pro6.discount=11.0;
//    pro6.number=1;
//    pro6.sales=@"售出220";
//    
//    ProductObject *pro7=[[ProductObject alloc]init];
//    pro7.imageUrl=@"ad17.png";
//    pro7.name=@"洋河蓝色经典梦之蓝精品典藏版500ml";
//    pro7.price=1000.0;
//    pro7.discount=70.0;
//    pro7.number=2;
//    pro7.sales=@"售出1718";
    
//    cartArr=[[NSMutableArray alloc]initWithObjects:pro1,pro2,pro3,pro4,pro5,pro6,pro7, nil];
    cartArr=[[NSMutableArray alloc]initWithObjects:pro1,pro2,pro3, nil];
    [pro1 release];
    [pro2 release];
    [pro3 release];
//    [pro4 release];
//    [pro5 release];
//    [pro6 release];
//    [pro7 release];
}

-(void)getMyTotalData{
    for (int i=0; i<cartArr.count; i++) {
        ProductObject *aObj=(ProductObject *)[cartArr objectAtIndex:i];
        totalNumber=totalNumber+aObj.number;
        totalDiscount=totalDiscount+aObj.number*aObj.discount;
        totalPrice=totalPrice+aObj.number*aObj.price;
    }
}

-(void)layoutMyNavView{
    leftBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"编辑" frame:CGRectMake(0, 0, 42, 30) imageName:@"allRight.png" tappedImageName:@"allRight.png" target:self action:@selector(doMyEdit) tag:101];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
    
    
    UIButton *rightBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"结算" frame:CGRectMake(0, 0, 42, 30) imageName:@"allRight.png" tappedImageName:@"allRight.png" target:self action:@selector(doMyPay) tag:102];
    UIBarButtonItem *rightBarItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarItem];
    [rightBarItem release];
}

-(void)layoutMyMainTableView{
    cartTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-20-44-52) style:UITableViewStylePlain];
    cartTable.backgroundColor=[UIColor clearColor];
    cartTable.delegate=self;
    cartTable.dataSource=self;
    [self.view addSubview:cartTable];
    [self setExtraCellLineHidden:cartTable];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}

-(void)layoutMyNothingView{
    UIView *nothingView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-64-52)];
    nothingView.tag=51;
    nothingView.backgroundColor=[UIColor clearColor];
    
    UIImageView *ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(127, 95, 66, 51)];
    ImgView.image=[UIImage imageNamed:@"shoppingNoBg.png"];
    [nothingView addSubview:ImgView];
    [ImgView release];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 180, 320, 20)];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.font=[UIFont systemFontOfSize:17];
    titleLab.text=@"购物车内暂时没有商品，快去挑选吧!";
    [nothingView addSubview:titleLab];
    [titleLab release];
    
    UIButton *goCollectBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:nil frame:CGRectMake(110, 220, 100, 26) imageName:@"goMyColectBtn.png" tappedImageName:@"goMyColectBtn.png" target:self action:@selector(goToMyCollect) tag:511];
    [nothingView addSubview:goCollectBtn];
    
    [self.view addSubview:nothingView];
    [nothingView release];
    nothingView.hidden=YES;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //NSLog(@"执行了执行了执行了执行了执行了执行了执行了");
    
    UIView *headView=[[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)] autorelease];
    headView.backgroundColor=[UIColor whiteColor];
    
    [ComponentsFactory drawMyLabelInView:headView Frame:CGRectMake(5, 7, 35, 16) Font:[UIFont systemFontOfSize:14] Text:@"数量:" Color:[UIColor blackColor]];
    [ComponentsFactory drawMyLabelInView:headView Frame:CGRectMake(100, 7, 35, 16) Font:[UIFont systemFontOfSize:14] Text:@"优惠:" Color:[UIColor blackColor]];
    [ComponentsFactory drawMyLabelInView:headView Frame:CGRectMake(200, 7, 35, 16) Font:[UIFont systemFontOfSize:14] Text:@"总计:" Color:[UIColor blackColor]];
    
    UILabel *numberLab=[ComponentsFactory drawLabelInView:headView Frame:CGRectMake(40, 7, 60, 16) Font:[UIFont systemFontOfSize:14] Text:@"" Color:[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
    numberLab.tag=101;
    numberLab.text=[NSString stringWithFormat:@"%d件",totalNumber];
    
    UILabel *preferLab=[ComponentsFactory drawLabelInView:headView Frame:CGRectMake(135, 7, 65, 16) Font:[UIFont systemFontOfSize:14] Text:@"" Color:[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
	preferLab.tag=102;
    preferLab.text=[NSString stringWithFormat:@"￥%.1f",totalDiscount];
    
    UILabel *totalLab=[ComponentsFactory drawLabelInView:headView Frame:CGRectMake(235, 7, 85, 16) Font:[UIFont systemFontOfSize:14] Text:@"" Color:[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
    totalLab.tag=103;
    totalLab.text=[NSString stringWithFormat:@"￥%.1f",totalPrice];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return cartArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (cartArr.count==0) {
        return nil;
    }
    EGOImageView *proView;
    UILabel *nameLab;
    UILabel *numberLab;
    UILabel *priceLab;
    UILabel *totalPriceLab;
    UILabel *priceTitle;
    UILabel *totalPriceTitle;
    UIButton *minusBtn;
    UIButton *addBtn;
    UIImageView *numberBg;
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        proView=[[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"homeWaitSmall.png"]];
        proView.tag=299;
        proView.frame=CGRectMake(10, 10, 75, 75);
        [cell.contentView addSubview:proView];
        [proView release];
        
        nameLab=[[UILabel alloc]initWithFrame:CGRectMake(93, 5, 200, 35)];
        nameLab.tag=300;
        nameLab.backgroundColor=[UIColor clearColor];
        nameLab.font=[UIFont systemFontOfSize:15];
        nameLab.numberOfLines=2;
        nameLab.lineBreakMode=NSLineBreakByWordWrapping;
        [cell.contentView addSubview:nameLab];
        [nameLab release];
        
        UILabel *numberTitle=[[UILabel alloc]initWithFrame:CGRectMake(93, 45, 30, 14)];
        numberTitle.backgroundColor=[UIColor clearColor];
        numberTitle.font=[UIFont systemFontOfSize:12];
        //priceTitle.textColor=[UIColor lightGrayColor];
        numberTitle.text=@"数量:";
        [cell.contentView addSubview:numberTitle];
        [numberTitle release];
        
        UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(305, 42, 7, 11)];
        arrow.image=[UIImage imageNamed:@"jiantou.png"];
        [cell.contentView addSubview:arrow];
        [arrow release];
        
        numberBg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cartNumber.png"]];
        numberBg.tag=201;
        numberBg.frame=CGRectMake(150, 43, 39, 18);
        numberBg.hidden=YES;
        [cell.contentView addSubview:numberBg];
        [numberBg release];
        //--------------------------正常状态------------------------//
        
        numberLab=[[UILabel alloc]initWithFrame:CGRectMake(130, 45, 78, 14)];
        numberLab.tag=301;
        numberLab.backgroundColor=[UIColor clearColor];
        numberLab.font=[UIFont systemFontOfSize:12];
        [cell.contentView addSubview:numberLab];
        [numberLab release];
        
        priceTitle=[[UILabel alloc]initWithFrame:CGRectMake(93, 60, 30, 14)];
        priceTitle.tag=202;
        priceTitle.backgroundColor=[UIColor clearColor];
        priceTitle.font=[UIFont systemFontOfSize:12];
        //priceTitle.textColor=[UIColor lightGrayColor];
        priceTitle.text=@"单价:";
        [cell.contentView addSubview:priceTitle];
        [priceTitle release];
        
        priceLab=[[UILabel alloc]initWithFrame:CGRectMake(128, 60, 150, 15)];
        priceLab.tag=302;
        priceLab.backgroundColor=[UIColor clearColor];
        priceLab.font=[UIFont systemFontOfSize:12];
        priceLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        [cell.contentView addSubview:priceLab];
        [priceLab release];
        
        totalPriceTitle=[[UILabel alloc]initWithFrame:CGRectMake(93, 75, 30, 14)];
        totalPriceTitle.tag=203;
        totalPriceTitle.backgroundColor=[UIColor clearColor];
        totalPriceTitle.font=[UIFont systemFontOfSize:12];
        //priceTitle.textColor=[UIColor lightGrayColor];
        totalPriceTitle.text=@"合计:";
        [cell.contentView addSubview:totalPriceTitle];
        [totalPriceTitle release];
        
        totalPriceLab=[[UILabel alloc]initWithFrame:CGRectMake(128, 75, 150, 15)];
        totalPriceLab.tag=303;
        totalPriceLab.backgroundColor=[UIColor clearColor];
        totalPriceLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        totalPriceLab.font=[UIFont systemFontOfSize:12];
        [cell.contentView addSubview:totalPriceLab];
        [totalPriceLab release];
        
        //-----------------------编辑状态-----------------//
        minusBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(130, 43, 17, 17) imageName:@"minus.png" tappedImageName:@"minus.png" target:self action:@selector(minusMyNumber:) tag:304];
        [cell.contentView addSubview:minusBtn];
        minusBtn.hidden=YES;
        
        addBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(192, 43, 17, 17) imageName:@"add.png" tappedImageName:@"minus.png" target:self action:@selector(addMyNumber:) tag:305];
        [cell.contentView addSubview:addBtn];
        addBtn.hidden=YES;
        
    }else{
        proView=(EGOImageView *)[cell.contentView viewWithTag:299];
        nameLab=(UILabel *)[cell.contentView viewWithTag:300];
        
        numberLab=(UILabel *)[cell.contentView viewWithTag:301];
        priceLab=(UILabel *)[cell.contentView viewWithTag:302];
        totalPriceLab=(UILabel *)[cell.contentView viewWithTag:303];
        
        numberBg=(UIImageView *)[cell.contentView viewWithTag:201];
        priceTitle=(UILabel *)[cell.contentView viewWithTag:202];
        totalPriceTitle=(UILabel *)[cell.contentView viewWithTag:203];
        
        minusBtn=(UIButton *)[cell.contentView viewWithTag:304];
        addBtn=(UIButton *)[cell.contentView viewWithTag:305];
    }
    ProductObject *aObj=(ProductObject *)[cartArr objectAtIndex:indexPath.row];
    
    proView.image=[UIImage imageNamed:aObj.imageUrl];
    nameLab.text=aObj.name;
    numberLab.text=[NSString stringWithFormat:@"%d",aObj.number];
    priceLab.text=[NSString stringWithFormat:@"￥%.1f",aObj.price];
    totalPriceLab.text=[NSString stringWithFormat:@"￥%.1f",aObj.price*aObj.number];
    
    if (isEditing) {
        priceTitle.hidden=YES;
        totalPriceTitle.hidden=YES;
        priceLab.hidden=YES;
        totalPriceLab.hidden=YES;
        
        minusBtn.hidden=NO;
        addBtn.hidden=NO;
        numberBg.hidden=NO;
        
        numberLab.textAlignment=NSTextAlignmentCenter;
    }else{
        priceTitle.hidden=NO;
        totalPriceTitle.hidden=NO;
        priceLab.hidden=NO;
        totalPriceLab.hidden=NO;
        
        minusBtn.hidden=YES;
        addBtn.hidden=YES;
        numberBg.hidden=YES;

        numberLab.textAlignment=NSTextAlignmentLeft;
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  @"删除";
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//点击删除按钮后调用
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductObject *aObj=(ProductObject *)[cartArr objectAtIndex:indexPath.row];
    totalNumber=totalNumber-aObj.number;
    totalDiscount=totalDiscount-aObj.number*aObj.discount;
    totalPrice=totalPrice-aObj.number*aObj.price;
    
    [cartArr removeObjectAtIndex:indexPath.row];
    NSLog(@"我的数目是------%d",cartArr.count);
    [cartTable reloadData];
}

#pragma mark end

-(void)doMyEdit{
    
    if (isEditing) {
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"allRight.png"] forState:UIControlStateNormal];
        [cartTable setEditing:NO animated:YES];
    }else{
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"allRight_Press.png"] forState:UIControlStateNormal];
        [cartTable setEditing:YES animated:YES];
    }
    
    [self performSelector:@selector(changeMyTableType) withObject:nil afterDelay:0.3];
}

-(void)changeMyTableType{
    
    [cartTable reloadData];
    isEditing=!isEditing;
}

-(void)doMyPay{
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    BOOL isLogin=[myApp checkIfLogin];
    if (!isLogin) {
        [myApp addLoginViewController];
    }
}

-(void)minusMyNumber:(id)sender{
    UIButton *addBtn=(UIButton *)sender;
    UITableViewCell *myCell=(UITableViewCell *)[[addBtn superview] superview];    //获得点击按钮所在的单元格
    NSIndexPath * path = [cartTable indexPathForCell:myCell];
    
    ProductObject *myObj=(ProductObject *)[cartArr objectAtIndex:path.row];
    myObj.number--;
    
    UILabel *numberLab=(UILabel *)[myCell.contentView viewWithTag:301];
    numberLab.text=[NSString stringWithFormat:@"%d",myObj.number];
    
    totalNumber--;
    totalDiscount=totalDiscount-myObj.discount;
    totalPrice=totalPrice-myObj.price;
    
    if (myObj.number==0) {
        [cartArr removeObjectAtIndex:path.row];
        [cartTable reloadData];
    }
}

-(void)addMyNumber:(id)sender{
    UIButton *addBtn=(UIButton *)sender;
    UITableViewCell *myCell=(UITableViewCell *)[[addBtn superview] superview];    //获得点击按钮所在的单元格
    NSIndexPath * path = [cartTable indexPathForCell:myCell];
    
    ProductObject *myObj=(ProductObject *)[cartArr objectAtIndex:path.row];
    myObj.number++;
    
    UILabel *numberLab=(UILabel *)[myCell.contentView viewWithTag:301];
    numberLab.text=[NSString stringWithFormat:@"%d",myObj.number];
    
    totalNumber++;
    totalDiscount=totalDiscount+myObj.discount;
    totalPrice=totalPrice+myObj.price;
}

-(void)goToMyCollect{
    MyCollectViewController *myCollect=[[MyCollectViewController alloc]init];
    [self.navigationController pushViewController:myCollect animated:YES];
    [myCollect release];
}

-(void)viewWillAppear:(BOOL)animated{
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BG.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_press.png"];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(cartArr);
    TT_RELEASE_SAFELY(cartTable);
    [super dealloc];
}

@end
