//
//  BYCollectionViewFlowLayout.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <UIKit/UIKit.h>

@protocol BYTagModelDelegate <NSObject>

@property (nonatomic,strong,readonly) NSNumber *tagId;
@property (nonatomic,copy,readonly) NSString *tagTitle;
@property (nonatomic,assign) BOOL isSeleted;

@end

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
/** 布局会自动计算tag的size， freeSize 表示tiltle外的空余空间 默认（25，15）最终tag的 size = tiltle的size + freeSize */
@property (nonatomic,assign) CGSize freeSize;
/** tilte的字体，同样用来计算tag的尺寸 */
@property (nonatomic,strong) UIFont *tagFont;
@end
