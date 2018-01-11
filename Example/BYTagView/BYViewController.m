//
//  BYViewController.m
//  BYTagView
//
//  Created by silence-majority on 01/09/2018.
//  Copyright (c) 2018 silence-majority. All rights reserved.
//

#import "BYViewController.h"
#import <BYTagView/BYTagsView.h>
#import <BYTagView/BYDialogBox.h>
@interface BYViewController ()
@property (nonatomic,strong) BYTagsView *tagsView;

@end

@implementation BYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    BYTagModel *modelA = [[BYTagModel alloc] init];
    modelA.tagTitle = @"这是一个怎样的世界";
    modelA.tagId = [NSNumber numberWithInteger:1];
    modelA.isSeleted = false;
    
    BYTagModel *modelB = [[BYTagModel alloc] init];
    modelB.tagTitle = @"舒徐";
    modelB.tagId = [NSNumber numberWithInteger:2];
    modelB.isSeleted = false;
    
    BYTagModel *modelC = [[BYTagModel alloc] init];
    modelC.tagTitle = @"打字好难";
    modelC.tagId = [NSNumber numberWithInteger:3];
    modelC.isSeleted = false;
    
    BYTagModel *modelD = [[BYTagModel alloc] init];
    modelD.tagTitle = @"我是谁这是什么";
    modelD.tagId = [NSNumber numberWithInteger:4];
    modelD.isSeleted = false;
    
    BYTagModel *modelE = [[BYTagModel alloc] init];
    modelE.tagTitle = @"啊啊啊啊啊";
    modelE.tagId = [NSNumber numberWithInteger:5];
    modelE.isSeleted = false;
    
    BYTagModel *modelF = [[BYTagModel alloc] init];
    modelF.tagTitle = @"但是发生的";
    modelF.tagId = [NSNumber numberWithInteger:6];
    modelF.isSeleted = false;
    
    BYTagModel *modelG = [[BYTagModel alloc] init];
    modelG.tagTitle = @"第三代";
    modelG.tagId = [NSNumber numberWithInteger:7];
    modelG.isSeleted = false;
    
    NSArray *tags = @[modelA,modelB,modelC,modelD,modelE,modelF,modelG];
//    NSArray *tags = @[modelA,modelA,modelA,modelA,modelA,modelA,modelA];
    CGFloat contentViewHeigth = [BYTagsView getHeightWithTags:tags layout:[BYCollectionViewFlowLayout new] width:[UIScreen mainScreen].bounds.size.width];
    _tagsView = [[BYTagsView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, contentViewHeigth)];
    _tagsView.tags = tags;
    _tagsView.isMultiSelectEnable = false;
    [self.view addSubview:_tagsView];
    
    BYDialogBox *dialogBox = [[BYDialogBox alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    dialogBox.dialogLabel.text = @"课件下架后，将不能继续售卖";
    dialogBox.themeColor = [UIColor blackColor];
    dialogBox.jointPoint = CGPointMake(300, 300);
    dialogBox.ratio = 5;
    dialogBox.themeAlpha = 0.8;
    dialogBox.orientation = BYDialogBoxOrientationDown;
    [self.view addSubview:dialogBox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
