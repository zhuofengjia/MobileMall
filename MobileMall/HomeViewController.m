//
//  HomeViewController.m
//  SoftBestWine
//
//  Created by Mac_Chen on 13-4-9.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColumnViewCell.h"
#import "MyCollectViewController.h"
#import "BrandWineViewController.h"

#define WIDTH_OF_IMAGE 320
#define HEIGHT_OF_IMAGE 128

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.navigationController.navigationBar.hidden=YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    
    
    [self layoutMyMainScrollView];
    [self layoutMyPhoneView];
    
    
    [self layoutMySearchView];
    
    
	// Do any additional setup after loading the view.
}


-(void)layoutMySearchView{
    UIView *bgSearchView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    bgSearchView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:bgSearchView];
    [bgSearchView release];
    
    UIImageView *SearchView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 47)];
    SearchView.image=[UIImage imageNamed:@"homeSearchNav.png"];
    
    [self.view addSubview:SearchView];
    [SearchView release];
    
    DynamicBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    DynamicBtn.frame=CGRectMake(271, 8, 42, 29);
    [DynamicBtn setBackgroundImage:[UIImage imageNamed:@"homePhoneBtn.png"] forState:UIControlStateNormal];
    [DynamicBtn addTarget:self action:@selector(SearchOrPhone) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DynamicBtn];
    
    mySearchFd=[[UITextField alloc]initWithFrame:CGRectMake(115, 11, 130, 30)];
    mySearchFd.autocapitalizationType=UITextAutocapitalizationTypeNone;
    mySearchFd.delegate=self;
    mySearchFd.returnKeyType=UIReturnKeySearch;
    mySearchFd.userInteractionEnabled=YES;
    mySearchFd.backgroundColor=[UIColor clearColor];
    [self.view addSubview:mySearchFd];
    
    myDeleteBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //deleteBtn.tag=1101;
    myDeleteBtn.frame=CGRectMake(242, 10, 23, 24);
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

-(void)layoutMyPhoneView{
    phongView=[[UIView alloc]initWithFrame:CGRectMake(0, -35, 320, 75)]; //-25
    
    
    UIImageView *phoneBgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homePhoneBg.png"]];
    phoneBgView.frame=CGRectMake(0, 0, 320, 75);
    [phongView addSubview:phoneBgView];
    [phoneBgView release];
    
    UILabel *telLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 320, 20)];
    telLab.backgroundColor=[UIColor clearColor];
    telLab.textColor=[UIColor whiteColor];
    telLab.textAlignment=NSTextAlignmentCenter;
    telLab.text=@"拨打订酒热线:0371-86669999";
    [phongView addSubview:telLab];
    [telLab release];
    
    UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"startPhoneBtn.png"] forState:UIControlStateNormal];
    cancelBtn.frame=CGRectMake(50, 32, 95, 32);
    cancelBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelMyPhone) forControlEvents:UIControlEventTouchUpInside];
    [phongView addSubview:cancelBtn];
        
    UIButton *startBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"startPhoneBtn.png"] forState:UIControlStateNormal];
    startBtn.frame=CGRectMake(175, 32, 95, 32);
    startBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [startBtn setTitle:@"继续" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startMyPhone) forControlEvents:UIControlEventTouchUpInside];
    [phongView addSubview:startBtn];
    
    [self.view addSubview:phongView];
}


-(void)layoutMyMainScrollView{
//    NSLog(@">>>>>>>>>>>>%f",MY_HEIGHT);
    mainView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, 320, MY_HEIGHT-44-52)];
    mainView.delegate=self;
    mainView.scrollEnabled=YES;
    
    mainView.contentSize=CGSizeMake(320, 740);
    mainView.bounces=NO;
    mainView.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    
    mainView.showsHorizontalScrollIndicator=NO;
    mainView.showsVerticalScrollIndicator=NO;
    
    
    
    UIImageView *noticeBgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 25)];
    noticeBgView.image=[UIImage imageNamed:@"homeNoticeBg.png"];
    [mainView addSubview:noticeBgView];
    [noticeBgView release];
    
    UIImageView *noticeIcon=[[UIImageView alloc]initWithFrame:CGRectMake(8, 4, 11, 17)];
    noticeIcon.image=[UIImage imageNamed:@"homeNotice.png"];
    [mainView addSubview:noticeIcon];
    [noticeIcon release];

    UILabel *noticeLab=[[UILabel alloc]initWithFrame:CGRectMake(24, 6, 290, 17)];
    noticeLab.backgroundColor=[UIColor clearColor];
    noticeLab.textAlignment=NSTextAlignmentLeft;
    noticeLab.font=[UIFont systemFontOfSize:14];
    noticeLab.text=@"酒便利名庄酒特惠活动";
    [mainView addSubview:noticeLab];
    [noticeLab release];
    
    
