//
//  VKIconTextField.m
//  VKIconTextFieldDemo
//
//  Created by Senvid on 2018/4/18.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import "VKIconTextField.h"

@interface VKIconTextField () <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *leftBtnView;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation VKIconTextField

#pragma mark -
#pragma mark - 初始化
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    
    self.leftViewMode = UITextFieldViewModeAlways;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.returnKeyType = UIReturnKeyDone;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.delegate = self;
    self.separateLineWith = 1.0;
}


#pragma mark -
#pragma mark - 视图懒加载
-(UIView *)bottomLine{
    
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = _colorNormal;
        _bottomLine.frame = CGRectMake(0, CGRectGetHeight(self.bounds)-self.separateLineWith, CGRectGetWidth(self.bounds), self.separateLineWith);
        _bottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    }
    return _bottomLine;
}

-(UIButton *)leftBtnView {
    if (!_leftBtnView) {
        _leftBtnView = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtnView.showsTouchWhenHighlighted = NO;
    }
    return _leftBtnView;
}


#pragma mark -
#pragma mark - 编辑状态的处理
/** 进入编辑状态*/
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (_showHighlightedEditing) {
        [self performSelector:@selector(changeEditStatus:) withObject:@(YES) afterDelay:0.1];
    }
}

/** 退出编辑状态*/
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (_showHighlightedEditing) {
        [self performSelector:@selector(changeEditStatus:) withObject:@(NO) afterDelay:0.1];
    }
}


/** 改变编辑状态*/
-(void)changeEditStatus:(id)obj{
    
    if ([obj boolValue]) {
        
        if (_leftBtnView) {
            _leftBtnView.selected = YES;
        }
        if (_bottomLine) {
            _bottomLine.backgroundColor = _colorHighlight;
        }
        if (_showBoundLine) {
            self.layer.borderColor = _colorHighlight.CGColor;
        }
        
    } else {
        
        if (_leftBtnView) {
            _leftBtnView.selected = NO;
        }
        if (_bottomLine) {
            _bottomLine.backgroundColor = _colorNormal;
        }
        if (_showBoundLine) {
            self.layer.borderColor = _colorNormal.CGColor;
        }
    }
}

/** 退出编辑状态*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/** 输入文字变化*/
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (self.shouldChangeBlock) {
        return self.shouldChangeBlock(textField, range, string);
    }
    return YES;
}


#pragma mark -
#pragma mark - 设置左边的图片
/** 设置左边视图普通状态的图片*/
-(void)setLeftIconNormal:(UIImage *)leftIconNormal{
    _leftIconNormal = leftIconNormal;
    [self.leftBtnView setImage:leftIconNormal forState:UIControlStateNormal];
    [self.leftBtnView sizeToFit];
    self.leftView = self.leftBtnView;
}

/** 设置左边视图高亮状态的图片*/
-(void)setLeftIconHighlight:(UIImage *)leftIconHighlight{
    _leftIconHighlight = leftIconHighlight;
    [self.leftBtnView setImage:leftIconHighlight forState:UIControlStateSelected];
}


#pragma mark -
#pragma mark - 设置左边的标题
/** 设置标题*/
-(void)setLeftTitleNormal:(NSString *)leftTitleNormal{
    _leftTitleNormal = leftTitleNormal;
    [self.leftBtnView setTitle:leftTitleNormal forState:UIControlStateNormal];
    [self.leftBtnView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.leftBtnView sizeToFit];
    self.leftView = self.leftBtnView;
}

/** 设置标题高亮*/
-(void)setLeftTitleHighlight:(NSString *)leftTitleHighlight{
    _leftTitleHighlight = leftTitleHighlight;
    [self.leftBtnView setTitle:leftTitleHighlight forState:UIControlStateSelected];
}

/** 设置字体*/
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.leftBtnView.titleLabel.font = font;
}


#pragma mark -
#pragma mark - 设置状态颜色
/** 普通颜色*/
-(void)setColorNormal:(UIColor *)colorNormal{
    _colorNormal = colorNormal;
    _bottomLine.backgroundColor = colorNormal;
}

/** 高亮颜色*/
-(void)setColorHighlight:(UIColor *)colorHighlight{
    _colorHighlight = colorHighlight;
    //修改光标颜色
    [self setTintColor:colorHighlight];
}


#pragma mark -
#pragma mark - 设置分割线
/** 显示底部分割线*/
-(void)setShowBottomLine:(BOOL)showBottomLine{
    _showBottomLine = showBottomLine;
    if (_showBottomLine) {
        [self addSubview:self.bottomLine];
    }
}

/** 显示边框*/
-(void)setShowBoundLine:(BOOL)showBoundLine{
    _showBoundLine = showBoundLine;
    if (_showBoundLine) {
        self.layer.borderWidth = _separateLineWith;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = _colorNormal.CGColor;
    }
}


#pragma mark -
#pragma mark - 调整边距
//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    CGRect rect = [super textRectForBounds:bounds];
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 0);
    return UIEdgeInsetsInsetRect(rect, insets);
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect rect = [super textRectForBounds:bounds];
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 0);
    return UIEdgeInsetsInsetRect(rect, insets);
}

//控制左侧视图显示位置
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect rect = [super leftViewRectForBounds:bounds];
    if (_showBoundLine) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, -10);
        return UIEdgeInsetsInsetRect(rect, insets);
    }
    return rect;
}

@end

