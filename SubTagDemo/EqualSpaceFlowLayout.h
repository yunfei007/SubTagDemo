//
//  EqualSpaceFlowLayout.h
//  SubTagDemo
//
//  Created by yf on 2018/9/27.
//  Copyright © 2018年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,AlignType){
    AlignWithLeft,
    AlignWithCenter,
    AlignWithRight
};

@interface EqualSpaceFlowLayout : UICollectionViewFlowLayout

//两个Cell之间的距离
@property (nonatomic,assign)CGFloat betweenOfCell;
//cell对齐方式
@property (nonatomic,assign)AlignType cellType;

-(instancetype)initWthType : (AlignType)cellType;
//全能初始化方法 其他方式初始化最终都会走到这里
-(instancetype)initWithType:(AlignType) cellType betweenOfCell:(CGFloat)betweenOfCell;

@end
