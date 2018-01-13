//
//  BYLimitTextView.h
//  jyxb_app
//
//  Created by xy_yanfa_imac on 2018/1/9.
//  Copyright © 2018年 xiaoyuxiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYLimitTextView : UIView
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *placeHolderLabel;
@property (nonatomic,strong) UILabel *countLabel;
/** maxCount = 0时无限制 */
@property (nonatomic,assign) NSInteger maxCount;
@end
