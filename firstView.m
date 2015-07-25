//
//  firstCell.m
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-11.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import "firstView.h"
#define  kScreenSize  [UIScreen  mainScreen].bounds.size
#import "UIImageView+WebCache.h"
@implementation firstView

 

- (void)awakeFromNib{
   // self.strOriginalImgUrl.layer.masksToBounds = YES;
    //self.strOriginalImgUrl.layer.cornerRadius = 5;
    [self layoutIfNeeded];
}

- (void)showDataWithModel:(Model *)model{
  
//    if (kScreenSize.) {
//        //
//    }
    //self.vLayout.constant = 309;
    self.strHpTitleLabel.text = model.strHpTitle;
    
    [self.strThumbnailUrlImage  sd_setImageWithURL:[NSURL  URLWithString:model.strOriginalImgUrl] placeholderImage:nil];
    
    
    self.strAuthorLabel.text = [model.strAuthor  componentsSeparatedByString:@"&"][0];
   
    
    self.strAuthor2Label.text =  [model.strAuthor  componentsSeparatedByString:@"&"][1];


    self.strMarketTimeDayLabel.text = [model.strMarketTime substringFromIndex:8];
    self.strMarketTimeMouthLabel.text = [model.strMarketTime  substringToIndex:7];
    
    self.strPnLabel.text =[NSString stringWithFormat:@"😍%@",model.strPn];
    self.strContentLabel.text = model.strContent;
}


@end
