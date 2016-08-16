//
//  TabBarViewController.m
//  CH_CopyWeChat
//
//  Created by 耗子 on 16/7/1.
//  Copyright © 2016年 DogCat. All rights reserved.
//

#import "TabBarViewController.h"
#import "CH_WeChatViewController.h"
#import "CH_AddressBookViewController.h"
#import "CH_DiscoverViewController.h"
#import "CH_MineViewController.h"

@interface TabBarViewController ()

//设置试图属性
@property(nonatomic,strong)CH_WeChatViewController *weChatVC;
@property(nonatomic,strong)CH_AddressBookViewController *addressBookVC;
@property(nonatomic,strong)CH_DiscoverViewController *disVC;
@property(nonatomic,strong)CH_MineViewController *mineVC;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:self.weChatVC];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:self.addressBookVC];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:self.disVC];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:self.mineVC];
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    // Do any additional setup after loading the view.
}


#pragma mark - setter getter方法
/**
 *消息
 */
-(CH_WeChatViewController *)weChatVC{
    if (_weChatVC == nil) {
        _weChatVC = [[CH_WeChatViewController alloc]init];
        [_weChatVC.tabBarItem setTitle:@"微信"];
        [_weChatVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_weChatVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _weChatVC;
}

/**
 *通讯录
 */
- (CH_AddressBookViewController *)addressBookVC
{
    if (_addressBookVC == nil) {
        _addressBookVC = [[CH_AddressBookViewController alloc] init];
        [_addressBookVC.tabBarItem setTitle:@"通讯录"];
        [_addressBookVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_addressBookVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _addressBookVC;
}


/**
 *发现
 */

- (CH_DiscoverViewController *) disVC
{
    if (_disVC == nil) {
        _disVC = [[CH_DiscoverViewController alloc] init];
        [_disVC.tabBarItem setTitle:@"发现"];
        [_disVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_disVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _disVC;
}

/**
 *  我
 */
- (CH_MineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[CH_MineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
