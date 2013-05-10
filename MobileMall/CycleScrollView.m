//
//  CycleScrollView.m
//  imageCircle
//
//  Created by Mac_Chen on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CycleScrollView.h"

@implementation CycleScrollView
@synthesize theDelegate;
@synthesize mystartImg;
@synthesize scrollView;
- (id) initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSArray*)pictureArray titles:(NSArray*)titleArray tribuneIds:(NSArray *)idsArray
{ 
    self=[super initWithFrame:frame]; 
    if(self) 
    { 
        scrollFrame=frame; 
        scrollDirection=direction; 
        totalPage=[pictureArray count]; 
        curPage=1; //当前显示的是图片数组里的第一张图片 
        curImages=[[NSMutableArray alloc] init];
        
        imagesArray=[[NSArray alloc] initWithArray:pictureArray];
        imgtitlesArray=[[NSArray alloc] initWithArray:titleArray];
        imgidsArray=[[NSArray alloc] initWithArray:idsArray];
        
        scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 144)];
        // scrollView.backgroundColor=[UIColor blueColor];
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.pagingEnabled=YES;
        scrollView.delegate=self;
        
        [self addSubview:scrollView];
        
        
        // pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, 116, frame.size.width, 28)];
        pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, 120, 320, 28)];
        NSString *tempVersion = [[UIDevice currentDevice] systemVersion];
        NSString *subV = [tempVersion substringToIndex:1];
        if ([subV intValue]>=6) {
            pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:54.0/255.0 green:130.0/255.0 blue:227.0/255.0 alpha:1.0];
        }
        
        pageControl.backgroundColor=[UIColor clearColor];
        pageControl.alpha=1.0;
        pageControl.currentPage=0;
        pageControl.numberOfPages=[pictureArray count];
        
        [self addSubview:pageControl];
        [pageControl release];
        
        
        if(scrollDirection==PortaitDirection) //在竖直方向滚动
            
        {
            
            scrollView.contentSize=CGSizeMake(scrollView.frame.size.width,scrollView.frame.size.height*3); //竖直方法可以存放三张图片
            
        }
        
        if(scrollDirection==LandscapeDirection) //在水平方向滚动
            
        {
            
            scrollView.contentSize=CGSizeMake(scrollView.frame.size.width*3,scrollView.frame.size.height);
            
        }
        
        [self addSubview:scrollView];
        [self addSubview:pageControl];
        [self refreshScrollView];
        lableView=[[UIView alloc] initWithFrame:CGRectMake(0, 116, 240, 28)];
        lableView.backgroundColor=[UIColor blackColor];
        lableView.alpha=0.5;
        
        
        titleLable=[[UILabel alloc] initWithFrame:CGRectMake(0, 116, 240, 28)];
        titleLable.backgroundColor=[UIColor clearColor];
        UIFont *titleFont=[UIFont systemFontOfSize:14];
        titleLable.textAlignment=NSTextAlignmentLeft;
        titleLable.textColor=[UIColor whiteColor];
        titleLable.font=titleFont;
        titleLable.text=[titleArray objectAtIndex:0];
        
        
        //[self addSubview:lableView];
        //[self addSubview:titleLable];
        
        
//        [lableView release];
//        [titleLable release];
    }
    
    return self;
    
}

- (void) refreshScrollView

