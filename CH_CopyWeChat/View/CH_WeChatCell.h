//
//  CH_WeChatCell.h
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/6/16.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

typedef NS_ENUM(NSInteger,CellStyle){
    CellStyleNone,
    CellStyleDelete,
    CellStyleDeleteAndNotRead,
    CellStyleDeleteAndCancelAttention
};

@class CH_WeChatModel;
@interface CH_WeChatCell : UITableViewCell


@property (strong, nonatomic)UIImageView *bigImage;

@property (strong, nonatomic) UILabel *smallImage;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic)  UILabel *dataLabel;

@property (strong, nonatomic)UILabel *contentLabel;

//cell类型
@property(nonatomic,assign)CellStyle cellStyle;

-(void)initWithModel:(CH_WeChatModel *)model;

+(id)creatXibCellWithTarget:(id)target tableView:(UITableView *)tableView model:(CH_WeChatModel *)model;

@end
