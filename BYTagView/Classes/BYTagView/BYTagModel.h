//
//  BYTagModel.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <Foundation/Foundation.h>

@interface BYTagModel : NSObject
@property (nonatomic,strong) NSNumber *BYTagId;
@property (nonatomic,copy) NSString *BYTagTitle;
@property (nonatomic,assign) BOOL BYIsSeleted;
@end
