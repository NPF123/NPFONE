//
//  HomeViewController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "HomeViewController.h"
#import "firstView.h"
#define  kScreenSize  [UIScreen  mainScreen].bounds.size
@interface HomeViewController ()<UIScrollViewDelegate>
{
    CGFloat p;
    NSMutableArray *_picture;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width,kScreenSize.height-49)];
    //自动换背景
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%u",arc4random()%5+1]];
    [self.view addSubview:imageView];
    
    [self loadDataPage:0];
    [self createScrollView];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    p = _scrollView.contentOffset.x/kScreenSize.width;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if (_scrollView.contentOffset.x/kScreenSize.width !=p) {
        if (p+1<=10) {
            [self loadDataPage:p+1];
        }
    }
}

- (void)createScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenSize.width, kScreenSize.height)];
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*10, _scrollView.bounds.size.height+5);
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate  = self;
    _scrollView.directionalLockEnabled = YES;
    [self.view addSubview:_scrollView];
}

@end
