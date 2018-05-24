//
//  ContentViewController.h
//  NTA_PullUp
//
//  Created by AnhNguyen on 11/5/17.
//  Copyright © 2017 ATA_Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@import ISHPullUp;

@interface ContentViewController : UIViewController<ISHPullUpContentDelegate>

@property (nonatomic, weak) IBOutlet UIView *rootContentView;

@end
