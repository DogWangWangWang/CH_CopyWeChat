//
//  CH_WeChatTable.m
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/7/1.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import "CH_WeChatTable.h"
#import "CH_WeChatCell.h"

@interface CH_WeChatTable ()<UITableViewDataSource,UITableViewDelegate>

/** 数据源数组 */
@property(nonatomic,strong)NSMutableArray *dataArray;

/** 将block 定义成属性 */
@property(nonatomic,copy)clickBlock clickBlock;

@end

@implementation CH_WeChatTable

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)setUpDataSourceWithArray:(NSMutableArray<UITableViewCell *> *)dataArray{
    _dataArray = dataArray;
    if (_dataArray.count) {
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    [self setScrollsToTop:YES];
    [self reloadData];
}

//初始化(可视化编程会走)
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        //去除底端横线
        self.tableFooterView = [UIView new];
    }
    return self;
}

//纯代码编程会走
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // 设置去除tableview的底端横线
      //  self.tableFooterView = [UIView new];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
         return _cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.clickBlock(indexPath);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}




//设置tableview可编辑
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
     //获取当前cell
     CH_WeChatCell *cell = [_dataArray objectAtIndex:indexPath.row];
    //
    switch (cell.cellStyle) {
        case CellStyleNone:
           return @[[self setDeleteActionAtIndexPath:indexPath tableView:tableView]];
            break;
        case CellStyleDelete:
            return @[[self setDeleteActionAtIndexPath:indexPath tableView:tableView]];
            break;
        case CellStyleDeleteAndCancelAttention:
            return @[[self setDeleteActionAtIndexPath:indexPath tableView:tableView],[self setCancelAttentionAtIndexPath:indexPath tableView:tableView]];
            break;
         case CellStyleDeleteAndNotRead:
            return @[[self setDeleteActionAtIndexPath:indexPath tableView:tableView],[self setNotReadAtIndexPath:indexPath tableView:tableView]];
      //不要用default 确保当状态增加 系统会出现警告 来提醒到需要添加新的状态处理
    }
}


//设置删除按扭
-(UITableViewRowAction *)setDeleteActionAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
     //建立一个删除按钮
     UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       //允许开启编辑单元格
       [tableView setEditing:YES animated:YES];
       //删除数据
       [_dataArray removeObjectAtIndex:indexPath.row];
       //删除cell
       //UITableViewCell *cell = [_dataArray objectAtIndex:indexPath.row];
       [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return deleteAction;
}


//设置取消关注按钮
-(UITableViewRowAction *)setCancelAttentionAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    //建立一个删除按钮
    NSString *str = @"取消关注";
    UITableViewRowAction *cancelAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:str handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
      UIAlertController *alertController   =  [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定要取消关注吗？" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"仍然关注" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消关注" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            //允许开启编辑单元格
            [tableView setEditing:YES animated:YES];
            //删除数据
            [_dataArray removeObjectAtIndex:indexPath.row];
            //删除cell
            UITableViewCell *cell = [_dataArray objectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[cell] withRowAnimation:UITableViewRowAnimationFade];
        }];
        [alertController addAction:action1];
        [alertController addAction:action2];
    }];
    cancelAction.backgroundColor = [UIColor lightGrayColor];
    return cancelAction;
}


//设置标记未读按钮
-(UITableViewRowAction *)setNotReadAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    CH_WeChatCell *cell = _dataArray[indexPath.row];
    NSString *str = @"标为已读";
    if (cell.smallImage.hidden == YES) {
       str = @"标为未读";
    }
   UITableViewRowAction *notReadAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:str handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
     //根据控件是否隐藏的属性来判断显示什么文字
       if (cell.smallImage.hidden == NO) {
           cell.smallImage.hidden = YES;
           return;
       }else{
           cell.smallImage.hidden = NO;
       }
       [tableView reloadData];
   }];
    notReadAction.backgroundColor = [UIColor lightGrayColor];
    return notReadAction;
}


-(void)clickCellWithBlock:(clickBlock)clickBlock{
    if (clickBlock) {
        self.clickBlock = clickBlock;
    }
}








@end
