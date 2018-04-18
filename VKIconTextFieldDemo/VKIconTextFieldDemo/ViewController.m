//
//  ViewController.m
//  VKIconTextFieldDemo
//
//  Created by Senvid on 2018/4/18.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import "ViewController.h"
#import "VKIconTextField.h"

@interface ViewController ()

@property (nonatomic, strong) VKIconTextField *userNameTF;
@property (nonatomic, strong) VKIconTextField *passWordTF;

@property (nonatomic, strong) VKIconTextField *userNameTF1;
@property (nonatomic, strong) VKIconTextField *passWordTF1;

@end

@implementation ViewController

-(VKIconTextField *)userNameTF{
    if (!_userNameTF) {
        _userNameTF = [VKIconTextField new];
        _userNameTF.colorNormal = [UIColor groupTableViewBackgroundColor];
        _userNameTF.colorHighlight = [UIColor orangeColor];
        _userNameTF.leftIconNormal = [UIImage imageNamed:@"user"];
        _userNameTF.leftIconHighlight = [UIImage imageNamed:@"user_2"];
        _userNameTF.showHighlightedEditing = YES;
        _userNameTF.showBottomLine = YES;
        _userNameTF.placeholder = @"请输入用户名";
    }
    return _userNameTF;
}

-(VKIconTextField *)passWordTF{
    if (!_passWordTF) {
        _passWordTF = [VKIconTextField new];
        _passWordTF.colorNormal = [UIColor groupTableViewBackgroundColor];
        _passWordTF.colorHighlight = [UIColor orangeColor];
        _passWordTF.leftTitleNormal = @"密码:";
        _passWordTF.showBottomLine = YES;
        _passWordTF.showHighlightedEditing = YES;
        _passWordTF.placeholder = @"请输入密码";
        _passWordTF.font = [UIFont systemFontOfSize:16];
    }
    return _passWordTF;
}


-(VKIconTextField *)userNameTF1{
    if (!_userNameTF1) {
        _userNameTF1 = [VKIconTextField new];
        _userNameTF1.colorNormal = [UIColor groupTableViewBackgroundColor];
        _userNameTF1.colorHighlight = [UIColor blueColor];
        _userNameTF1.leftIconNormal = [UIImage imageNamed:@"user"];
        _userNameTF1.leftIconHighlight = [UIImage imageNamed:@"user_2"];
        _userNameTF1.showHighlightedEditing = YES;
        _userNameTF1.showBoundLine = YES;
        _userNameTF1.placeholder = @"请输入用户名";
    }
    return _userNameTF1;
}

-(VKIconTextField *)passWordTF1{
    if (!_passWordTF1) {
        _passWordTF1 = [VKIconTextField new];
        _passWordTF1.colorNormal = [UIColor groupTableViewBackgroundColor];
        _passWordTF1.colorHighlight = [UIColor blueColor];
        _passWordTF1.leftIconNormal = [UIImage imageNamed:@"shield"];
        _passWordTF1.leftIconHighlight = [UIImage imageNamed:@"shield_2"];
        _passWordTF1.showBoundLine = YES;
        _passWordTF1.showHighlightedEditing = YES;
        _passWordTF1.placeholder = @"请输入密码";
        
        _passWordTF1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _passWordTF1.layer.cornerRadius = 20;
    }
    return _passWordTF1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.userNameTF];
    [self.view addSubview:self.passWordTF];
    
    self.userNameTF.frame = CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 40);
    self.passWordTF.frame = CGRectMake(10, 150, [UIScreen mainScreen].bounds.size.width-20, 40);
    
    [self.view addSubview:self.userNameTF1];
    [self.view addSubview:self.passWordTF1];
    
    self.userNameTF1.frame = CGRectMake(10, 230, [UIScreen mainScreen].bounds.size.width-20, 40);
    self.passWordTF1.frame = CGRectMake(10, 280, [UIScreen mainScreen].bounds.size.width-20, 40);
}


@end
