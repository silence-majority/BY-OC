//
//  BYTagModel+BYTag.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/2/11.
//

#import "BYTagModel+BYTag.h"

@implementation BYTagModel (BYTag)

- (NSString *)tagTitle{
    return self.BYTagTitle;
}

- (BOOL)isSeleted{
    return self.BYIsSeleted;
}

- (NSNumber *)tagId{
    return self.BYTagId;
}

- (void)setIsSeleted:(BOOL)isSeleted{
    self.BYIsSeleted = isSeleted;
}

@end
