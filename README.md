
## 前沿

* 项目中有时需要自定义 UIActionSheet 和 UIAlertView 来满足 app 界面的美观；以及购物类的 app 会遇到 UIPickerView 还有 UIDatePicker

* 这里的 SGActionSheet 采取的是微信、微博界面的布局样式,  SGAlertView 采取的是美团外卖的布局样式

* 这里的 SGPickerView 和 SGDatePicker 采取常见的两种样式来满足更多人的需求

* 轻轻的我走了，正如我轻轻的来，我动一动鼠标，就是为了给你 Star (喜欢的朋友别忘了哦 😊 😊）

* 代码后期不断更新维护中


## 主要内容的介绍

* `自定义 UIActionSheet (仿微信、微博)`<br>

* `自定义 UIAlertView (仿美团外卖)`<br>

* `对 UIPickerView 的封装`<br>

* `对 UIDatePicker 的封装`<br>


## 效果图

![](https://github.com/kingsic/SGPopupView/raw/master/Gif/sorgle.gif) 


## 代码介绍

### * `自定义的UIActionSheet`<br>

* SGActionSheet使用(一句代码创建, 一句代码调用)：

  * 将项目中SGActionSheet文件夹拖入工程

  * 导入#import "SGActionSheet.h"头文件

  * 对象方法创建
```Objective-C
 - (instancetype)initWithFrameWithTitle:(NSString *)title delegate:(id<SGActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray 
```

  * 类方法创建
```Objective-C
 + (instancetype)actionSheetWithTitle:(NSString *)title delegate:(id<SGActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray
```

* 对象调用show方法, 展示SGActionSheet

  * 属性设置

   * sheet.messageTextColor = [UIColor redColor]; // 设置提示信息文字颜色 （默认为黑色）
 
   * sheet.otherTitleColor = [UIColor brownColor]; // 设置其他按钮文字颜色 （默认为黑色）

   * sheet.cancelButtonTitleColor = [UIColor redColor]; // 设置取消按钮文字颜色 （默认为黑色）

   * sheet.messageTextFont = [UIFont systemFontOfSize:20];  // 设置提示信息文字大小 （默认为17）

   * sheet.otherTitleFont = [UIFont systemFontOfSize:20];  // 设置其他按钮文字大小 （默认为17）

   * sheet.cancelButtonTitleFont = [UIFont systemFontOfSize:20];  // 设置取消按钮文字大小 （默认为17）

   * 遵循SGActionSheetDelegate协议的delegate_SG方法
```Objective-C
 - (void)SGActionSheet:(SGActionSheet *)actionSheet didSelectRowAtIndexPath:(NSInteger)indexPath；
```

### * `自定义的UIAlertView`<br>

* SGAlertView使用(一句代码创建, 一句代码调用)：

  * 将项目中SGActionSheet文件夹拖入工程

  * 导入#import "SGAlertView.h"头文件

  * 对象方法创建
```Objective-C
- (instancetype)initWithTitle:(NSString *)title delegate:(id<SGAlertViewDelegate>)delegate contentTitle:(NSString *)contentTitle alertViewBottomViewType:(SGAlertViewBottomViewType)alertViewBottomViewType;
```

  * 类方法创建
```Objective-C
+ (instancetype)alertViewWithTitle:(NSString *)title delegate:(id<SGAlertViewDelegate>)delegate contentTitle:(NSString *)contentTitle alertViewBottomViewType:(SGAlertViewBottomViewType)alertViewBottomViewType;
```

* 对象调用show方法, 展示SGAlertView

 * 遵循SGAlertViewDelegate协议的delegate_SG方法

```Objective-C
- (void)didSelectedSureButtonClick;
```

* 提示信息文字，根据内容自动调节
```Objective-C
- (CGRect)boundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options attributes:(nullable NSDictionary *)attributes context:(nullable NSStringDrawingContext *)context;
```

### * `SGPickerView_DatePicker`<br>

* 将项目中SGPickerView_DatePicker文件夹拖入工程

* 导入#import "SGPickerView.h 和 SGDatePicker.h"头文件

* 通过 alloc init 方法创建

####   * 地区的选择
```Objective-C
    SGPickerView *pickerView = [[SGPickerView alloc] init];
    
    pickerView.pickerViewType = SGPickerViewTypeCenter; // 默认pickerViewType为SGPickerViewTypeBottom， 要想 pickerViewType 属性起到作用， 一定要在对象方法 show 之前设置
    
    [pickerView show];
    
    pickerView.locationMessage = ^(NSString *str){
    
        self.title = str;
    
    };
```

####   * 日期的选择
```Objective-C
    SGDatePicker *datePicker = [[SGDatePicker alloc] init];
    
    datePicker.datePickerType = SGPickerViewTypeCenter; // 默认datePickerType为SGPickerViewTypeBottom， 要想日期设置起到作用：一定设在 datePickerMode 属性之前设置

    datePicker.isBeforeTime = YES; 
    
    datePicker.datePickerMode = UIDatePickerModeDate; // 日期一定要设置
    
    __weak typeof(self) weakSelf = self;
    
    [datePicker didFinishSelectedDate:^(NSDate *selectedDate) {
    
        weakSelf.title = [self dateStringWithDate:selectedDate DateFormat:@"yyyy年MM月dd日"]; // 日期设置
        
        weakSelf.title = [self dateStringWithDate:selectedDate DateFormat:@"MM月dd日 HH:mm"]; // 时间设置

    }];
    
    [datePicker show];
```


## 版本介绍

* 2016. 10. 12 --> 第一次提交版本


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGActionSheet/issues) 或 kingsic@126.com 邮箱联系我
