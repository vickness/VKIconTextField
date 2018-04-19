# VKIconTextField
UITextField的封装，可以设置图片，分隔线和高亮状态

# CocoaPods
```
pod 'VKIconTextField', '~> 1.0'
```

# ScreenShot

<figure class="half">
    <img src="http://github.com/Senvid-iOS/VKIconTextField/raw/master/ScreenShot/image1.png">
    <img src="http://github.com/Senvid-iOS/VKIconTextField/raw/master/ScreenShot/image1.png">
</figure>

![截图](https://github.com/Senvid-iOS/VKIconTextField/raw/master/ScreenShot/image1.png)![截图](https://github.com/Senvid-iOS/VKIconTextField/raw/master/ScreenShot/image2.png)

# Examples
```
-(VKIconTextField *)userNameTF{
    if (!_userNameTF) {
        _userNameTF = [VKIconTextField new];
        _userNameTF.colorNormal = [UIColor groupTableViewBackgroundColor];
        _userNameTF.colorHighlight = [UIColor orangeColor];
        _userNameTF.leftIconNormal = [UIImage imageNamed:@"user_login"];
        _userNameTF.leftIconHighlight = [UIImage imageNamed:@"user_login"];
        _userNameTF.showHighlightedEditing = YES;
        _userNameTF.showBottomLine = YES;
        _userNameTF.placeholder = @"请输入用户名";
    }
    return _userNameTF;
}
```
