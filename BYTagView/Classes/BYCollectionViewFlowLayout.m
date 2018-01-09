//
//  BYCollectionViewFlowLayout.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import "BYCollectionViewFlowLayout.h"

@interface BYCollectionViewFlowLayout()
@property (nonatomic,weak) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic,strong) NSMutableArray *layoutAttributes;
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
    _contentViewHeight = self.sectionInset.top+self.itemSize.height;
    CGFloat originX = self.sectionInset.left;
    CGFloat originY = self.sectionInset.top;
#warning  only one section
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for(NSInteger index=0; index<itemCount; index++){
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:index inSection:0];
        CGSize itemSize = [self itemSizeForIndexPath:indexpath];
        if ((originX+itemSize.width+self.sectionInset.right) > self.collectionView.bounds.size.width){
            originX = self.sectionInset.left;
            originY += (itemSize.height+self.minimumLineSpacing);
            _contentViewHeight += self.itemSize.height+self.minimumLineSpacing; //self.itemSize.height固定self.itemSize.width不固定
        }
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
        attribute.frame = CGRectMake(originX, originY, itemSize.width, itemSize.height);
        [_layoutAttributes addObject:attribute];
        
        originX += itemSize.width+self.minimumInteritemSpacing;
    }
    _contentViewHeight += self.sectionInset.bottom;
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
    return _layoutAttributes;
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
