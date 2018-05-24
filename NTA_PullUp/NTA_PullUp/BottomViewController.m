//
//  BottomViewController.m
//  NTA_PullUp
//
//  Created by AnhNguyen on 11/4/17.
//  Copyright © 2017 ATA_Studio. All rights reserved.
//

#import "BottomViewController.h"

@interface BottomViewController ()

@property (nonatomic) BOOL isTap;

@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.topView addGestureRecognizer:tapGestureRecognizer];
    
    self.firstAppearanceCompleted = NO;
    self.isTap = NO;
    self.halfWayPoint = 0;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)recognizer {
    //Code to handle the gesture
    if (self.pullUpController.isLocked) {
        return;
    }
    self.isTap = YES;
    [self.pullUpController toggleStateAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.firstAppearanceCompleted = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)pullUpViewController:(ISHPullUpViewController *)pullUpViewController minimumHeightForBottomViewController:(UIViewController *)bottomVC {
    return [self.topView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

- (CGFloat)pullUpViewController:(ISHPullUpViewController *)pullUpViewController maximumHeightForBottomViewController:(UIViewController *)bottomVC maximumAvailableHeight:(CGFloat)maximumAvailableHeight {
    float totalHeight = [self.rootView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // we allow the pullUp to snap to the half way point
    // we "calculate" the cached value here
    // and perform the snapping in ..targetHeightForBottomViewController..
    self.halfWayPoint = totalHeight / 2.0;
    if (self.isTap) {
        return self.halfWayPoint;
    } else {
        return totalHeight;
    }
}

- (CGFloat)pullUpViewController:(ISHPullUpViewController *)pullUpViewController targetHeightForBottomViewController:(UIViewController *)bottomVC fromCurrentHeight:(CGFloat)height {
    if (fabs(height - self.halfWayPoint) < 150) {
        return self.halfWayPoint;
    }
    
    // default behaviour
    return height;
}

- (void)pullUpViewController:(ISHPullUpViewController *)pullUpViewController updateEdgeInsets:(UIEdgeInsets)edgeInsets forBottomViewController:(UIViewController *)contentVC {
    self.scrollView.contentInset = edgeInsets;
}

- (void)pullUpViewController:(ISHPullUpViewController *)pullUpViewController didChangeToState:(ISHPullUpState)state {
    switch (state) {
        case ISHPullUpStateCollapsed:
            NSLog(@"ISHPullUpStateCollapsed");
            break;
        case ISHPullUpStateIntermediate:
            NSLog(@"ISHPullUpStateIntermediate");
            break;
        case ISHPullUpStateDragging:
            NSLog(@"ISHPullUpStateDragging");
            self.isTap = NO;
            break;
        case ISHPullUpStateExpanded:
            NSLog(@"ISHPullUpStateExpanded");
            break;
        default:
            break;
    }
}

@end