//-------------------------------------------------------------------------------
    NSMutableArray *adShowArr=[[NSMutableArray alloc]init];
    NSMutableArray *adShowTitleArr=[[NSMutableArray alloc]init];
    NSMutableArray *adShowUrlArr=[[NSMutableArray alloc]init];
    
    [adShowArr addObject:@"http://pic2.nipic.com/20090422/1729271_184651001_2.jpg"];
    [adShowArr addObject:@"http://pic4.nipic.com/20091023/2552416_125146017204_2.jpg"];
    [adShowArr addObject:@"http://pic15.nipic.com/20110801/7068021_175940485343_2.jpg"];
    [adShowArr addObject:@"http://pic17.nipic.com/20111104/6259312_185121300346_2.jpg"];
    [adShowArr addObject:@"http://t1.baidu.com/it/u=3161971423,9157292&fm=21&gp=0.jpg"];
    
    
    [adShowTitleArr addObject:@"111"];
    [adShowTitleArr addObject:@"222"];
    [adShowTitleArr addObject:@"333"];
    [adShowTitleArr addObject:@"444"];
    [adShowTitleArr addObject:@"555"];
    
    
    
    [adShowUrlArr addObject:@""];
    [adShowUrlArr addObject:@""];
    [adShowUrlArr addObject:@""];
    [adShowUrlArr addObject:@""];
    [adShowUrlArr addObject:@""];
    
    
    adShowView=[[CycleScrollView alloc]initWithFrame:CGRectMake(0, 25, 320, 128) cycleDirection:1 pictures:adShowArr titles:adShowTitleArr tribuneIds:adShowUrlArr];
    adShowView.mystartImg=@"homeWaitBig.png";
    
    [adShowArr release];
    [adShowTitleArr release];
    [adShowUrlArr release];
    
    adShowView.theDelegate=self;
    [mainView addSubview:adShowView];
    [self updateScrollView];
    //[NSThread detachNewThreadSelector:@selector(updateScrollView) toTarget:self withObject:nil];
    //[adShowView release];
    
    for (int i=0; i<8; i++) {
        UIButton *selectBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        selectBtn.tag=500+i;
        //selectBtn.backgroundColor=[UIColor blackColor];
        [selectBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"homeBtn_%d.png",i]] forState:UIControlStateNormal];
        [selectBtn addTarget:self action:@selector(goToMyBtnView:) forControlEvents:UIControlEventTouchUpInside];
        
        float myX=(i%4)*(19.2+56)+19.2;
        
        float myY=(i/4)*(20+72)+20+170;
        
        selectBtn.frame=CGRectMake(myX, myY, 56, 72);
        
        [mainView addSubview:selectBtn];
        
    }
    
