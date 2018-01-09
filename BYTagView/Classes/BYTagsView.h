//
//  BYTagsView.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <UIKit/UIKit.h>
#import "BYCollectionViewFlowLayout.h"
#import "BYTagModel.h"
typedef void (^SelectTagFinished)(NSArray *selectedTagsArray);

@interface BYTagsView : UIView
/** 所有的tag数组 */
@property (nonatomic,copy)NSArray<BYTagModel *> *tags;
/** 选中的tag数组 */
@property (nonatomic,strong) NSMutableArray<BYTagModel *> *selectedTags;
/** 是否支持多选 */
@property (nonatomic,assign) BOOL isMultiSelectEnable;

@property (nonatomic,copy) SelectTagFinished selectFinished;

@property (nonatomic,strong) BYCollectionViewFlowLayout *layout;

+ (CGFloat)getHeightWithTags:(NSArray<BYTagModel *> *)tags layout:(BYCollectionViewFlowLayout *)layout width:(CGFloat)width;

@end
