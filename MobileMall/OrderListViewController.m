//
//  orderListViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-10.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import "OrderListViewController.h"
#import "OrdersObject.h"

@interface OrderListViewController ()

@end

@implementation OrderListViewController

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
    [self setMyTestData];
    [self layoutMyNavView];
    [self layoutMyMainVIew];
	// Do any additional setup after loading the view.
}

-(void)setMyTestData{
    OrdersObject *aObj1=[[OrdersObject alloc]init];
    aObj1.uid=@"3230339890";
    aObj1.date=@"2013年04月19日  13:44:56";
    aObj1.status=@"等待发货";
    aObj1.price=@"￥1400.0";
    
    OrdersObject *aObj2=[[OrdersObject alloc]init];
    aObj2.uid=@"3230339543";
    aObj2.date=@"2013年04月19日  13:44:56";
    aObj2.status=@"等待发货";
    aObj2.price=@"￥700.0";
    
    OrdersObject *aObj3=[[OrdersObject alloc]init];
    aObj3.uid=@"3230987685";
    aObj3.date=@"2013年04月19日  13:44:56";
    aObj3.status=@"等待发货";
    aObj3.price=@"￥970.0";
    
    OrdersObject *aObj4=[[OrdersObject alloc]init];
    aObj4.uid=@"3212765436";
    aObj4.date=@"2013年04月19日  13:44:56";
    aObj4.status=@"等待发货";
    aObj4.price=@"￥570.0";
    
    ordersArr=[[NSMutableArray alloc]initWithObjects:aObj1,aObj2,aObj3,aObj4, nil];
    [aObj1 release];
    [aObj2 release];
    [aObj3 release];
    [aObj4 release];
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

-(void)layoutMyMainVIew{
    UITableView *mainTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-64) style:UITableViewStyleGrouped];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.backgroundView.alpha=0.0f;
    [self.view addSubview:mainTable];
    [mainTable release];
    [self setExtraCellLineHidden:mainTable];
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
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ordersArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *idLab;
    UILabel *dateLab;
    UILabel *statusLab;
    UILabel *priceLab;
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 8, 55, 15) Font:[UIFont systemFontOfSize:13] Text:@"订单号:" Color:[UIColor blackColor]];
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 28, 60, 15) Font:[UIFont systemFontOfSize:13] Text:@"下单时间:" Color:[UIColor blackColor]];
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 48, 60, 15) Font:[UIFont systemFontOfSize:13] Text:@"订单状态:" Color:[UIColor blackColor]];
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 68, 60, 15) Font:[UIFont systemFontOfSize:13] Text:@"应付金额:" Color:[UIColor blackColor]];
        
        idLab=[[UILabel alloc]initWithFrame:CGRectMake(65, 8, 200, 15)];
        idLab.tag=401;
        idLab.backgroundColor=[UIColor clearColor];
        idLab.textColor=[UIColor colorWithRed:64.0/255.0 green:131.0/255.0 blue:211.0/255.0 alpha:1.0];
        idLab.font=[UIFont systemFontOfSize:13];
        [cell.contentView addSubview:idLab];
        [idLab release];
        
        dateLab=[[UILabel alloc]initWithFrame:CGRectMake(70, 28, 200, 15)];
        dateLab.tag=402;
        dateLab.backgroundColor=[UIColor clearColor];
        dateLab.textColor=[UIColor blackColor];
        dateLab.font=[UIFont systemFontOfSize:13];
        [cell.contentView addSubview:dateLab];
        [dateLab release];
        
        statusLab=[[UILabel alloc]initWithFrame:CGRectMake(70, 48, 200, 15)];
        statusLab.tag=403;
        statusLab.backgroundColor=[UIColor clearColor];
        statusLab.textColor=[UIColor blackColor];
        statusLab.font=[UIFont systemFontOfSize:13];
        [cell.contentView addSubview:statusLab];
        [statusLab release];
        
        priceLab=[[UILabel alloc]initWithFrame:CGRectMake(70, 68, 200, 15)];
        priceLab.tag=404;
        priceLab.backgroundColor=[UIColor clearColor];
        priceLab.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        priceLab.font=[UIFont systemFontOfSize:14];
        [cell.contentView addSubview:priceLab];
        [priceLab release];
    }else{
        idLab=(UILabel *)[cell.contentView viewWithTag:401];
        dateLab=(UILabel *)[cell.contentView viewWithTag:402];
        statusLab=(UILabel *)[cell.contentView viewWithTag:403];
        priceLab=(UILabel *)[cell.contentView viewWithTag:404];
    }
    OrdersObject *myObj=(OrdersObject *)[ordersArr objectAtIndex:indexPath.row];
    idLab.text=myObj.uid;
    dateLab.text=myObj.date;
    statusLab.text=myObj.status;
    priceLab.text=myObj.price;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
