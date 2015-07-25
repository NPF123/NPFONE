//
//  QuestionView.m
//  typeWriterOfMan
//
//  Created by 吴松 on 15-6-19.
//  Copyright (c) 2015年 松哥. All rights reserved.
//

#import "QuestionView.h"

@interface QuestionView ()

@end

@implementation QuestionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
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
- (void)showQuestion:(Model *)model{
    CGRect frame = self.view.bounds;
    frame.origin.y = 64;
    frame.size.height = self.view.bounds.size.height-49-64;
    _webView  = [[UIWebView  alloc]initWithFrame:frame];
    
    NSString *str = [NSString stringWithFormat:@"%@<hr>%@<br><br>%@<hr>%@<br><br>%@<br><br><b>喜爱度:</b>%@<br><br>",model.strQuestionMarketTime,model.strQuestionTitle,model.strQuestionContent,model.strAnswerTitle,model.strAnswerContent,model.strPraiseNumber];
    //<img src="/i/eg_tulip.jpg"  alt="上海鲜花港 - 郁金香" />
    //<hr><b>%@</b><br>%@<br><br>
    
    [_webView  loadHTMLString:str baseURL:nil];
    [self.view  addSubview:_webView];

}

@end
