//
//  ViewController.m
//  SGPopupViewExample
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "SGActionSheet.h"
#import "SGAlertView.h"
#import "SGPickerView.h"
#import "SGDatePicker.h"

@interface ViewController () <SGActionSheetDelegate, SGAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *title_arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title_arr = @[@"Default - ActionSheet", @"Default - ActionSheet - Message", @"Default - ActionSheet - Scroll", @"Default - ActionSheet - Message - Scroll", @"Default - AlertView", @"Default - AlertView - Two", @"PickerView_bottom", @"PickerView_center", @"DatePicker_bottom", @"DatePicker_center"];
    
    // 注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.title_arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = self.title_arr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        SGActionSheet *sheet = [[SGActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitleArray:@[@"相册", @"拍照"]];
        sheet.cancelButtonTitleColor = [UIColor redColor];
        [sheet show];
    } else if (indexPath.row == 1) {
        SGActionSheet *sheet = [SGActionSheet actionSheetWithTitle:@"信息提示文字, 可以自适应高度" delegate:self cancelButtonTitle:@"取消" otherButtonTitleArray:@[@"相册", @"拍照"]];
        [sheet show];
    } else if (indexPath.row == 2) {
        SGActionSheet *sheet = [[SGActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitleArray:@[@"相册", @"拍照", @"照片", @"选取"]];
        sheet.cancelButtonTitleColor = [UIColor redColor];
        [sheet show];
    } else if (indexPath.row == 3) {
        SGActionSheet *sheet = [SGActionSheet actionSheetWithTitle:@"This is custom UIActionSheet, information prompt text and adaptive height" delegate:self cancelButtonTitle:@"取消" otherButtonTitleArray:@[@"相册", @"拍照", @"照片", @"选取"]];
        sheet.messageTextFont = [UIFont systemFontOfSize:20];
        sheet.messageTextColor = [UIColor redColor];
        sheet.otherTitleFont = [UIFont systemFontOfSize:20];
        sheet.cancelButtonTitleFont = [UIFont systemFontOfSize:20];
        [sheet show];
    } else if (indexPath.row == 4) {
        SGAlertView *alert = [[SGAlertView alloc] initWithTitle:@"温馨提示 ! !" delegate:nil contentTitle:@"代码不断更新、优化中, 请移步GitHub下载最新Demo" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
        [alert show];
    } else if (indexPath.row == 5) {
        SGAlertView *alert = [[SGAlertView alloc] initWithTitle:@"确定退出 ?" delegate:self contentTitle:@"退出登录后将无法查看订单, 重新登录后即可查看" alertViewBottomViewType:(SGAlertViewBottomViewTypeTwo)];
        [alert show];
    } else if (indexPath.row == 6) {
        SGPickerView *pickerView = [[SGPickerView alloc] init];
        [pickerView show];
        pickerView.locationMessage = ^(NSString *str){
            self.title = str;
        };
    } else if (indexPath.row == 7) {
        SGPickerView *pickerView = [[SGPickerView alloc] init];
        pickerView.pickerViewType = SGPickerViewTypeCenter;
        
        [pickerView show];
        pickerView.locationMessage = ^(NSString *str){
            self.title = str;
        };
    } else if (indexPath.row == 8) {
        // 日期
        SGDatePicker *datePicker = [[SGDatePicker alloc] init];
        datePicker.isBeforeTime = YES; // 日期一定要设置
        datePicker.datePickerMode = UIDatePickerModeDate; // 日期一定要设置
        __weak typeof(self) weakSelf = self;
        [datePicker didFinishSelectedDate:^(NSDate *selectedDate) {
            weakSelf.title = [self dateStringWithDate:selectedDate DateFormat:@"yyyy年MM月dd日"];
        }];
        [datePicker show];
    } else {
        // 时间
        SGDatePicker *datePicker = [[SGDatePicker alloc] init];
        datePicker.datePickerType = SGDatePickerTypeCenter;
        __weak typeof(self) weakSelf = self;
        [datePicker didFinishSelectedDate:^(NSDate *selectedDate) {
            weakSelf.title = [self dateStringWithDate:selectedDate DateFormat:@"MM月dd日 HH:mm"];
        }];
        [datePicker show];
    }
}

- (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    return str ? str : @"";
}


#pragma mark - - - SGActionSheetDelegate, SGAlertViewDelegate
- (void)SGActionSheet:(SGActionSheet *)actionSheet didSelectRowAtIndexPath:(NSInteger)indexPath {
    NSLog(@"%ld", indexPath);
}

- (void)didSelectedSureButtonClick {
    NSLog(@"您点击的是确定按钮");
}


@end

