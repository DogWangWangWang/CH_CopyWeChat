//
//  CH_WeChatCell.m
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/6/16.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import "CH_WeChatCell.h"
#import "CH_WeChatModel.h"

@implementation CH_WeChatCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUpSubviews];
    }
    return self;
}


//初始化控件
-(void)setUpSubviews{
    _bigImage = [[UIImageView alloc]init];
    
    _smallImage = [[UILabel alloc]init];
    //设置
    _smallImage.text = @"1";
    _smallImage.textColor = [UIColor whiteColor];
    _smallImage.textAlignment = NSTextAlignmentCenter;
    _smallImage.backgroundColor = [UIColor redColor];
    _smallImage.layer.cornerRadius = 8.0f;
    _smallImage.layer.masksToBounds = YES;
    
    _titleLabel = [[UILabel alloc]init];
    
    _dataLabel = [[UILabel alloc]init];
    _dataLabel.font = [UIFont systemFontOfSize:14];
    _dataLabel.textColor = [UIColor lightGrayColor];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.textColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:_bigImage];
    [self.contentView addSubview:_smallImage];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_dataLabel];
    [self.contentView addSubview:_contentLabel];
}


-(void)layoutSubviews{
    
    //大图约束
    //
    UIView *superview = self;
    int padding  = 8;
    [_bigImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.lessThanOrEqualTo(superview.mas_top).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.width.equalTo(@66);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
    }];
    [_smallImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).offset(1);
        make.left.equalTo(_bigImage.mas_right).offset(-padding);
        make.bottom.equalTo(_bigImage.mas_top).offset(-padding);
        make.right.equalTo(_bigImage.mas_right).offset(padding);
        make.width.equalTo(@16);
        make.height.equalTo(@16);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bigImage.mas_right).offset(padding);
        make.top.equalTo(superview.mas_top).offset(15);
        make.width.equalTo(@200);
        // make.bottom.equalTo(_contentLabel.mas_top).offset(padding);
        // make.right.equalTo(superview.mas_right).offset(-40);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(padding * 1.5);
        make.left.equalTo(_bigImage.mas_right).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
         make.right.equalTo(superview.mas_right).offset(-padding);
    }];
    [_dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).offset(padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        // make.width.equalTo(@40);
        // make.height.equalTo(@20);
    }];

}




//赋值
-(void)initWithModel:(CH_WeChatModel *)model{
    self.bigImage.image = [UIImage imageNamed:model.bigImageUrl];;
    self.titleLabel.text = [NSString stringWithFormat:@"%@",model.title];
    self.contentLabel.text = [NSString stringWithFormat:@"%@",model.content];
    self.dataLabel.text = [NSString stringWithFormat:@"%@",model.dateString];
}

+(id)creatXibCellWithTarget:(id)target tableView:(UITableView *)tableView model:(CH_WeChatModel *)model{
    static NSString *identifier = @"weChatCell";
    CH_WeChatCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CH_WeChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell initWithModel:model];
    return cell;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
