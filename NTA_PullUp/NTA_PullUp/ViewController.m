//
//  ViewController.m
//  NTA_PullUp
//
//  Created by AnhNguyen on 11/4/17.
//  Copyright © 2017 ATA_Studio. All rights reserved.
//

#import "ViewController.h"
#import "BottomViewController.h"
#import "ContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BottomViewController * bottomVC = [self viewControllerInStoryboard:@"Main" identifier:@"BottomViewController"];
    ContentViewController * contentVC = [self viewControllerInStoryboard:@"Main" identifier:@"ContentViewController"];
    [self setContentViewController:contentVC];
    [self setBottomViewController:bottomVC];
    
    self.topMargin = 0.0;
    [self setBottomHeight:49.0 animated:YES];
    bottomVC.pullUpController  = self;
    self.contentDelegate = contentVC;
    self.sizingDelegate = bottomVC;
    self.stateDelegate = bottomVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) viewControllerInStoryboard: (NSString *) storyboardName identifier: (NSString *) identifier {
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}


@end
