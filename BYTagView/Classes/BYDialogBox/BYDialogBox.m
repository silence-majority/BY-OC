//
//  BYDialogBox.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/11.
//

#import "BYDialogBox.h"
@interface BYDialogBox()
@property (nonatomic,strong) CAShapeLayer *arrowMarkLayer;
//BYDialogBox的顶点相对于自己的坐标，通过ratio和bound来计算
@property (nonatomic,assign) CGPoint peakPoint;
@end

@implementation BYDialogBox
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        _arrowMarkHeight = 10;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self addSubview:self.dialogLabel];
    _dialogLabel.backgroundColor = _themeColor;
    _dialogLabel.alpha = _themeAlpha;
    
    switch (_orientation) {
        case BYDialogBoxOrientationUP:{
             _dialogLabel.frame = CGRectMake(0, _arrowMarkHeight, self.frame.size.width, self.frame.size.height-_arrowMarkHeight);
            _peakPoint = CGPointMake((self.frame.size.width)/(_ratio+1)*_ratio, 0);
            CGPoint origin = CGPointMake(_jointPoint.x-_peakPoint.x, _jointPoint.y);
            self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
            break;
        }
        case BYDialogBoxOrientationDown:{
            _dialogLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-_arrowMarkHeight);
            _peakPoint = CGPointMake((self.frame.size.width)/(_ratio+1)*_ratio, self.frame.size.height);
            CGPoint origin = CGPointMake(_jointPoint.x-_peakPoint.x, _jointPoint.y-self.frame.size.height);
            self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
        }
    }
    
    [self.layer addSublayer:self.arrowMarkLayer];
    _arrowMarkLayer.opacity = _themeAlpha;
}

- (UILabel *)dialogLabel{
    if (!_dialogLabel){
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 5;
        label.clipsToBounds = true;
        _dialogLabel = label;
    }
    return _dialogLabel;
}

- (CAShapeLayer *)arrowMarkLayer{
    if(!_arrowMarkLayer){
        CAShapeLayer *layer = [CAShapeLayer layer];
        UIBezierPath *trianglePath = [UIBezierPath bezierPath];
        switch (_orientation) {
            case BYDialogBoxOrientationUP:{
                [trianglePath moveToPoint:CGPointMake(_peakPoint.x-_arrowMarkHeight, _arrowMarkHeight)];//1.732/3.0*_arrowMarkHeight -> 等边三角形
                [trianglePath addLineToPoint:_peakPoint];
                [trianglePath addLineToPoint:CGPointMake(_peakPoint.x+_arrowMarkHeight, _arrowMarkHeight)];// 等腰直角三角形
                break;
            }
            case BYDialogBoxOrientationDown:{
                [trianglePath moveToPoint:CGPointMake(_peakPoint.x-_arrowMarkHeight, self.frame.size.height - _arrowMarkHeight)];//1.732/3.0*_arrowMarkHeight -> 等边三角形
                [trianglePath addLineToPoint:_peakPoint];
                [trianglePath addLineToPoint:CGPointMake(_peakPoint.x+_arrowMarkHeight, self.frame.size.height - _arrowMarkHeight)];// 等腰直角三角形
            }
        }
        [trianglePath closePath];
        layer.path = trianglePath.CGPath;
        layer.backgroundColor = _themeColor.CGColor;
        _arrowMarkLayer = layer;
    }
    return _arrowMarkLayer;
}

@end
