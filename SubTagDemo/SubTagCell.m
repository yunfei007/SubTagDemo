//
//  SubTagCell.m
//  SubTagDemo
//
//  Created by yf on 2018/9/27.
//  Copyright © 2018年 yf. All rights reserved.
//

#import "SubTagCell.h"
#import "Masonry.h"

@interface SubTagCell()

@property (nonatomic,strong) UIView * itemView;

@property (nonatomic,strong) UILabel * itemLabel;

@end

@implementation SubTagCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self stepSubView];
    }
    return self;
}

-(void)stepSubView
{
    _itemView = [[UIView alloc] init];
    _itemView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_itemView];
    
    [_itemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
    
    _itemLabel = [[UILabel alloc] init];
    _itemLabel.layer.cornerRadius = 4;
    _itemLabel.clipsToBounds = YES;
    _itemLabel.layer.borderColor = [UIColor greenColor].CGColor;
    _itemLabel.layer.borderWidth = 0.5;
    _itemLabel.textColor = [UIColor greenColor];
    _itemLabel.text = @"细胞";
    _itemLabel.font = [UIFont systemFontOfSize:14];
    _itemLabel.textAlignment = NSTextAlignmentCenter;
    [_itemView addSubview:_itemLabel];
    
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.itemView.mas_top);
        make.left.equalTo(self.itemView.mas_left);
        make.bottom.equalTo(self.itemView.mas_bottom);
        make.right.equalTo(self.itemView.mas_right);
    }];
}

- (void)setTagStr:(NSString *)tagStr
{
    _tagStr = tagStr;
    _itemLabel.text = tagStr;
}

- (void)setSubTagModel:(SubTagModel *)subTagModel
{
    _subTagModel = subTagModel;
    _itemLabel.text = subTagModel.tagStr;
    if (subTagModel.isSelect) {
        _itemView.backgroundColor = [UIColor greenColor];
        _itemLabel.textColor = [UIColor whiteColor];
    }else{
        _itemView.backgroundColor = [UIColor whiteColor];
        _itemLabel.textColor = [UIColor greenColor];
    }
}
@end
