//
//  ProductDetailsViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-5-2.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//  商品详情页面

#import "ProductDetailsViewController.h"
#import "UIColumnView.h"
#import "DetailColumnCell.h"
#import "DLStarRatingControl.h"
#import "MyCollectViewController.h"
#import "MoreDetailsViewController.h"

@interface ProductDetailsViewController ()

@end

@implementation ProductDetailsViewController

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
    self.title=@"商品详情";
    isPromotions=YES;
    //self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    imgArr=[[NSMutableArray alloc]initWithObjects:@"http://gwimg.shengyijie.net/upload/2012-12-10/b_1702323585.jpg",@"http://hiphotos.baidu.com/%b1%a6%b1%b4%d6%ae%c1%b5love/pic/item/55291e1748e1a11ac83d6dc7.jpg",@"http://www.wines-info.com/UpFile2/2009-04/200904120441167028.jpg",@"http://www.hzjh.net/picup/20111226120162.jpg",@"http://www.huangchuan.co/upload/images/2011-12-31/20111231157387219544.jpg", nil];
//    imgArr=[[NSMutableArray alloc]initWithObjects:@"http://gwimg.shengyijie.net/upload/2012-12-10/b_1702323585.jpg", nil];

    [self layoutMyNav];
    [self layoutMyImageScrollView];
    [self layoutmyDetailView];
    [self layoutMyGoToCollectView];
	// Do any additional setup after loading the view.
}

-(void)layoutMyNav{
    
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
    
    UIButton *rightBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"分享" frame:CGRectMake(0, 0, 42, 30) imageName:@"allRight.png" tappedImageName:@"allRight.png" target:self action:@selector(doMyShare) tag:101];
    UIBarButtonItem *rightBarItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightBarItem];
    [rightBarItem release];
}

-(void)layoutMyImageScrollView{
    imgView=[[UIColumnView alloc]initWithFrame:CGRectMake(-122, 0, 442, 198)];
    imgView.viewDelegate=self;
    imgView.viewDataSource=self;
    imgView.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    [self.view addSubview:imgView];
}

-(void)layoutmyDetailView{
    UITableView *detailTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 198, 320, 176) style:UITableViewStylePlain];
    detailTable.delegate=self;
    detailTable.dataSource=self;
    detailTable.scrollEnabled=NO;
    [self.view addSubview:detailTable];
    [detailTable release];
}

-(void)layoutMyGoToCollectView{
    UIImageView  *bgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"goColectBg.png"]];
    bgView.tag=77;
    bgView.frame=CGRectMake(58, 120, 204, 96);
    bgView.userInteractionEnabled=YES;
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 204, 20)];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.font=[UIFont systemFontOfSize:18];
    titleLab.textColor=[UIColor whiteColor];
    titleLab.text=@"已加入收藏夹";
    [bgView addSubview:titleLab];
    [titleLab release];
    
    UIButton *closeBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(23, 54, 48, 26) IconName:@"closeBt.png" Target:self Action:@selector(closeMyGoToCollectView) ButtonTag:1101 TitleString:nil StringFont:12 IsBold:12 Color:nil];
    [bgView addSubview:closeBtn];
    
    UIButton *goBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(83, 54, 100, 26) IconName:@"goColectBtn.png" Target:self Action:@selector(GoToCollectView) ButtonTag:1102 TitleString:nil StringFont:12 IsBold:12 Color:nil];
    [bgView addSubview:goBtn];
    
    [self.view addSubview:bgView];
    [bgView release];
    bgView.hidden=YES;
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doMyShare{
    UIActionSheet *shareSheet=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"新浪微博分享",@"腾讯微博分享",@"微信分享", nil];
    [shareSheet showInView:self.view];
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"分享到新浪微博");
            break;
        case 1:
            NSLog(@"分享到腾讯微博");
            break;
        case 2:
            NSLog(@"分享到微信");
            break;
        default:
            break;
    }
}

#pragma mark end

#pragma mark -
#pragma mark UIColumnViewDataSource method implementation
- (NSUInteger)numberOfColumnsInColumnView:(UIColumnView *)columnView{
    return imgArr.count+1;
}

