//
//  ViewController.m
//  ViewCodeObjc
//
//  Created by Fabio Lindemberg on 13/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    [self configRootView];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [self.navigationController setNavigationBarHidden: YES];
    
    [self configRootView];
}

- (void) configRootView {

    UIImageView *imageView = [UIImageView new];
    
    imageView.image = [UIImage imageNamed: @"mountain"];
    imageView.frame = self.view.bounds;
    
    [self.view addSubview: imageView];

    // ContentView
    UIView *contentView = [UIView new];
    
    CGFloat baseWidth = self.view.frame.size.width;
    CGFloat baseHeight = self.view.frame.size.height;

    contentView.frame = CGRectMake(baseWidth * 0.1, baseHeight * 0.3, baseWidth * 0.8, baseHeight * 0.4);
    
    contentView.layer.cornerRadius = 20;
    
    [contentView setBackgroundColor: [UIColor colorWithWhite: 1 alpha:0.7]];
    
    contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    contentView.layer.shadowOffset = CGSizeMake( 2, 3);
    contentView.layer.masksToBounds = NO;
    contentView.layer.shadowOpacity = 0.3;
    contentView.layer.shadowRadius = 3;
    contentView.layer.rasterizationScale = UIScreen.mainScreen.scale;
    contentView.layer.shouldRasterize = YES;

    // StackView
    UIStackView *stackView = [UIStackView new];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.frame = CGRectMake(16, contentView.frame.size.height/2-55, contentView.frame.size.width - 32, 110);
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    
    [stackView addArrangedSubview: [self buildTextFieldWithPlaceholder: @"Type a user name" securityEntry: NO]];
    
    [stackView addArrangedSubview: [self buildTextFieldWithPlaceholder: @"Type a password" securityEntry: YES]];
    
    [stackView addArrangedSubview: [self buildLoginButton]];

    [contentView addSubview: stackView];
    
    [self.view addSubview: contentView];
    
}

- (UIView*) buildLoginButton {
        
    UIButton *loginButton = [UIButton new];
    [loginButton setTitle: @"Sign In" forState:normal];
    loginButton.backgroundColor = [UIColor blackColor];
    loginButton.layer.cornerRadius = 5;

    return loginButton;
}

- (UIView*) buildTextFieldWithPlaceholder: (NSString *) placeholder
                     securityEntry: (BOOL) securityEntry {
    
    UITextField *textField = [UITextField new];
    textField.secureTextEntry = securityEntry;
    [textField setPlaceholder: placeholder];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    return textField;
}


@end
