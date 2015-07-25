//
//  MyViewController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/8.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "MyViewController.h"
#import "REMenu.h"
#import "NewsViewController.h"
#define baiduNewUrl @"http://news.baidu.com" //@"http://m.baidu.com/news?fr=mohone"
#define fengNewUrl @"http://3g.ifeng.com"
#define sinaNewUrl @"http://news.sina.cn"
#define tencenNewUrl @"http://info.3g.qq.com"
#define wangyiNewUrl @"http://3g.163.com"

#define kScreenSize [UIScreen mainScreen].bounds.size
@interface MyViewController ()
@property (nonatomic, strong) REMenu *menu;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width,kScreenSize.height-49)];
    imageView.image = [UIImage imageNamed:@"4"];
    UILabel *label= [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreenSize.width,kScreenSize.height-49)];
    label.text = @"一个世界\n一眼足矣\n\n站在河心\n我期待一个雪花状的黎明\n轻轻抚摩枯草的脸颊\n比春风的叮咛\n还要清醒\n我看到满天飘零的星星\n消失了黎明睁开睡眼前的惊恐\n那是一个安静如猫的河岸\n萤火虫带它们找到另一处光明\n草帽忘了何时丢失了绿色\n我一夜苦想着能找回的角落\n也许时间像油漆偷换了它的容颜\n也许记忆像车轮转移了它的地点\n站在河心\n除了黎明、萤火虫和草帽\n我不能找回更多\n可这还是一个世界";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:label];
    
    [self.view addSubview:imageView];

    self.navigationItem.title = @"就看一眼";
    // 添加右导航按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(selectMoreNews) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"shareBtn"] forState:UIControlStateNormal];
    button.frame = (CGRect){CGPointZero,button.currentBackgroundImage.size};
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [self setupMenuView];
    
}

//视图将出现的时候
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}

//视图将消失的
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.menu isOpen]) {
        [self.menu close];
    }
}

//显示菜单
- (void)selectMoreNews{

    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}


- (void)setupMenuView{
    
    __weak typeof(self) weakSelf = self;
    REMenuItem *baiduItem = [[REMenuItem alloc] initWithTitle:@"百度新闻" subtitle:@"全球最大的新闻平台" image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:baiduNewUrl];
    }];
    REMenuItem *fengItem = [[REMenuItem alloc] initWithTitle:@"凤凰新闻" subtitle:@"24小时提供最及时，最权威，最客观的新闻资讯" image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:fengNewUrl];
        }];
    REMenuItem *sinaItem = [[REMenuItem alloc] initWithTitle:@"新浪新闻" subtitle:@"最新、最快头条新闻一网打尽" image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:sinaNewUrl];
          }];
    REMenuItem *tencenItem = [[REMenuItem alloc] initWithTitle:@"腾讯新闻" subtitle:@"中国浏览最大的中文门户网站"image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:tencenNewUrl];
         }];
    REMenuItem *wangyiItem = [[REMenuItem alloc] initWithTitle:@"网易新闻"  subtitle:@"因新闻最快速，评论最犀利而备受推崇" image:nil highlightedImage:nil action:^(REMenuItem *item) {
        [weakSelf pushViewControllerWithUrl:wangyiNewUrl];
        }];
    
    self.menu = [[REMenu alloc] initWithItems:@[fengItem, baiduItem, sinaItem, tencenItem, wangyiItem]];
    self.menu.liveBlur = YES;
    self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    self.menu.textColor = [UIColor whiteColor];
    self.menu.subtitleTextColor = [UIColor whiteColor];
    
    [self.menu showInView:self.view];
}
- (void)pushViewControllerWithUrl:(NSString *)url
{
    NewsViewController *newCtrl = [[NewsViewController alloc]init];
    newCtrl.url = url;
    [self.navigationController pushViewController:newCtrl animated:YES];
}

@end
