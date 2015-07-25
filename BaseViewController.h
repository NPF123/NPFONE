//
//  BaseViewController.h
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "Model.h"
@interface BaseViewController : UIViewController
{

    BOOL _isDone;
    UIScrollView *_scrollView;
    NSMutableArray *_dataArr;
    AFHTTPRequestOperationManager *_manager;
    NSInteger _currentPage;
    BOOL _isRefreshing;
    BOOL _isLoadMore;
}
@property (nonatomic,retain)UIScrollView *scrollView;
@property (nonatomic,assign)NSInteger currentPage;
@property(nonatomic,assign) BOOL  isRefreshing;
@property(nonatomic,assign) BOOL  isLoadMore;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,copy)NSString *requestUrl;
@property (nonatomic,copy)NSString *categoryType;

//增加titleView的标题
-(void)addTitleViewWithImage:(NSString *)image;

- (void)addPicture:(Model*)model page:(NSInteger)page;
- (void)loadDataPage:(NSInteger)day;
- (void)loadDataPage;

@end
