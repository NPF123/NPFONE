//
//  QuestionView.h
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-19.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface QuestionView : UIViewController
{
    UIWebView  *_webView;
}
- (void)showQuestion:(Model *)model;
@end
