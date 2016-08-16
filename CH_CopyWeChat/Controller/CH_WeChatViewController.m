//
//  CH_WeChatViewController.m
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/7/1.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import "CH_WeChatViewController.h"
#import "CH_WeChatTable.h"
#import "CH_WeChatModel.h"
#import "CH_WeChatCell.h"

@interface CH_WeChatViewController ()

@property(nonatomic,strong)CH_WeChatTable *CH_WeChatTable;


@property(nonatomic,strong)NSMutableArray *modelArray;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation CH_WeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _CH_WeChatTable = [[CH_WeChatTable alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_CH_WeChatTable];
    _CH_WeChatTable.cellHeight = 80;
    //设置数据源
    NSArray *arr = @[@{@"bigImageUrl":@"0.jpg",
                       @"title":@"订阅号",
                       @"content":@"哎生活VS爱生活:今夏,金发芭比的诱惑,重燃宇宙",
                       @"dateString":@"下午1:59",
                       @"isHidden":@"0",@"type":@"0"
                       },
                     @{@"bigImageUrl":@"1.jpg",
                           @"title":@"IOS技术交流群36",
                           @"content":@"旺旺:[小视频]",
                           @"dateString":@"下午12:36",
                           @"isHidden":@"0",@"type":@"3"},
                        @{@"bigImageUrl":@"2.jpg",
                          @"title":@"创新研究院内部",
                          @"content":@"大傻:好的",
                           @"dateString":@"上午11:31",@"isHidden":@"0",@"type":@"1"},
                        @{@"bigImageUrl":@"3.jpg",
                          @"title":@"腾讯新闻",
                          @"content":@"湖北一大坝泄洪 大鱼被冲断头",
                          @"dateString":@"上午10:54",
                        @"isHidden":@"1",@"type":@"1"},
                     @{@"bigImageUrl":@"4.jpg",
                       @"title":@"泛嘉国际",
                       @"content":@"呵喝:[链接]这位来自中国的大妈靠打扫卫生,被评为日本“国宝级匠人”",
                       @"dateString":@"上午7:57",
                       @"isHidden":@"0",@"type":@"1"},@{@"bigImageUrl":@"5.jpg",
                                           @"title":@"家和万事兴-陈家亲友群",
                                           @"content":@"平子:[动画表情]",
                                           @"dateString":@"上午7:07",
                                           @"isHidden":@"0",@"type":@"3"},@{@"bigImageUrl":@"6.jpg",
                                                               @"title":@"微信支付",
                                                               @"content":@"微信支付凭证",
                                                               @"dateString":@"昨天",
                                                               @"isHidden":@"0",@"type":@"3"},@{@"bigImageUrl":@"7.jpg",
                                                                                   @"title":@"李颖",
                                                                                   @"content":@"[语音]",
                                                                                   @"dateString":@"星期六",
                                                                                   @"isHidden":@"0",@"type":@"1"},@{@"bigImageUrl":@"8.jpg",
                                                                                                       @"title":@"QQ邮箱提醒",
                                                                                                       @"content":@"招商信诺:恭喜您成为7月份首批获奖用户,获得五万额度",
                                                                                                       @"dateString":@"星期六",
                                                                                                       @"isHidden":@"0",@"type":@"0"},@{@"bigImageUrl":@"9.jpg",
                                                                                                                           @"title":@"Lg",
                                                                                                                           @"content":@"好咧",
                                                                                                                           @"dateString":@"星期五",
                                                                                                                           @"isHidden":@"0",@"type":@"2"},@{@"bigImageUrl":@"10.jpg",
                                                                                                                                               @"title":@"好近",
                                                                                                                                               @"content":@"这家公司帮用户赚了3.9个亿发红包！发2亿红包,人人有份",
                                                                                                                                               @"dateString":@"星期五",
                                                                                                                                               @"isHidden":@"0",@"type":@"2"},@{@"bigImageUrl":@"11.jpg",
                                                                                                                                                                   @"title":@"Young.",
                                                                                                                                                                   @"content":@"[转账]你已确认收钱",
                                                                                                                                                                   @"dateString":@"星期五",
                                                                                                                                                                   @"isHidden":@"0",@"type":@"3"},@{@"bigImageUrl":@"12.jpg",
                                                                                                                                                                                       @"title":@"手机充值",
                                                                                                                                                                                       @"content":@"[七月约惠]燃情夏日 抽话费 抽好礼",
                                                                                                                                                                                       @"dateString":@"星期五",
                                                                                                                                                                                       @"isHidden":@"0",@"type":@"1"}];
    
     _modelArray = [NSMutableArray array];
      _dataArray = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        CH_WeChatModel *model = [[CH_WeChatModel alloc]initWithDic:dic];
        [_modelArray addObject:model];
        CH_WeChatCell *cell = [CH_WeChatCell creatXibCellWithTarget:self tableView:_CH_WeChatTable model:model];
        if ([model.isHidden intValue] == 1) {
            cell.smallImage.hidden = NO;
        }else{
             cell.smallImage.hidden = YES;
        }
        switch ([model.type intValue]) {
            case 0:
                cell.cellStyle = CellStyleNone;
                break;
            case 1:
                cell.cellStyle = CellStyleDelete;
                break;
             case 2:
                cell.cellStyle = CellStyleDeleteAndNotRead;
                break;
              case 3:
                cell.cellStyle = CellStyleDeleteAndCancelAttention;
                break;
            default:
                break;
        }
       [_dataArray addObject:cell];
    }
    //设置数据源cell
    [_CH_WeChatTable setUpDataSourceWithArray:_dataArray];
    
    //点击事件
    [_CH_WeChatTable clickCellWithBlock:^(NSIndexPath *indexPath) {
        
        NSLog(@"%@",indexPath);
    }];
    // Do any additional setup after loading the view.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
