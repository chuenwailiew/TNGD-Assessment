//
//  ViewController.m
//  TNGD Assessment
//
//  Created by Chuen Wai Liew on 27/01/2022.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.view setBackgroundColor: UIColor.greenColor];
  
  _button = [UIButton buttonWithType: UIButtonTypeCustom];
  [_button setTitle: @"Toggle" forState: normal];
  [_button setTitleColor: UIColor.whiteColor forState: normal];
  [_button setBackgroundColor: UIColor.blackColor];
  [_button addTarget: self action: @selector(buttonTap) forControlEvents: UIControlEventTouchUpInside];
  
  [self.view addSubview: _button];
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  
  [self layoutButton];
}

- (void)layoutButton {
  _button.translatesAutoresizingMaskIntoConstraints = NO;
  [_button.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = YES;
  [_button.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor].active = YES;
  [_button.widthAnchor constraintEqualToConstant: 70].active = YES;
  [_button.heightAnchor constraintEqualToConstant: 30].active = YES;
}

- (void)buttonTap {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    __weak typeof(self) weakSelf = self;
    
    if ([weakSelf.view backgroundColor] == UIColor.greenColor) {
      [weakSelf.view setBackgroundColor: UIColor.redColor];
    } else if ([weakSelf.view backgroundColor] == UIColor.redColor) {
      [weakSelf.view setBackgroundColor: UIColor.greenColor];
    }
    
  });
}


@end
