//
//  ONETabBarController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "ONETabBarController.h"
#import "BaseViewController.h"


@interface ONETabBarController ()

@end

@implementation ONETabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewController];
}
#pragma mark-  创建子视图控制器
- (void)creatViewController{
   // NSArray *catArr = @[@"getHp_N?",@"getC_N?",@"getOneQuestionInfo?",@"o_f?"];
    NSArray *categoryArr = @[kHPType,KContentType,kQuestionType,kThingType,@""];
    NSArray *ViewControllers= @[@"HomeViewController",@"ArticleViewController",@"QuestionViewController",@"ThingsViewController",@"MyViewController"];
    NSArray  *arr = @[@"首页",@"文章",@"问题",@"东西",@"more"];
    NSArray *iconImages = @[@"home",@"content",@"question",@"things",@"shareBtn"];
    NSArray *iconSltImages = @[@"home_hl",@"content_hl",@"question_hl",@"things_hl",@"shareBtn_hl"];
     NSMutableArray *vcArr = [[NSMutableArray alloc] init];
    for (NSInteger i =0; i<ViewControllers.count; i++) {
        
        Class cls = NSClassFromString(ViewControllers[i]);
        
        BaseViewController *base = [[cls alloc] init];
        UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:base];
         nav.tabBarItem  = [nav.tabBarItem initWithTitle:nil image:[[UIImage imageNamed:iconImages[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:iconSltImages[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        nav.navigationItem.title = arr[i];
        
        //NSString *strDate = [[NSString stringWithFormat:@"%@",[NSDate date]] substringToIndex:10];
       //NSString *str = [NSString stringWithFormat:kUrl,catArr[i],strDate,1];
        //base.requestUrl  = str;
        base.categoryType = categoryArr[i];
        [vcArr addObject:nav];
        
    }
    self.viewControllers = vcArr;
}

@end
