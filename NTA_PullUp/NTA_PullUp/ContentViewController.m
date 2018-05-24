//
//  ContentViewController.m
//  NTA_PullUp
//
//  Created by AnhNguyen on 11/5/17.
//  Copyright © 2017 ATA_Studio. All rights reserved.
//

#import "ContentViewController.h"
@import ISHPullUp;

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pullUpViewController:(ISHPullUpViewController *)pullUpViewController updateEdgeInsets:(UIEdgeInsets)edgeInsets forContentViewController:(UIViewController *)contentVC {
    if (@available(iOS 11.0, *)) {
        self.additionalSafeAreaInsets = edgeInsets;
        self.rootContentView.layoutMargins = UIEdgeInsetsZero;
    } else {
        // update edgeInsets
        self.rootContentView.layoutMargins = edgeInsets;
    }
    
    // call layoutIfNeeded right away to participate in animations
    // this method may be called from within animation blocks
    [self.rootContentView layoutIfNeeded];
}


@end
