//
//  CMTableView.m
//  JIAYI
//
//  Created by ChenYuanFang on 11-7-27.
//  Copyright 2011年 softbest1. All rights reserved.
//

#import "CMTableView.h"


@implementation CMTableView
@synthesize mCellType,_reloading,curTarget;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if ((self = [super initWithFrame:frame style:style]))
	{
        self.delegate=self;
        self.dataSource=self;
        //self.backgroundColor=[ComponentsFactory createColorByHex:@"#e1e6eb"];
        
        if (_refreshHeaderView == nil) {
			
			EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height)];
			view.delegate = self;
			[self addSubview:view];
			_refreshHeaderView = view;
			[view release];
        }
		
		//  update the last update date
		[_refreshHeaderView refreshLastUpdatedDate];
        
    }
    return self;
}

- (void)dealloc
{
    
    _refreshHeaderView = nil;
    [super dealloc];
}

-(void)setRefreshTableHeaderHidden:(BOOL)aHidden{
    _refreshHeaderView.hidden = aHidden;
}

#pragma mark CMTableView DataSource Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (mCellType == CELLTYPE_GETMORE) {
        static NSString *moreCellIdentifier = @"moreTableCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellIdentifier];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault//UITableViewCellStyleSubtitle
                                           reuseIdentifier:moreCellIdentifier] autorelease];   
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.backgroundColor=[UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        mCellType = CELLTYPE_NORMAL;
        
       //UIButton *temBtn = (UIButton *)[cell.contentView viewWithTag:100];
       
        
        cell.contentView.backgroundColor=[ComponentsFactory createColorByHex:@"#e1e6eb"];
        cell.textLabel.font=[UIFont systemFontOfSize:13];
        cell.textLabel.text = @"加载更多...";
        cell.textLabel.textColor=[ComponentsFactory createColorByHex:@"#5f7686"];
        return cell;
    }
    
    static NSString *CellNullIdentifier = @"nullTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellNullIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault//UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellNullIdentifier] autorelease];   
        cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = @"没有数据";
    return cell;
    
}




//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//#if DEBUG_LOG
//    NSLog(@"CMTableView row:%d",indexPath.row);
//#endif
//
//}



#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

//开始刷新数据
- (void)reloadTableViewDataSource{
		
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    
    if (curTarget) {
        [curTarget refreshTableData];
    }
	
}

//完成数据加载
- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
	
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
    
    //测试..
	//[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

#pragma mark end



@end
