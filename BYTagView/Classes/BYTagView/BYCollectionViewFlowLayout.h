//
//  BYCollectionViewFlowLayout.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BYFlowLayoutStrategy){
    /** 指定边缘和item之间的间距，严格按照指定的参数布局 */
    BYFlowLayoutStrategyConstantGap = 0,
    /** 自动布局（自动计算边缘和item之间的距离） */
    BYFlowLayoutStrategyFullAutoGap,
    /** 半自动布局，指定边缘，自动计算item间的距离 */
    BYFlowLayoutStrategyHalfAutoGapWithMargin
};

@interface BYCollectionViewFlowLayout : UICollectionViewFlowLayout
@property (nonatomic,assign) BYFlowLayoutStrategy flowLayoutStrategy;
@end
