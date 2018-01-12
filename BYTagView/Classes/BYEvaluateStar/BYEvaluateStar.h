//
//  BYEvaluateStar.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/12.
//

#import <UIKit/UIKit.h>
typedef void (^BYEvaluateFinish)(NSInteger score);
@interface BYEvaluateStar : UIView

-(instancetype)initWithCountOfStar:(NSUInteger)count originScore:(NSUInteger)originScore normalImage:(UIImage *)normalImage selectedImage:(UIImage *)seletedImage;
@property (nonatomic,copy)BYEvaluateFinish evaluateFinish;

/* 星星与星星之间的距离 **/
@property (nonatomic,assign) CGFloat interSpace;
@property (nonatomic,assign) CGSize starSize;

@end
