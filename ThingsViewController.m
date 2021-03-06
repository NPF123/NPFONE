//
//  ThingsViewController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "ThingsViewController.h"
#import "Zuihoude.h"
@interface ThingsViewController ()<UIScrollViewDelegate>
{

    NSInteger p;
    CGFloat num;
}
@end

@implementation ThingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width,kScreenSize.height-49)];
    imageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:imageView];
    num = 1;
    [self  creatScrollView];
    [self loadDataPage:0];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)addThing:(Model *)model  page:(NSInteger)i{
    
    Zuihoude *view1 = [[[NSBundle mainBundle] loadNibNamed:@"Zuihoude" owner:nil options:nil] lastObject];
    
    view1.frame = CGRectMake(kScreenSize.width*i, 0, kScreenSize.width, kScreenSize.height);
    [view1  showThing:model];
    
    [_scrollView  addSubview:view1];
}

- (void)loadData:(NSString *)str{
    __weak  typeof (self)  weakSelf = self;
    [_manager  GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary  *dict1 = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (responseObject) {
                Model  *model = [[Model  alloc]init];
                [model  setValuesForKeysWithDictionary:dict1[@"entTg"]];
                [weakSelf  addThing:model page:p];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
    }];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    p = _scrollView.contentOffset.x/kScreenSize.width;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_scrollView.contentOffset.x/kScreenSize.width==num){
        if (num<10) {
            num++;
            [self  loadDataPage:++p];
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