//----------------------------------------------------------------------------------
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 380, 320, 1)];
    lineView.backgroundColor=[UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    [mainView addSubview:lineView];
    [lineView release];
    
    UIImageView *myStarIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeShowIcon.png"]];
    myStarIcon.frame=CGRectMake(5, 395, 16, 20);
    [mainView addSubview:myStarIcon];
    [myStarIcon release];
    
    UILabel *myStarLab=[[UILabel alloc]initWithFrame:CGRectMake(26, 398, 150, 16)];
    myStarLab.backgroundColor=[UIColor clearColor];
    myStarLab.font=[UIFont systemFontOfSize:15];
    myStarLab.textColor=[UIColor colorWithRed:210.0/255.0 green:5.0/255.0 blue:6.0/255.0 alpha:1.0];
    myStarLab.text=@"明星单品";
    [mainView addSubview:myStarLab];
    [myStarLab release];
    
    startTableView =[[UIColumnView alloc]initWithFrame:CGRectMake(0, 430, 320, 130)];
    startTableView.viewDelegate=self;
    startTableView.viewDataSource=self;
    startTableView.backgroundColor=[UIColor clearColor];
    startTableView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
    [mainView addSubview:startTableView];
    
    
    UIImageView *myInterestingIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeShowIcon.png"]];
    myInterestingIcon.frame=CGRectMake(5, 565, 16, 20);
    [mainView addSubview:myInterestingIcon];
    [myInterestingIcon release];
    
    UILabel *myInterestingLab=[[UILabel alloc]initWithFrame:CGRectMake(26, 568, 150, 16)];
    myInterestingLab.backgroundColor=[UIColor clearColor];
    myInterestingLab.font=[UIFont systemFontOfSize:15];
    myInterestingLab.textColor=[UIColor colorWithRed:210.0/255.0 green:5.0/255.0 blue:6.0/255.0 alpha:1.0];
    myInterestingLab.text=@"您可能感兴趣的";
    [mainView addSubview:myInterestingLab];
    [myInterestingLab release];
    
    interestingTbaleView=[[UIColumnView alloc]initWithFrame:CGRectMake(0, 600, 320, 130)];
    interestingTbaleView.viewDelegate=self;
    interestingTbaleView.viewDataSource=self;
    interestingTbaleView.backgroundColor=[UIColor clearColor];
    interestingTbaleView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
    [mainView addSubview:interestingTbaleView];
    
    
    [self.view addSubview:mainView];
}

#pragma mark -
#pragma mark UIColumnViewDelegate method implementation

- (void)columnView:(UIColumnView *)columnView didSelectColumnAtIndex:(NSUInteger)index {
    NSLog(@"%s selected:%d", __FUNCTION__, index);
}


- (CGFloat)columnView:(UIColumnView *)columnView widthForColumnAtIndex:(NSUInteger)index {
    return 100.0f;
}


#pragma mark -
#pragma mark UIColumnViewDataSource method implementation

- (NSUInteger)numberOfColumnsInColumnView:(UIColumnView *)columnView {
    if (columnView==startTableView) {
        return 4;
    }else{
        return 4;
    }
}