{
    
    NSArray*subViews=[scrollView subviews];
    
    if([subViews count]!=0)
        
    {
        
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
    }
    
    
    
    [self getDisplayImagesWithCurpage:curPage];
    
    EGOImageView*preView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:mystartImg]];
    preView.frame=CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    
    EGOImageView*curView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:mystartImg]];
    curView.frame=CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    
    EGOImageView*lastView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:mystartImg]];
    lastView.frame=CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    
    preView.imageURL=[NSURL URLWithString:[curImages objectAtIndex:0]];
    curView.imageURL=[NSURL URLWithString:[curImages objectAtIndex:1]];
    lastView.imageURL=[NSURL URLWithString:[curImages objectAtIndex:2]];

    [scrollView addSubview:preView];
    
    [scrollView addSubview:curView];
    
    [scrollView addSubview:lastView];
    
    [preView release];
    
    [curView release];
    
    [lastView release];
    
    
    UIButton *preBut=[UIButton buttonWithType:UIButtonTypeCustom];
    preBut.frame=CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    //[preBut setImage:preImage forState:UIBarButtonItemStylePlain];
    preBut.backgroundColor=[UIColor clearColor];
    [preBut addTarget:self action:@selector(imageTribuneAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *curBut=[UIButton buttonWithType:UIButtonTypeCustom];
    curBut.frame=CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    //[curBut setImage:curImage forState:UIBarButtonItemStylePlain];
    curBut.backgroundColor=[UIColor clearColor];
    [curBut addTarget:self action:@selector(imageTribuneAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lastBut=[UIButton buttonWithType:UIButtonTypeCustom];
    lastBut.frame=CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    lastBut.backgroundColor=[UIColor clearColor];
    //[lastBut setImage:lastImage forState:UIBarButtonItemStylePlain];
    [lastBut addTarget:self action:@selector(imageTribuneAction) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:preBut];
    [scrollView addSubview:curBut];
    [scrollView addSubview:lastBut];
    
    if(scrollDirection==PortaitDirection) //竖直滚动
        
    {
        //        
        preBut.frame=CGRectOffset(preBut.frame, 0, 0);
        
        curBut.frame=CGRectOffset(curBut.frame, 0,scrollFrame.size.height);
        
        lastBut.frame=CGRectOffset(lastBut.frame, 0,2*scrollFrame.size.height);
        
        preView.frame=CGRectOffset(preView.frame, 0, 0);
        
        curView.frame=CGRectOffset(curView.frame, 0,scrollFrame.size.height);
        
        lastView.frame=CGRectOffset(lastView.frame, 0,2*scrollFrame.size.height);
        
        
        [scrollView setContentOffset:CGPointMake(0,scrollFrame.size.height)];
        
    }
    
    
    
    if(scrollDirection==LandscapeDirection) //水平滚动
        
    {
        
        preBut.frame=CGRectOffset(preBut.frame, 0, 0);
        
        curBut.frame=CGRectOffset(curBut.frame, scrollFrame.size.width,0);
        
        lastBut.frame=CGRectOffset(lastBut.frame,scrollFrame.size.width*2, 0);
        preView.frame=CGRectOffset(preView.frame, 0, 0);
        
        curView.frame=CGRectOffset(curView.frame, scrollFrame.size.width,0);
        
        lastView.frame=CGRectOffset(lastView.frame,scrollFrame.size.width*2, 0);
        
        
        [scrollView setContentOffset:CGPointMake(scrollFrame.size.width,0)];
        
    }
    
}
-(void)imageTribuneAction{
    
    
    int tempTag=pageControl.currentPage;
    NSString *tempString=[imgtitlesArray objectAtIndex:tempTag];
    int tempId=[[imgidsArray objectAtIndex:tempTag] intValue]; 
    NSLog(@"得到的title:%@得到的id:%d",tempString,tempId);
    [theDelegate tipImageForTribuneAction:self title:tempString triId:[imgidsArray objectAtIndex:tempTag]];
    //    TribuneDetailsViewController *tribuneDetailsView=[[TribuneDetailsViewController alloc]initWithNibName:@"TribuneDetailsViewController" bundle:nil];
    //    tribuneDetailsView.topicid=[imgidsArray objectAtIndex:tempTag];
    // //   tribuneDetailsView.topicTitle=[imgidsArray objectAtIndex:tempTag];
    ////    tribuneDetailsView.topicReplies=obj.replies;
    ////    tribuneDetailsView.topicViews=obj.views;
    //    tribuneDetailsView.hidesBottomBarWhenPushed=YES;
    //    
    //   // [self.navigationController pushViewController:tribuneDetailsView animated:YES];
    //    [tribuneDetailsView release];
    
}
- (NSArray*) getDisplayImagesWithCurpage:(int)page

{
    
    int pre=[self validPageValue:curPage-1];
    
    int last=[self validPageValue:curPage+1];
    
    if([curImages count]!=0) [curImages removeAllObjects];
    
    [curImages addObject:[imagesArray objectAtIndex:pre-1]];
    
    [curImages addObject:[imagesArray objectAtIndex:curPage-1]];
    
    [curImages addObject:[imagesArray objectAtIndex:last-1]];
    
    return curImages;
    
}

- (int)validPageValue:(NSInteger)value

{
    
    if(value==0) value=totalPage; //value＝1为第一张，value=0为前面一张
    
    if(value==totalPage+1) value=1;
    
    return value;
    
}

- (void) scrollViewDidScroll:(UIScrollView *)crollView

{
    
    int x=crollView.contentOffset.x;
    
    int y=crollView.contentOffset.y;
    
    if(scrollDirection==LandscapeDirection) //水平滚动
        
    {
        
        if(x>=2*scrollFrame.size.width) //往下翻一张
            
        {
            
            curPage=[self validPageValue:curPage+1];
            
            [self refreshScrollView];
            
        }
        
        
        
        if(x<=0)
            
        {
            
            curPage=[self validPageValue:curPage-1];
            
            [self refreshScrollView];
            
        }
        
    }
    
    
    
    //竖直滚动
    
    if(scrollDirection==PortaitDirection)
        
    {
        
        if(y>=2*scrollFrame.size.height){
            
            curPage=[self validPageValue:curPage+1];
            
            [self refreshScrollView];
            
        }
        if (y<=0) {
            curPage=[self validPageValue:curPage-1];
            
            [self refreshScrollView];
        }
        
    }
    pageControl.currentPage=curPage-1;
    titleLable.text=[imgtitlesArray objectAtIndex:pageControl.currentPage];
}

- (void)dealloc

{
    
    [imagesArray release];
    
    [curImages release];
    
    [mystartImg release];
    
    [super dealloc];
    
}
@end