//
//  BYCollectionViewFlowLayout.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import "BYCollectionViewFlowLayout.h"

@interface BYCollectionViewFlowLayout()
@property (nonatomic,weak) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic,strong) NSMutableArray<NSMutableArray *> *layoutAttributes;
@property (nonatomic,assign) CGFloat contentViewHeight;
@end

@implementation BYCollectionViewFlowLayout

- (instancetype) init{
    if (self = [super init]){
        _layoutAttributes = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)prepareLayout{
    [super prepareLayout];
    [_layoutAttributes removeAllObjects];
    CGFloat originX = self.sectionInset.left;
    [_layoutAttributes addObject:[NSMutableArray array]];
#warning  only one section
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for(NSInteger index=0; index<itemCount; index++){
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:index inSection:0];
        [self itemSizeForIndexPath:indexpath];
        if ((originX+self.itemSize.width+self.sectionInset.right) > self.collectionView.bounds.size.width){
            originX = self.sectionInset.left;
            [_layoutAttributes addObject:[NSMutableArray array]];
        }
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
        attribute.frame = CGRectMake(0, 0, self.itemSize.width, self.itemSize.height);
        [[_layoutAttributes lastObject] addObject:attribute];
        originX += self.itemSize.width+self.minimumInteritemSpacing;
    }
    [self layoutWithStrategy:_flowLayoutStrategy layoutAttributes:_layoutAttributes];
    _contentViewHeight = _layoutAttributes.count*(self.minimumLineSpacing+self.itemSize.height)-self.minimumLineSpacing + self.sectionInset.top+self.sectionInset.bottom;
}

- (void)layoutWithStrategy:(BYFlowLayoutStrategy)strategy layoutAttributes:(NSMutableArray<NSMutableArray *> *)layoutAttributes{
    NSInteger row = 0;
    for (NSMutableArray *oneRowAttributes in layoutAttributes){
        CGFloat tagsWidth = 0;
        for (UICollectionViewLayoutAttributes *attribute in oneRowAttributes){
            tagsWidth += attribute.frame.size.width;
        }
        CGFloat averageGapWidth = 0;
        CGPoint origin = CGPointZero;
        switch (strategy) {
            case BYFlowLayoutStrategyConstantGap:
                averageGapWidth = self.minimumInteritemSpacing;
                origin = CGPointMake(self.sectionInset.left, 0);
                break;
            case BYFlowLayoutStrategyFullAutoGap:
                averageGapWidth = (self.collectionView.bounds.size.width-tagsWidth)/(oneRowAttributes.count-1+2);
                origin = CGPointMake(averageGapWidth, 0);
                break;
            case BYFlowLayoutStrategyHalfAutoGapWithMargin:
                averageGapWidth = (self.collectionView.bounds.size.width-tagsWidth-self.sectionInset.left-self.sectionInset.right)/(oneRowAttributes.count-1);
                if (row == layoutAttributes.count-1 && averageGapWidth > 40){
                    averageGapWidth = 20;
                }
                origin = CGPointMake(self.sectionInset.left, 0);
                break;
        }
        for (UICollectionViewLayoutAttributes *attribute in oneRowAttributes){
            attribute.frame = CGRectMake(origin.x, self.sectionInset.top+(row*(self.itemSize.height+self.minimumLineSpacing)), attribute.frame.size.width, attribute.frame.size.height);
            origin = CGPointMake(origin.x+attribute.frame.size.width+averageGapWidth, 0);
        }
        row++;
    }
}

/** 父类方法 */
- (CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width,_contentViewHeight);
}

/** 父类方法 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(oldBounds) != CGRectGetWidth(newBounds)) {
        return true;
    }
    return false;
}

/** 父类方法 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *array = [NSMutableArray array];
    for (NSMutableArray *oneRowAttributes in _layoutAttributes){
        for (UICollectionViewLayoutAttributes *attribute in oneRowAttributes){
            [array addObject:attribute];
        }
    }
    return array;
}

/** 代理方法，传入indexPath，返回item的Size */
- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath{
    if (!_delegate) {
        _delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    }
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    return self.itemSize;
}

@end
