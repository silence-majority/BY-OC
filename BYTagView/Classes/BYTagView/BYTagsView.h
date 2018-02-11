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
@property (nonatomic,copy)NSArray<id<BYTagModelDelegate>> *tags;
/** 选中的tag数组 */
@property (nonatomic,strong) NSMutableArray<id<BYTagModelDelegate>> *selectedTags;
/** 是否支持多选 */
@property (nonatomic,assign) BOOL isMultiSelectEnable;

@property (nonatomic,copy) SelectTagFinished selectFinished;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) BYCollectionViewFlowLayout *layout;

+ (CGFloat)getHeightWithTags:(NSArray<id<BYTagModelDelegate>> *)tags layout:(BYCollectionViewFlowLayout *)layout width:(CGFloat)width;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(BYCollectionViewFlowLayout *)layout;

@end
