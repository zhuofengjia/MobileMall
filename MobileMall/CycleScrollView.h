//
//  CycleScrollView.h
//  imageCircle
//
//  Created by Mac_Chen on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//  首页循环滚动控件

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
@protocol CycleScrollViewDelegate;

typedef enum _CycleDirection

{ PortaitDirection,
    LandscapeDirection
} 
CycleDirection;

@interface CycleScrollView :UIView<UIScrollViewDelegate> {
    id <CycleScrollViewDelegate> theDelegate;
    
    UIPageControl *pageControl;
    
    UILabel *titleLable;
    UIView *lableView;
    
    UIScrollView*scrollView;
    
    UIImageView*curImageView;
    
    int totalPage; 
    int curPage;
    
    CGRect scrollFrame;
    
    CycleDirection scrollDirection; // scrollView滚动的方向 
    NSArray*imagesArray; //存放所有需要滚动的图片 
    NSMutableArray *curImages; //存放当前滚动的三张图片
    
    NSArray *imgtitlesArray;//存放图片名字的数组
    NSArray *imgidsArray;//存放图片id的数组
}
@property(nonatomic,retain)id <CycleScrollViewDelegate> theDelegate;
@property(nonatomic,copy)NSString *mystartImg;
@property(nonatomic,retain)UIScrollView*scrollView;
- (int) validPageValue:(NSInteger)value;
- (id) initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSArray*)pictureArray titles:(NSArray*)titleArray tribuneIds:(NSArray *)idsArray;
- (NSArray*) getDisplayImagesWithCurpage:(int)page;
- (void) refreshScrollView;
@end

@protocol CycleScrollViewDelegate <NSObject>

-(void)tipImageForTribuneAction:(CycleScrollView *)object title:(NSString*)triTitle triId:(NSString *)triId;

@end