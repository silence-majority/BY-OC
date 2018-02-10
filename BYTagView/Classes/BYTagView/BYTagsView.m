//
//  BYTagsView.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import "BYTagsView.h"
#import "BYTagCollectionViewCell.h"
@interface BYTagsView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation BYTagsView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(BYCollectionViewFlowLayout *)layout{
    if (self = [super initWithFrame:frame]){
        _layout = layout;
        _selectedTags = [[NSMutableArray alloc] init];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)layoutSubviews{
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView{
    if (!_collectionView){
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_layout];
        collectionView.scrollEnabled = false;
        collectionView.backgroundColor = [UIColor cyanColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[BYTagCollectionViewCell class] forCellWithReuseIdentifier:@"BYTagCellId"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    BYTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BYTagCellId" forIndexPath:indexPath];
    cell.titleLabel.text = _tags[indexPath.item].tagTitle;
    [cell setBackColor:[UIColor lightGrayColor] forStyle:(BYTagStyleNormal)];
    [cell setBackColor:[UIColor purpleColor] forStyle:(BYTagStyleFocus)];
    [cell setTitleColor:[UIColor blackColor] forStyle:BYTagStyleNormal];
    [cell setTitleColor:[UIColor whiteColor] forStyle:BYTagStyleFocus];
    if (_tags[indexPath.item].isSeleted){
        cell.tagStyle = BYTagStyleFocus;
    }else{
        cell.tagStyle = BYTagStyleNormal;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_isMultiSelectEnable){
        [_selectedTags addObject:_tags[indexPath.row]];
        _tags[indexPath.row].isSeleted = !_tags[indexPath.row].isSeleted;
    }else{
        if (_selectedTags.count != 0){
            _selectedTags.firstObject.isSeleted = false;
        }
        [_selectedTags removeAllObjects];
        _tags[indexPath.row].isSeleted = !_tags[indexPath.row].isSeleted;
         [_selectedTags addObject:_tags[indexPath.row]];
        
    }
    [_collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    BYCollectionViewFlowLayout *layout = (BYCollectionViewFlowLayout *)collectionView.collectionViewLayout;
    CGSize maxSize = CGSizeMake(collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
    CGRect titleLabelFrame = [_tags[indexPath.item].tagTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}  context:nil];
    return CGSizeMake(titleLabelFrame.size.width + 40, titleLabelFrame.size.height + 12);
}

+ (CGFloat)getHeightWithTags:(NSArray<BYTagModel *> *)tags layout:(BYCollectionViewFlowLayout *)layout width:(CGFloat)width {
    CGFloat contentViewHeight;
    if (!layout) {
        layout = [[BYCollectionViewFlowLayout alloc] init];
    }
    //cell的高度 = 顶部 + 高度
    contentViewHeight = layout.sectionInset.top + layout.itemSize.height;
    CGFloat originX = layout.sectionInset.left;
    CGFloat originY = layout.sectionInset.top;
    NSInteger itemCount = tags.count;
    
    for (NSInteger i = 0; i < itemCount; i++) {
        CGSize maxSize = CGSizeMake(width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
        CGRect frame = [tags[i].tagTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil];
        CGSize itemSize = CGSizeMake(frame.size.width + 40, frame.size.height + 12);
        if (layout.scrollDirection == UICollectionViewScrollDirectionVertical) {
            //垂直滚动
            if ((originX + itemSize.width + layout.sectionInset.right) > width) {
                originX = layout.sectionInset.left;
                originY += itemSize.height + layout.minimumLineSpacing;
                contentViewHeight += itemSize.height + layout.minimumLineSpacing;
            }
        }
        originX += itemSize.width + layout.minimumInteritemSpacing;
    }
    contentViewHeight += layout.sectionInset.bottom;
    return contentViewHeight;
}


@end
