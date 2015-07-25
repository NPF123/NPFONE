//
//  Define.h
//  NPFONE
//
//  Created by qianfeng on 15/7/4.
//  Copyright (c) 2015年 牛鹏飞. All rights reserved.
//

#ifndef NPFONE_Define_h
#define NPFONE_Define_h

#define kScreenSize [UIScreen mainScreen].bounds.size
#import"LZXHelper.h"
#import "MyControl.h"


/*
 界面类型
 */
#define kHPType       @"HP"
#define KContentType  @"CONTENT"
#define kQuestionType @"QUESTION"
#define kThingType    @"THING"

//首页接口
#define  kUrl @"http://bea.wufazhuce.com/OneForWeb/one/%@?strDate=%@&strRow=%ld"


//拼接的
#define   getHp_N  @"getHp_N"
#define   getC_N   @"getC_N"
#define   getQ_N   @"getOneQuestionInfo"
#define   o_f      @"o_f"
#define   get_Ad   @"getAllAdInf"



//广告
#define kAdUrl  @"http://bea.wufazhuce.com/OneForWeb/one/getAllAdInf?strMs=0"

//首页点赞 接口  —-   HP
//文章点赞接口 —    CONTENT
//问题点赞接口：—  QUESTION
// %@ 代表其中
#define kPraise @"http://bea.wufazhuce.com/OneForWeb/onest/praiseAppItemSomeId?strPraiseItemId=1019&strDeviceId=ffffffff-d111-0564-ffff-ffffb7f490c3&strAppName=ONE&strPraiseItem=%@"

//我的  推荐应用接口
#define kMyUserUrl @"http://bea.wufazhuce.com/OneForWeb/onest/getRecommendAppV13?strDist=540"

//#define __UpLine__ // 上线的时候打开

#ifndef __UpLine__
//变参宏
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif
