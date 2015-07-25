//
//  firstCell.h
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-11.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface firstView: UIView

@property (weak, nonatomic) IBOutlet UILabel *strHpTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *strThumbnailUrlImage;

@property (weak, nonatomic) IBOutlet UILabel *strAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *strAuthor2Label;
@property (weak, nonatomic) IBOutlet UILabel *strContentLabel;



@property (weak, nonatomic) IBOutlet UILabel *strMarketTimeDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *strMarketTimeMouthLabel;
@property (weak, nonatomic) IBOutlet UILabel *strPnLabel;
- (void)showDataWithModel:(Model *)model;
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

/*
 
 "strLastUpdateDate": "2015-06-08 14:01:33",
 "strDayDiffer": "",
 "strHpId": "994",
 "strHpTitle": "VOL.977",
 "strThumbnailUrl": "http://pic.yupoo.com/hanapp/EHg1hfze/13fCuu.jpg",
 "strOriginalImgUrl": "http://pic.yupoo.com/hanapp/EHg1hfze/13fCuu.jpg",
 "strAuthor": "月台&邦乔彦 作品",
 "strContent": "初恋就像一壶白开水，不管当初多么沸腾，放得久了，终究是一壶凉白开。 by 午歌",
 "strMarketTime": "2015-06-11",
 "sWebLk": "http://wufazhuce.com/one/vol.977",
 "strPn": "17681",
 "wImgUrl": "http://211.152.49.184:9000/upload/onephoto/f1433216588630.jpg"
 }
 */


@end