- (UITableViewCell *)columnView:(UIColumnView *)columnView viewForColumnAtIndex:(NSUInteger)index{
    static NSString *cellIdentifier = @"DetailColumnCell";
    DetailColumnCell *cell=(DetailColumnCell *)[columnView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell = [[[DetailColumnCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    if (index==0) {
        cell.myView.image=nil;
    }else{
        cell.myView.imageURL=[NSURL URLWithString:[imgArr objectAtIndex:index-1]];
    }
    return cell;
}

#pragma mark -
#pragma mark UIColumnViewDelegate method implementation
- (void)columnView:(UIColumnView *)columnView didSelectColumnAtIndex:(NSUInteger)index {
    NSLog(@"%s selected:%d", __FUNCTION__, index);
}


- (CGFloat)columnView:(UIColumnView *)columnView widthForColumnAtIndex:(NSUInteger)index {
    return 188.0f;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 50;
    }else if(indexPath.row==1){
        return 80;
    }else{
        return 37;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        
        static NSString *CellIdentifier = @"thirdCellIdentifier";
        
        UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIButton *addtoCartBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(10, 5, 220, 41) IconName:@"addMyCartBtn.png" Target:self Action:@selector(addToMyCart) ButtonTag:1001 TitleString:@"" StringFont:12 IsBold:NO Color:nil];
        [cell.contentView addSubview:addtoCartBtn];
        
        UIButton *addtoCollectBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(242, 5, 73, 44) IconName:@"addColectBtn.png" Target:self Action:@selector(addToMyCollect) ButtonTag:1002 TitleString:@"" StringFont:12 IsBold:NO Color:nil];
        [cell.contentView addSubview:addtoCollectBtn];
        
        return cell;

    }else if (indexPath.row==1){
        static NSString *CellIdentifier = @"firstCellIdentifier";
        
        UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        UILabel *mainLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 315, 22)];
        mainLab.tag=101;
        mainLab.backgroundColor=[UIColor clearColor];
        mainLab.font=[UIFont systemFontOfSize:18];
        mainLab.text=@"芝华士12年苏格兰威士忌700ml";
        [cell.contentView addSubview:mainLab];
        [mainLab release];
        
        UILabel *priceLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 32, 40, 14)];
        priceLab.backgroundColor=[UIColor clearColor];
        priceLab.textColor=[UIColor lightGrayColor];
        priceLab.font=[UIFont systemFontOfSize:14];
        priceLab.text=@"价 格:";
        [cell.contentView addSubview:priceLab];
        [priceLab release];
        
        UILabel *myPrice=[[UILabel alloc]initWithFrame:CGRectMake(55, 30, 260, 17)];
        myPrice.tag=102;
        myPrice.backgroundColor=[UIColor clearColor];
        myPrice.textColor=[UIColor colorWithRed:207.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
        myPrice.font=[UIFont systemFontOfSize:16];
        myPrice.text=@"￥1000.0-1020.0";
        [cell.contentView addSubview:myPrice];
        [myPrice release];
        
        UILabel *selectLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 57, 40, 14)];
        selectLab.backgroundColor=[UIColor clearColor];
        selectLab.textColor=[UIColor lightGrayColor];
        selectLab.font=[UIFont systemFontOfSize:14];
        selectLab.text=@"选 择:";
        [cell.contentView addSubview:selectLab];
        [selectLab release];
        
        UIButton *firstBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        firstBtn.tag=701;
        firstBtn.frame=CGRectMake(60, 56, 43, 16);
        [firstBtn setImage:[UIImage imageNamed:@"retail_PressBtn.png"] forState:UIControlStateNormal];
        [firstBtn addTarget:self action:@selector(selectMyPriceType:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:firstBtn];
        
        UIButton *secondBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        secondBtn.tag=702;
        secondBtn.frame=CGRectMake(110, 57, 43, 16);
        //[firstBtn setImage:[UIImage imageNamed:@"retail_PressBtn.png"] forState:UIControlStateNormal];
        [secondBtn addTarget:self action:@selector(selectMyPriceType:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:secondBtn];
        
        UIButton *thirdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        thirdBtn.tag=703;
        thirdBtn.frame=CGRectMake(160, 57, 43, 16);
        [thirdBtn addTarget:self action:@selector(selectMyPriceType:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:thirdBtn];
        
        AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
        BOOL isMember=[myApp checkIfIsMember];
        if (isMember) {
            [secondBtn setImage:[UIImage imageNamed:@"member_NomalBtn.png"] forState:UIControlStateNormal];
            secondBtn.userInteractionEnabled=YES;
        }else{
            [secondBtn setImage:[UIImage imageNamed:@"member_NoBtn.png"] forState:UIControlStateNormal];
            secondBtn.userInteractionEnabled=NO;
        }
        
        if (isPromotions) {
            [thirdBtn setImage:[UIImage imageNamed:@"promotions_NomalBtn.png"] forState:UIControlStateNormal];
            thirdBtn.userInteractionEnabled=YES;
        }else{
            [thirdBtn setImage:[UIImage imageNamed:@"promotions_NoBtn.png"] forState:UIControlStateNormal];
            thirdBtn.userInteractionEnabled=NO;
        }
        
        UIImageView *arrowIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jiantou.png"]];
        arrowIcon.frame=CGRectMake(295, 35, 7, 11);
        [cell.contentView addSubview:arrowIcon];
        [arrowIcon release];
        
        return cell;
        
    }else{
        static NSString *CellIdentifier = @"secondCellIdentifier";
        
        UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UILabel *scoreLab=[[UILabel alloc]initWithFrame:CGRectMake(15, 12, 40, 14)];
        scoreLab.backgroundColor=[UIColor clearColor];
        scoreLab.textColor=[UIColor lightGrayColor];
        scoreLab.font=[UIFont systemFontOfSize:14];
        scoreLab.text=@"评 分:";
        [cell.contentView addSubview:scoreLab];
        [scoreLab release];
        
        DLStarRatingControl *customNumberOfStars = [[DLStarRatingControl alloc] initWithFrame:CGRectMake(55, 11, 80, 15) andStars:5 isFractional:YES];
        customNumberOfStars.backgroundColor=[UIColor clearColor];
        //        customNumberOfStars.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        customNumberOfStars.rating = 4.5;
        customNumberOfStars.userInteractionEnabled=NO;
        [cell.contentView addSubview:customNumberOfStars];
        [customNumberOfStars release];
        
        UILabel *numberLab=[[UILabel alloc]initWithFrame:CGRectMake(135, 11, 180, 15)];
        numberLab.backgroundColor=[UIColor clearColor];
        numberLab.textColor=[UIColor colorWithRed:14.0f/255.0f green:107.0f/255.0f blue:204.0f/255.0f alpha:1.0];
        numberLab.font=[UIFont systemFontOfSize:14];
        numberLab.text=@"(已有评论201条)";
        [cell.contentView addSubview:numberLab];
        [numberLab release];
        
        UIImageView *arrowIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jiantou.png"]];
        arrowIcon.frame=CGRectMake(295, 13, 7, 11);
        [cell.contentView addSubview:arrowIcon];
        [arrowIcon release];
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==1) {
        MoreDetailsViewController *moreDetail=[[MoreDetailsViewController alloc]init];
        [self.navigationController pushViewController:moreDetail animated:YES];
        [moreDetail release];
    }
}

-(void)selectMyPriceType:(id)sender{
    UIButton *myBtn=(UIButton *)sender;
    UITableViewCell *myCell=(UITableViewCell *)[[myBtn superview]superview];
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    BOOL isMember=[myApp checkIfIsMember];
    
    switch (myBtn.tag) {
        case 701:{
            UIButton *btn2=(UIButton *)[myCell.contentView viewWithTag:702];
            UIButton *btn3=(UIButton *)[myCell.contentView viewWithTag:703];
            
            [myBtn setImage:[UIImage imageNamed:@"retail_PressBtn.png"] forState:UIControlStateNormal];
            if (isMember) {
                [btn2 setImage:[UIImage imageNamed:@"member_NomalBtn.png"] forState:UIControlStateNormal];
            }
            if (isPromotions) {
                [btn3 setImage:[UIImage imageNamed:@"promotions_NomalBtn.png"] forState:UIControlStateNormal];
            }
        }
            break;
        case 702:{
            UIButton *btn1=(UIButton *)[myCell.contentView viewWithTag:701];
            UIButton *btn3=(UIButton *)[myCell.contentView viewWithTag:703];
            
            [myBtn setImage:[UIImage imageNamed:@"member_pressBtn.png"] forState:UIControlStateNormal];
            [btn1 setImage:[UIImage imageNamed:@"retail_NomalBtn.png"] forState:UIControlStateNormal];
            if (isPromotions) {
                [btn3 setImage:[UIImage imageNamed:@"promotions_NomalBtn.png"] forState:UIControlStateNormal];
            }
        }
            break;
        case 703:{
            UIButton *btn1=(UIButton *)[myCell.contentView viewWithTag:701];
            UIButton *btn2=(UIButton *)[myCell.contentView viewWithTag:702];
            
            [myBtn setImage:[UIImage imageNamed:@"promotions_PressBtn.png"] forState:UIControlStateNormal];
            [btn1 setImage:[UIImage imageNamed:@"retail_NomalBtn.png"] forState:UIControlStateNormal];
            if (isMember) {
                [btn2 setImage:[UIImage imageNamed:@"member_NomalBtn.png"] forState:UIControlStateNormal];
            }
        }
            break;
        default:
            break;
    }
}

-(void)addToMyCart{
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [myApp addBadgeOnTabBar:1];
}

-(void)addToMyCollect{
    UIImageView *goCollectView=(UIImageView *)[self.view viewWithTag:77];
    goCollectView.hidden=NO;
}


-(void)closeMyGoToCollectView{
    UIImageView *goCollectView=(UIImageView *)[self.view viewWithTag:77];
    goCollectView.hidden=YES;
}

-(void)GoToCollectView{
    UIImageView *goCollectView=(UIImageView *)[self.view viewWithTag:77];
    goCollectView.hidden=YES;
    
    MyCollectViewController *myCollect=[[MyCollectViewController alloc]init];
    [self.navigationController pushViewController:myCollect animated:YES];
    [myCollect release];
}


-(void)viewWillAppear:(BOOL)animated{
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BGwhite.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_presswhite.png"];
    myApp.myTabBar.isLock=YES;
//    myApp.myTabBar.
}

-(void)viewWillDisappear:(BOOL)animated{
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.isLock=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    TT_RELEASE_SAFELY(imgView);
    TT_RELEASE_SAFELY(imgArr);
    [super dealloc];
}

@end
