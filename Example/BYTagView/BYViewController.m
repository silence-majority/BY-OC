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
#import <BYTagView/BYEvaluateStar.h>
@interface BYViewController ()
@property (nonatomic,strong) BYTagsView *tagsView;

@end

@implementation BYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    BYTagModel *modelA = [[BYTagModel alloc] init];
    modelA.BYTagTitle = @"这是一个怎样的世界";
    modelA.BYTagId = [NSNumber numberWithInteger:1];
    modelA.BYIsSeleted = false;
    
    BYTagModel *modelB = [[BYTagModel alloc] init];
    modelB.BYTagTitle = @"舒徐水电费";
    modelB.BYTagId = [NSNumber numberWithInteger:2];
    modelB.BYIsSeleted = false;
    
    BYTagModel *modelC = [[BYTagModel alloc] init];
    modelC.BYTagTitle = @"打字好难";
    modelC.BYTagId = [NSNumber numberWithInteger:3];
    modelC.BYIsSeleted = false;
    
    BYTagModel *modelD = [[BYTagModel alloc] init];
    modelD.BYTagTitle = @"我是谁";
    modelD.BYTagId = [NSNumber numberWithInteger:4];
    modelD.BYIsSeleted = false;
    
    BYTagModel *modelE = [[BYTagModel alloc] init];
    modelE.BYTagTitle = @"啊啊啊啊";
    modelE.BYTagId = [NSNumber numberWithInteger:5];
    modelE.BYIsSeleted = false;
    
    BYTagModel *modelF = [[BYTagModel alloc] init];
    modelF.BYTagTitle = @"但是发生";
    modelF.BYTagId = [NSNumber numberWithInteger:6];
    modelF.BYIsSeleted = false;
    
    BYTagModel *modelG = [[BYTagModel alloc] init];
    modelG.BYTagTitle = @"史的方式";
    modelG.BYTagId = [NSNumber numberWithInteger:7];
    modelG.BYIsSeleted = false;
    
    BYTagModel *modelH = [[BYTagModel alloc] init];
    modelH.BYTagTitle = @"好的好的我们的";
    modelH.BYTagId = [NSNumber numberWithInteger:8];
    modelH.BYIsSeleted = false;
    
    BYTagModel *modelI = [[BYTagModel alloc] init];
    modelI.BYTagTitle = @"好的好的在";
    modelI.BYTagId = [NSNumber numberWithInteger:9];
    modelI.BYIsSeleted = false;
    
    NSArray *tags = @[modelA,modelB,modelC,modelD,modelE,modelF,modelG,modelH,modelI];
//    NSArray *tags = @[modelH,modelH,modelH,modelH,modelH,modelH,modelH,modelH];
    BYCollectionViewFlowLayout *layout = [[BYCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 10.0f;
    layout.minimumInteritemSpacing = 10.0f;
    layout.sectionInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    layout.tagFont = [UIFont systemFontOfSize:14];
    layout.freeSize = CGSizeMake(25, 12);
    layout.flowLayoutStrategy = BYFlowLayoutStrategyHalfAutoGapWithMargin;
    CGFloat contentViewHeigth = [BYTagsView getHeightWithTags:tags layout:layout width:[UIScreen mainScreen].bounds.size.width];
    _tagsView = [[BYTagsView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, contentViewHeigth) collectionViewLayout: layout];
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
    
//    BYEvaluateStar *evaluateStar = [[BYEvaluateStar alloc] initWithCountOfStar:5 originScore:5 normalImage:[UIImage imageNamed:@"normalStar"] selectedImage:[UIImage imageNamed:@"selectedStar"]];
    BYEvaluateStar *evaluateStar = [[BYEvaluateStar alloc] initWithCountOfStar:5 originScore:2.45 maskImage:[UIImage imageNamed:@"selectedStar"] normalColor:[UIColor lightGrayColor] focusColor:[UIColor redColor]];
    evaluateStar.frame = CGRectMake(100, 400, 240, 60);
    evaluateStar.backgroundColor = [UIColor whiteColor];
    evaluateStar.starSize = CGSizeMake(40, 40);
    evaluateStar.interSpace = 10;
    [self.view addSubview:evaluateStar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
