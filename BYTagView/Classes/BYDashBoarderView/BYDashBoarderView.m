//
//  BYDashBoarderView.m
//  jyxb_app
//
//  Created by xy_yanfa_imac on 2018/1/12.
//  Copyright © 2018年 xiaoyuxiaoyu. All rights reserved.
//

#import "BYDashBoarderView.h"

@implementation BYDashBoarderView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self.layer insertSublayer:self.shaperLayer atIndex:0];
    _shaperLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:4].CGPath;
}

- (CAShapeLayer *)shaperLayer{
    if(!_shaperLayer){
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 1;
        shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        shapeLayer.lineDashPattern = @[@3,@2];
        _shaperLayer = shapeLayer;
    }
    return _shaperLayer;
}

@end
