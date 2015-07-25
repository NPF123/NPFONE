//
//  ngfr.h
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-18.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface ngfr : UIViewController
{
    UIWebView  *_webView;
}
@property(nonatomic,copy) NSString *strContent;
- (void)showarectilc:(Model *)model;
@end
