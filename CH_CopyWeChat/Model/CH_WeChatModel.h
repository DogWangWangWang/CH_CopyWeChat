//
//  CH_WeChatModel.h
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/7/4.
//  Copyright © 2016年 DogCat. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CH_WeChatModel : NSObject

@property(nonatomic,strong)NSString *bigImageUrl;

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSString *content;

@property(nonatomic,strong)NSString *dateString;


@property(nonatomic,strong)NSString * isHidden;

@property(nonatomic,strong)NSString *type;


-(id)initWithDic:(NSDictionary *)dic;



@end
