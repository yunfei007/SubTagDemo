//
//  SubTagCell.h
//  SubTagDemo
//
//  Created by yf on 2018/9/27.
//  Copyright © 2018年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubTagModel.h"

@interface SubTagCell : UICollectionViewCell

@property (nonatomic,copy) NSString * tagStr;

@property (nonatomic,strong) SubTagModel * subTagModel;

@end
