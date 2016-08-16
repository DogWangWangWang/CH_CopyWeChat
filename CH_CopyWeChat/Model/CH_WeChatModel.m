//
//  CH_WeChatModel.m
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/7/4.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import "CH_WeChatModel.h"

@implementation CH_WeChatModel

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.bigImageUrl = [NSString stringWithFormat:@"%@",dic[@"bigImageUrl"]];
        self.title = [NSString stringWithFormat:@"%@",dic[@"title"]];
        self.content = [NSString stringWithFormat:@"%@",dic[@"content"]];
        self.dateString = [NSString stringWithFormat:@"%@",dic[@"dateString"]];
        self.isHidden = [NSString stringWithFormat:@"%@",dic[@"isHidden"]];
        self.type = [NSString stringWithFormat:@"%@",dic[@"type"]];
    }
    return self;
}

@end
