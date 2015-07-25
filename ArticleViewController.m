//
//  ArticleViewController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "ArticleViewController.h"
#define  kScreenSize  [UIScreen  mainScreen].bounds.size
@interface ArticleViewController ()<UIScrollViewDelegate>
{

    CGFloat p;
    CGFloat num;
}
@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width,kScreenSize.height-49)];
    imageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:imageView];
    num=1;
    [self creatScrollView];
    [self loadDataPage:0];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    p = _scrollView.contentOffset.x/kScreenSize.width;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_scrollView.contentOffset.x/kScreenSize.width==num){
        if (num<10) {
            num++;
            [self  loadDataPage:p+1];
        }
    }
}
- (void)creatScrollView{
    p = 0;
    _scrollView = [[UIScrollView  alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-49+5)];
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width*10, _scrollView.bounds.size.height-64-49);
    _scrollView.bounces =YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.directionalLockEnabled = YES;
    [self.view  addSubview:_scrollView];
}

@end