- (UITableViewCell *)columnView:(UIColumnView *)columnView viewForColumnAtIndex:(NSUInteger)index {
    if (columnView==startTableView) {
        static NSString *cellIdentifier = @"startCell";
        UIColumnViewCell *cell = (UIColumnViewCell *)[columnView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[[UIColumnViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        }
        return cell;
    }else{
        static NSString *cellIdentifier = @"interstingCell";
        UIColumnViewCell *cell = (UIColumnViewCell *)[columnView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[[UIColumnViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        }
        return cell;
    }
}

//八个按钮对应的触发方法
-(void)goToMyBtnView:(id)sender{
    UIButton *myBtn=(UIButton *)sender;
    int myChoose=myBtn.tag-500;
    
    switch (myChoose) {
        case 0:
            NSLog(@"去促销抢购");
            break;
        case 1:
            NSLog(@"去买酒推荐");
            break;
        case 2:
            NSLog(@"去新品专区");
            break;
        case 3:
            NSLog(@"去热卖排行");
            break;
        case 4:
            NSLog(@"去条码扫描");
            break;
        case 5:
            NSLog(@"去我的收藏");
            MyCollectViewController *myCollect=[[MyCollectViewController alloc]init];
            [self.navigationController pushViewController:myCollect animated:NO];
            [myCollect release];
            break;
        case 6:
            NSLog(@"去浏览记录");
            break;
        case 7:
            NSLog(@"去名酒品牌");
            BrandWineViewController *mybrand=[[BrandWineViewController alloc]init];
            [self.navigationController pushViewController:mybrand animated:YES];
            [mybrand release];
            break;
            
        default:
            break;
    }
}

//实现图片的自动滚动
- (void) updateScrollView
{
    [myTimer invalidate];
    myTimer = nil;
    NSTimeInterval timeInterval = 3;
    //timer
    myTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self
                                             selector:@selector(handleMaxShowTimer:)
                                             userInfo: nil
                                              repeats:YES];
}


- (void)handleMaxShowTimer:(NSTimer*)theTimer
{
    CGPoint pt = adShowView.scrollView.contentOffset;
    int count = 5;
    if(pt.x == 320 * count){
        [adShowView.scrollView setContentOffset:CGPointMake(0, 0)];
        [adShowView.scrollView scrollRectToVisible:CGRectMake(WIDTH_OF_IMAGE,0,WIDTH_OF_IMAGE,HEIGHT_OF_IMAGE) animated:YES];
    }else{
        [adShowView.scrollView scrollRectToVisible:CGRectMake(pt.x+WIDTH_OF_IMAGE,0,WIDTH_OF_IMAGE,HEIGHT_OF_IMAGE) animated:YES];
    }
}


#pragma mark CycleScrollView delegate
-(void)tipImageForTribuneAction:(CycleScrollView *)object title:(NSString*)triTitle triId:(NSString *)triId{
    NSLog(@"hahahahahahhaha");
}

-(void)cancelMyPhone{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    phongView.frame=CGRectMake(0, -35, 320, 75);
    [UIView commitAnimations];
}
-(void)startMyPhone{
    NSString *myCallStr=[NSString stringWithFormat:@"0371-86669999"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:myCallStr]];
}


-(void)SearchOrPhone{
    if (isSearching) {
        [self cancelMySearch];
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.30];
        [UIView setAnimationDelegate:self];
        phongView.frame=CGRectMake(0, 44, 320, 75);
        [UIView commitAnimations];
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
    [self changeMySearchToPhone];
    
}

-(void)deleteMySearchText{
    mySearchFd.text=@"";
    //UIButton *myDeleteBtn=(UIButton *)[self.view viewWithTag:1101];
    myDeleteBtn.hidden=YES;
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    isSearching=YES;
    if (textField==mySearchFd) {
        [self changeMyPhoneToSearch];
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

-(void)changeMyPhoneToSearch{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    DynamicBtn.frame=CGRectMake(292, 22, 0, 0);
    [UIView commitAnimations];
    [DynamicBtn setBackgroundImage:[UIImage imageNamed:@"homeCancelBtn.png"] forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    DynamicBtn.frame=CGRectMake(271, 8, 42, 29);
    [UIView commitAnimations];
}
-(void)changeMySearchToPhone{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    DynamicBtn.frame=CGRectMake(292, 22, 0, 0);
    [UIView commitAnimations];
    [DynamicBtn setBackgroundImage:[UIImage imageNamed:@"homePhoneBtn.png"] forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    DynamicBtn.frame=CGRectMake(271, 8, 42, 29);
    [UIView commitAnimations];
}

//改变tabBar的图片，实现类似透明的效果，隐藏系统导航条（该方法为系统方法，在每一次本View出现的时候自动调用）
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
    
    AppDelegate *myApp=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    myApp.myTabBar.imgView.image=[UIImage imageNamed:@"TabBar_BG.png"];
    myApp.myTabBar.slideBg.image=[UIImage imageNamed:@"TabBar_press.png"];
}

//显示系统导航条（该方法为系统方法，在每一次本View消失的时候自动调用）
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}


-(void)dealloc{
    
    TT_RELEASE_SAFELY(mySearchFd);
    TT_RELEASE_SAFELY(DynamicBtn);
    TT_RELEASE_SAFELY(cancelCor);
    TT_RELEASE_SAFELY(phongView);
    TT_RELEASE_SAFELY(mainView);
    TT_RELEASE_SAFELY(myDeleteBtn);
    TT_RELEASE_SAFELY(adShowView);
    TT_RELEASE_SAFELY(startTableView);
    TT_RELEASE_SAFELY(interestingTbaleView);
    [super dealloc];
}



@end
