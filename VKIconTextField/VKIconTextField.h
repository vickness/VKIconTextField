//
//  VKIconTextField.h
//  VKIconTextFieldDemo
//
//  Created by Senvid on 2018/4/18.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKIconTextField : UITextField

/** 左侧图片*/
@property (nonatomic, strong) UIImage *leftIconNormal;
@property (nonatomic, strong) UIImage *leftIconHighlight;

/** 左侧标题*/
@property (nonatomic, copy) NSString *leftTitleNormal;
@property (nonatomic, copy) NSString *leftTitleHighlight;

/** 普通和高亮颜色*/
@property (nonatomic, strong) UIColor *colorNormal;
@property (nonatomic, strong) UIColor *colorHighlight;

/** 进入编辑状态是否显示高亮状态*/
@property (nonatomic, assign) BOOL showHighlightedEditing;

/** 显示底部分隔线*/
@property (nonatomic, assign) BOOL showBottomLine;

/** 显示边框*/
@property (nonatomic, assign) BOOL showBoundLine;

/** 分隔线宽度*/
@property (nonatomic, assign) CGFloat separateLineWith;

/** 输入框文字变化*/
@property (nonatomic, copy) BOOL (^shouldChangeBlock)(UITextField *textField, NSRange range, NSString *string);

@end
