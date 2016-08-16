//
//  CH_WeChatTable.h
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/7/1.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义block
typedef void(^clickBlock)(NSIndexPath *indexPath);
@interface CH_WeChatTable : UITableView

/** 设置数据源 */
-(void)setUpDataSourceWithArray:(NSMutableArray<UITableViewCell *> *)dataArray;

//cell的点击事件
-(void)clickCellWithBlock:(clickBlock)clickBlock;

@property(nonatomic,assign)CGFloat cellHeight;


@end
