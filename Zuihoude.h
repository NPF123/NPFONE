//
//  Zuihoude.h
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-20.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface Zuihoude : UIView
@property (weak, nonatomic) IBOutlet UILabel *strTm;
@property (weak, nonatomic) IBOutlet UIImageView *strBu;
@property (weak, nonatomic) IBOutlet UILabel *srtTt;
@property (weak, nonatomic) IBOutlet UITextView *strTc;
- (void)showThing:(Model *)model;
/*
 {
 "entTg": {
 "strLastUpdateDate": "2015-06-18 16:41:03",
 "strPn": "0",
 "strBu": "http://pic.yupoo.com/hanapp/EJHaUos4/t6QI4.jpg",
 "strTm": "2015-06-20",
 "strWu": "http://m.wufazhuce.com/thing/2015-06-20",
 "strId": "531",
 "strTt": "“在一起”闪电书店",
 "strTc": "这个夏天，ONE和申活馆在一起，于是有了一间装满书的房子和很多好朋友。\r\n我们相信只要和喜欢的一切在一起，就能生长出更宽广的可能。\r\n时间：6月20日 - 8月15日\r\n地址：黄浦区西藏中路268号来福士广场2F05"
 },
 "rs": "SUCCESS"
 }
 */

@end
