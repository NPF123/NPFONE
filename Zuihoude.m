//
//  Zuihoude.m
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-20.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import "Zuihoude.h"
#import "UIImageView+WebCache.h"
@implementation Zuihoude

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)showThing:(Model *)model{
    self.strTc.text = model.strTc;
    [self.strBu sd_setImageWithURL:[NSURL  URLWithString:model.strBu] placeholderImage:nil];
    self.strTm.text = model.strTm;
    self.srtTt.text = model.strTt;
}
@end
