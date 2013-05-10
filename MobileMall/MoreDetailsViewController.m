//
//  MoreDetailsViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-9.
//  Copyright (c) 2013年 ChenYuanFang. All rights reserved.
//

#import "MoreDetailsViewController.h"

@interface MoreDetailsViewController ()

@end

@implementation MoreDetailsViewController

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
    self.title=@"详细介绍";
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
    
    [self layoutMyMainView];
    
    [self setMyDetailsData];
	// Do any additional setup after loading the view.
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)layoutMyMainView{
    UILabel *nameLab=[ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(10, 10, 300, 20) Font:[UIFont systemFontOfSize:15] Text:@"" Color:[UIColor blackColor]];
    nameLab.tag=501;
    
    [ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(10, 35, 40, 20) Font:[UIFont systemFontOfSize:15] Text:@"产区:" Color:[UIColor grayColor]];
    
    UILabel *placeLab=[ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(60, 35, 260, 20) Font:[UIFont systemFontOfSize:15] Text:@"" Color:[UIColor grayColor]];
    placeLab.tag=502;
    
    [ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(10, 60, 55, 20) Font:[UIFont systemFontOfSize:15] Text:@"酒精度:" Color:[UIColor grayColor]];
    
    UILabel *alcoholLab=[ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(75, 60, 260, 20) Font:[UIFont systemFontOfSize:15] Text:@"" Color:[UIColor grayColor]];
    alcoholLab.tag=503;
    
    [ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(10, 85, 40, 20) Font:[UIFont systemFontOfSize:15] Text:@"容量:" Color:[UIColor grayColor]];
    
    UILabel *capacityLab=[ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(60, 85, 260, 20) Font:[UIFont systemFontOfSize:15] Text:@"" Color:[UIColor grayColor]];
    capacityLab.tag=504;
    
    [ComponentsFactory drawLabelInView:self.view Frame:CGRectMake(10, 112, 100, 20) Font:[UIFont systemFontOfSize:15] Text:@"商品介绍" Color:[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
    
    UIWebView *detailView=[[UIWebView alloc]initWithFrame:CGRectMake(10, 135, 300, MY_HEIGHT-64-135)];
    detailView.tag=505;
    NSArray *webViewSubViews = [NSArray arrayWithArray:[detailView subviews]];
    UIScrollView *webScroller = (UIScrollView *)[webViewSubViews objectAtIndex:0];
    //webScroller.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    //webScroller.scrollEnabled=NO;
    webScroller.pagingEnabled=YES;
    webScroller.directionalLockEnabled=YES;
    webScroller.showsHorizontalScrollIndicator=NO;
    webScroller.showsVerticalScrollIndicator=NO;
    webScroller.bounces=NO;
    [self.view addSubview:detailView];
    [detailView release];
}

-(void)setMyDetailsData{
    UILabel *namelab=(UILabel *)[self.view viewWithTag:501];
    UILabel *placeLab=(UILabel *)[self.view viewWithTag:502];
    UILabel *alcoholLab=(UILabel *)[self.view viewWithTag:503];
    UILabel *capacityLab=(UILabel *)[self.view viewWithTag:504];
    UIWebView *detailView=(UIWebView *)[self.view viewWithTag:505];
    
    namelab.text=@"芝华士12年苏格兰威士忌";
    placeLab.text=@"法国";
    alcoholLab.text=@"12.5%";
    capacityLab.text=@"750ml";
    
    NSString *webStr=@"<!DOCTYPE html PUBLIC -//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><body><div class='proDetails'><a   name='xiangqingTop'>&nbsp;</a><h3><a class='hover'>商品详情</a><a href='#productComment'>用户评价</a><a href='#zixunTop'>商品咨询</a><a href='http://www.yesmywine.com/marketing/safeShopping/safeShopping.html' target='_blank'>安心购物计划</a></h3><div class='clear'></div><div class='xiangqing'><ul><li><span class='nobg' title='烈酒'><b>产品分类</b><a href='http://list.yesmywine.com/z3/'>烈酒</a></span></li><li><span class='nobg' title='英国(UK)'><b>产地</b>英国(UK)</span></li><li><span class='nobg' title='无'><b>产区</b>无</span></li><li><span class='nobg' title='多款不同的单纯麦威士忌和谷物威士忌'><b>酿造原材料</b>多款不同的单纯麦威士忌和...</span></li><li><span class='nobg' title='40.0%'><b>酒精度</b>40.0%</span></li><li><span class='nobg' title='700ml'><b>容量</b>700ml</span></li><li><span class='nobg' title='饱满的秋果香与温柔的花蜜香味'><b>香味类别</b>饱满的秋果香与温柔的花蜜...</span></li><li><span class='nobg' title='琥珀色'><b>色泽</b>琥珀色</span></li><li><span class='nobg' title='12年以上'><b>陈酿时间</b>12年以上</span></li><li><span class='nobg' title='芝华士12年的特佳酒质，已成为举世公认衡量优质苏格兰威士忌的标准。其高贵银箔纸盒装潢，更是人所共知。十二年陈酿的芝华士12年，品质永远保持水准，成为有史以来声誉最高的苏格兰优质威士忌。时至今日，芝华士12年威士忌的名字，就是“卓越不凡”的意思。芝华士也是目前各地酒吧销量最好的洋酒之一，流行喝法是加绿茶或者红茶及冰块。'><b>酒品介绍</b>芝华士12年的特佳酒质，已...</span></li></ul></div></body></html>";
    [detailView loadHTMLString:webStr baseURL:nil];
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

@end
