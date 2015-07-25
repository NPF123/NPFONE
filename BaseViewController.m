//
//  BaseViewController.m
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import "BaseViewController.h"
#import "LZXHelper.h"
#import "firstView.h"
#import "ngfr.h"
@interface BaseViewController ()<UIScrollViewDelegate>
{

    NSInteger _numPage;
    NSString *_url;
}
@property(nonatomic) NSInteger  numPage;
@property(nonatomic,copy) NSString *url;
@property (nonatomic,weak)UIActivityIndicatorView *indicator;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView  *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImage  *image = [[UIImage  imageNamed:@"logo@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [imageView setImage:image];
    self.navigationItem.title=@"ONE";
    [self creatHttpRequest];
}

- (void)creatHttpRequest{
    _manager = [[AFHTTPRequestOperationManager  alloc]init];
    _manager.responseSerializer = [AFCompoundResponseSerializer  serializer];
    _dataArr = [[NSMutableArray  alloc]init];
}


- (void)loadDataPage:(NSInteger)day{

    self.numPage = day;
    NSString *url = nil;
    NSDate *date = [NSDate date];
    NSString *dateLast = [NSString stringWithFormat:@"%@",date];
    NSString *strDate = [dateLast substringToIndex:10];
    if ([self.categoryType  isEqualToString:kHPType]) {
        url  = [NSString  stringWithFormat:kUrl,getHp_N,strDate,self.numPage+1];
        [self  loadData:url];

        
    }else if([self.categoryType  isEqualToString:KContentType]){
        url  = [NSString  stringWithFormat:kUrl,getC_N,strDate,self.numPage+1];
        [self  loadData:url];

        
    }else if([self.categoryType  isEqualToString:kQuestionType]){
        url = [NSString  stringWithFormat:kUrl,getQ_N,strDate,self.numPage+1];
        [self  loadData:url];

    }else{
        url = [NSString  stringWithFormat:kUrl,o_f,strDate,self.numPage+1];
        [self  loadData:url];

    }
}
- (void)loadData:(NSString *)str{
    [self.indicator startAnimating];
    self.indicator.hidden = NO;
    
    __weak  typeof (self) weakSelf = self;
    [_manager  GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary  *dict1 = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (responseObject) {
            if ([self.categoryType  isEqualToString:kHPType]) {
                Model *model = [[Model  alloc]init];
                [model  setValuesForKeysWithDictionary:dict1[@"hpEntity"]];
                [weakSelf.dataArr addObject:model];
                [weakSelf  addPicture:model page:self.numPage];
            }else if([self.categoryType  isEqualToString:KContentType]){
                Model *model = [[Model  alloc]init];
                [model  setValuesForKeysWithDictionary:dict1[@"contentEntity"]];
                [weakSelf.dataArr addObject:model];
                [weakSelf  addArticle:model page:self.numPage];
              }
        }
        [self.indicator stopAnimating];
        self.indicator.hidden = YES;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
    }];

}


- (void)addPicture:(Model *)model  page:(NSInteger)i{
    
    firstView *view = [[[NSBundle mainBundle] loadNibNamed:@"firstView" owner:nil options:nil] lastObject];
    view.frame = CGRectMake(kScreenSize.width*i, 0, kScreenSize.width, kScreenSize.height-64-49);
    [view  showDataWithModel:model];
    [_scrollView  addSubview:view];
}
- (void)addArticle:(Model *)model  page:(NSInteger  )i{
    
    ngfr *view1 = [[ngfr alloc]init];
    
    view1.view.frame = CGRectMake(kScreenSize.width*i, 0, kScreenSize.width, kScreenSize.height);
    [view1  showarectilc:model];
    [_scrollView addSubview:view1.view];
}


- (void)setupActivityIndicator
{
    //初始化:
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    //设置显示位置
    [indicator setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
    
    //设置背景色
    indicator.backgroundColor = [UIColor redColor];
    indicator.color = [UIColor redColor];
    //设置背景透明
    indicator.alpha = 0.5;
    
    //设置背景为圆角矩形
    indicator.layer.cornerRadius = 6;
    indicator.layer.masksToBounds = YES;
    
    [self.view addSubview:indicator];
    self.indicator = indicator;
    self.indicator.hidden = YES;
}


//- (void)downLoadInit{
//    
//    _dataArr = [[NSMutableArray alloc] init];
//    _manager = [AFHTTPRequestOperationManager manager];
//    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSDate *date = [NSDate date];
//    NSString *dateLast = [NSString stringWithFormat:@"%@",date];
//    NSString *strDate = [dateLast substringToIndex:10];
//    NSString *url = [NSString stringWithFormat:self.requestUrl,strDate];
//    NSLog(@"%@",self.requestUrl);
//    __weak typeof(self) weakSelf = self;
//    
//    [_manager GET:self.requestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSDictionary *dictHp = dict[@"hpEntity"];
//        _model = [[hpModel alloc] init];
//        weakSelf.strHpTitleLabel.text =_model.strHpTitle= dictHp[@"strHpTitle"];
//        _model.strThumbnailUrl= dictHp[@"strThumbnailUrl"];
//        
//        [weakSelf.strThumbnailUrlImageView sd_setImageWithURL:dictHp[@"strThumbnailUrl"] placeholderImage:nil];
//        
//        NSArray *arr1 = [dictHp[@"strAuthor"] componentsSeparatedByString:@"&"];
//        weakSelf.strAuthorLabel.text = arr1[0];
//        weakSelf.strAuthorLastLabel.text = arr1[1];
//        weakSelf.strContentLabel.text = _model.strContent= dictHp[@"strContent"];
//        
//        NSArray *arr2 = [dictHp[@"strMarketTime"] componentsSeparatedByString:@"-"];
//        
//        NSString *mouth = [LZXHelper numberToEnglish:[arr2[1] integerValue]];
//        NSString *dateLast  = [NSString stringWithFormat:@"%@,%@",mouth,arr2[0]];
//        
//        weakSelf.strMarketTimeLabel.text = arr2[2];
//        weakSelf.strMarketTimeLastLabel.text = [NSString stringWithFormat:@"%@",dateLast];
//        
//        _model.strPn= dictHp[@"strPn"];
//        [weakSelf.likeButton setTitle:_model.strPn forState:UIControlStateNormal];
//        [weakSelf.dataArr addObject:_model];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"下载失败");
//    }];
//    
//}



@end
