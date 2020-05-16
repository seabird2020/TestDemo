//
//  AppDelegate.m
//  CJGameCenterSDKDemo
//
//  Created by Apple on 15-2-5.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "CJSDKDataGA.h"
#import "ViewController.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    ViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"vic"];


    
    //适配iPhone X系列刘海儿
    CGRect winSize = [UIScreen mainScreen].bounds;
    if (winSize.size.height / winSize.size.width > 2)
    {
        winSize.size.height -= 150;
        winSize.origin.y = 75;
//        ::printf("-> is iphonex aaa hello world\n");
    }
    else
    {
//        ::printf("-> is not iphonex aaa hello world\n");
    }
    _window = [[UIWindow alloc] initWithFrame: winSize];
    
    [_window setRootViewController:detailVC];

    /**
     * 获取客户端token
     */
    [CJSDKDataGA upsOauthTokenCallBack:^(NSString *clientTOken) {
        if(clientTOken!= nil && ![clientTOken isKindOfClass:[NSNull class]])
        {
            /**
             * 设置游戏平台
             */
            
            [CJSDKDataGA gamePlatformId:@"chujian"];
            
            /**
             *  设置渠道ID
             */
            [CJSDKDataGA gameChannelId:@"566223"];
            
            
            /**
             *  设置渠道名称
             */
            [CJSDKDataGA gameChannelName:@"初见苹果"];
            
            
            /**
             * 设置区服ID
             */
            [CJSDKDataGA gameServerId:@"serverId"];
            /**
             *设置角色名称
             */
            [CJSDKDataGA setRoleName:@"roleName"];
            /**
             *设置角色ID
             */
            [CJSDKDataGA setRoleId:@"roleId"];
            
            /**
             * 获取配置项
             */
            [CJSDKDataGA upsSettingsCallBack:^(NSString *jgKay, NSString *jgMasterSecret) {
                /**
                 *获取极光key、极光MasterSecret
                 */
                
                NSLog(@"jgKay %@",jgKay);
                NSLog(@"jgMasterSecret %@",jgMasterSecret);
                //设置平台ID
                [CJSDKDataGA gamePlatformId:@"dev"];
 
                
                /**
                 *激活
                 */
                [CJSDKDataGA initActivatedEvent];
                
                
                /**
                 *登录
                 */
                [CJSDKDataGA onLogin:self isShowSuccessDlg:YES];
                
            }];
            
            
        }
        
    }];
    
    
    //补单机制-调用
    [CJSDKDataGA cjPayStart];
    
  
    
      return YES;
}


- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
   
        return UIInterfaceOrientationMaskLandscape;
        
        

}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString*)sourceApplication
         annotation:(id)annotation {
    
    

    return YES;
    
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    /**
     * 切换进入后台
     */
    [CJSDKDataGA gameBackgroundSwitchedEvent:@"label"];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    /**
     * 切换进入前台
     */
     [CJSDKDataGA gameForegroundSwitchedEvent:@"label"];

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{



}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
 
    [CJSDKDataGA onDestroy];
}
///**
// *  登录成功
// *
// *  @param userId       用户id
// *  @param userName     用户名
// *  @param sessionId    sessionId
// */
-(void)loginSuccess:(NSString *)userLoginAccessToken userId:(NSString *)userId {
    NSLog(@"登录成功: userLoginAccessToken:%@ userName:%@ ", userLoginAccessToken, userId);
}

/**
 *  登录失败
 *
 *  @param type      失败类型
 *  @param errorInfo 错误信息
 */
-(void)loginFail:(CJLoginFailedType)type errorInfo:(NSString *)errorInfo
{
    NSLog(@"登录失败:%@", errorInfo);
}
/**
 *  个人中心切换账号
 */
-(void)userSwitchAccount{

    
    /**
     * 个人中心点击切换账号退出个人中心页面（退出当前SDK界面）
     */

    [CJSDKDataGA onSwitchAccountDissView];
    
    
    /**
     * 切换账号显示登录主界面
     */
    [CJSDKDataGA onUpsSwitchAccount:self];

}


/**
 *  获取用户年龄段及用户类型
 *
 */
-(void)loginUserRealNameInfoWithUserType:(NSString *)userType userChannel:(NSString *)userChannel{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"用户年龄段：%@",userType] message:userChannel delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert show];
    });
    
    
    NSLog(@"userType:  %@ userChannel: %@",userType,userChannel);
    
}

@end
