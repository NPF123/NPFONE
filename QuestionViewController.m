//
//  QuestionViewController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "QuestionViewController.h"
#import "Model.h"
#import "QuestionView.h"
@interface QuestionViewController ()<UIScrollViewDelegate>
{

    NSInteger p;
    CGFloat num;
}
@property (nonatomic,copy)NSString *url;
@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width,kScreenSize.height-49)];
    imageView.image = [UIImage imageNamed:@"4"];
    [self.view addSubview:imageView];
    num =1;
    [self  creatScrollView];
    [self  loadDataPage:0];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)loadData:(NSString *)str{
 
    __weak typeof (self)weakSelf=self;
    [_manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (responseObject) {
            Model *model = [[Model alloc] init];
            [model  setValuesForKeysWithDictionary:dict[@"questionAdEntity"]];
            [weakSelf addQuestView:model page:p];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
    }];
}
- (void)addQuestView:(Model *)model  page:(NSInteger  )i{
    QuestionView  *questView = [[QuestionView  alloc]init];
    questView.view.frame = CGRectMake(kScreenSize.width*i, 0, kScreenSize.width, kScreenSize.height);
    [questView  showQuestion:model];
    [_scrollView addSubview:questView.view];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    p = _scrollView.contentOffset.x/kScreenSize.width;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_scrollView.contentOffset.x/kScreenSize.width==num){
        if (num<=10) {
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
