//
//  Model.h
//  NPFONE
//
//  Created by qianfeng on 15/7/8.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
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
 @property (weak, nonatomic) IBOutlet UILabel *strHpTitle;
 @property (weak, nonatomic) IBOutlet UIImageView *strOriginalImgUrl;
 
 @property (weak, nonatomic) IBOutlet UILabel *strAuthor1;
 
 @property (weak, nonatomic) IBOutlet UILabel *strAuthor2;
 
 @property (weak, nonatomic) IBOutlet UILabel *strMarketTime1;
 @property (weak, nonatomic) IBOutlet UILabel *strMarketTime2;
 @property (weak, nonatomic) IBOutlet UIButton *strPn;
 
 */
@property(nonatomic,copy) NSString *strContMarketTime;
@property(nonatomic,copy) NSString *strContTitle;
@property(nonatomic,copy) NSString *strContAuthor;
@property(nonatomic,copy) NSString *strContAuthorIntroduce;
@property(nonatomic,copy) NSString *strPraiseNumber;
//@property(nonatomic,copy) NSString *strContAuthor;
@property(nonatomic,copy) NSString *sWbN;
@property(nonatomic,copy) NSString *sAuth;

@property(nonatomic,copy) NSString *strContent;

@property(nonatomic,copy) NSString *strMarketTime;
@property(nonatomic,copy) NSString *strAuthor;
@property(nonatomic,copy) NSString *strHpTitle;
//@property(nonatomic,copy) NSString *strContent;
@property(nonatomic,copy) NSString *strPn;
@property(nonatomic,copy) NSString *strOriginalImgUrl;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (id)valueForUndefinedKey:(NSString *)key;

 /*
 {
 "questionAdEntity": {
 "entQNCmt": {
 "strCnt": "",
 "strId": "",
 "strD": "",
 "pNum": "",
 "upFg": ""
 },
 "strLastUpdateDate": "2015-06-19 11:15:38",
 "strDayDiffer": "",
 "sWebLk": "http://m.wufazhuce.com/question/2015-06-19",
 "strPraiseNumber": "7469",
 "strQuestionId": "1012",
 "strQuestionTitle": "怎么样才能感动一个男生？",
 "strQuestionContent": "Brandies问：男朋友是那种很努力的人，快要大学毕业，正在自己创业，说想要给我更好的生活。但是我就想跟他好好过小日子，平常给他送点心送礼物，感觉他都不以为意。其实他挺爱我的，对我也很好，我也很想为他做点什么，但是又不知道该怎么办，总是觉得有点挫败，怎么样才能感动他呢？好吧我承认我就是有点虚荣。",
 "strAnswerTitle": "Merlyn答Brandies：",
 "strAnswerContent": "安抚他心中的野兽，欣赏他脑里的梦想。<br><br><i>（责任编辑：卫天成）</i>",
 "strQuestionMarketTime": "2015-06-19",
 "sEditor": "（责任编辑：卫天成）"
 },
 "result": "SUCCESS"
 }
 */
/*
 {
 "entTg": {
 "strLastUpdateDate": "2015-06-18 16:40:53",
 "strPn": "0",
 "strBu": "http://pic.yupoo.com/hanapp/EJeQe41m/Uk85T.jpg",
 "strTm": "2015-06-19",
 "strWu": "http://m.wufazhuce.com/thing/2015-06-19",
 "strId": "527",
 "strTt": "太空野餐包",
 "strTc": "接下来的任务，就是去公园找到一个虫洞了。\r\n\r\n来自马德里的设计事务所Atelier Teratoma。"
 },
 "rs": "SUCCESS"
 }
 */
@property(nonatomic,copy) NSString *strTm;
@property(nonatomic,copy) NSString *strBu;
@property(nonatomic,copy) NSString *strTt;
@property(nonatomic,copy) NSString *strTc;

@property(nonatomic,copy) NSString *strQuestionMarketTime;
@property(nonatomic,copy) NSString *strQuestionTitle;
@property(nonatomic,copy) NSString *strQuestionContent;
@property(nonatomic,copy) NSString *strAnswerTitle;
@property(nonatomic,copy) NSString *strAnswerContent;
@property(nonatomic,copy) NSString *sEditor;

@end
