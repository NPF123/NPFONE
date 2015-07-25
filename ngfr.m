//
//  ngfr.m
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-18.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import "ngfr.h"
#define  kScreenSize  [UIScreen  mainScreen].bounds.size
@implementation ngfr

- (void)showarectilc:(Model *)model{
    CGRect frame = self.view.bounds;
    frame.origin.y = 64;
    frame.size.height = self.view.bounds.size.height-49-64;
    NSMutableString  *time = [NSMutableString  stringWithString:model.strContMarketTime];
    [time  appendFormat:@"<hr><b>%@</b><br>%@<br><br>",model.strContTitle,model.strContAuthor];
    _webView  = [[UIWebView  alloc] initWithFrame:frame];

    NSString  *str = [NSString  stringWithFormat:@"%@%@<br><br><hr>%@<br><br><b>喜爱度:</b>%@<br><br>%@<br><br>",time,model.strContent,model.strContAuthor,model.strPraiseNumber,model.strContAuthorIntroduce];
     [_webView  loadHTMLString:str baseURL:nil];
    
    [self.view  addSubview:_webView];
    
}

@end
