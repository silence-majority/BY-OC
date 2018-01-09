//
//  BYTagModel.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <Foundation/Foundation.h>

@interface BYTagModel : NSObject
@property (nonatomic,strong) NSNumber *tagId;
@property (nonatomic,copy) NSString *tagTitle;
@property (nonatomic,assign) BOOL isSeleted;
@end
