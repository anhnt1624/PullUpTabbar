//
//  BottomViewController.h
//  NTA_PullUp
//
//  Created by AnhNguyen on 11/4/17.
//  Copyright © 2017 ATA_Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@import ISHPullUp;

@interface BottomViewController : UIViewController<ISHPullUpSizingDelegate, ISHPullUpStateDelegate>

@property (nonatomic, strong) ISHPullUpViewController *pullUpController;
@property (nonatomic) CGFloat halfWayPoint;
@property (nonatomic) BOOL firstAppearanceCompleted;
@property (nonatomic, weak) IBOutlet UIView *rootView;
@property (nonatomic, weak) IBOutlet UIView *topView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end
