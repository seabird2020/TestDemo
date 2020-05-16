//
//  ViewController.h
//  CJGameCenterSDKDemo
//
//  Created by Apple on 15-2-5.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJSDKDataGA.h"
@interface ViewController : UIViewController<CJLoginDelegate,CJIAPDelegate>

//---------------------------------SDK接口列表

/**
 *  登录
 *
 *  @param sender 按钮控件
 */
- (IBAction)onLogin:(id)sender;

/**
 *  切换账号
 */

- (IBAction)onAccountPress:(id)sender;

/**
 *  个人中心
 */

- (IBAction)onUserCenterPress:(id)sender;

/**
 *  支付
 */

- (IBAction)onIAPPress:(id)sender;



//---------------------------------MTA接口列表

//---------------------------------配置接口列表

/**
 * 设置游戏平台
 */
- (IBAction)cjGamePlatformIdPress:(id)sender;


/**
 * 设置区服ID
 */

- (IBAction)cjGameServerIdPress:(id)sender;



/**
 *设置角色名称
 */

- (IBAction)cjRoleNamePress:(id)sender;

/**
 *设置角色ID
 */

- (IBAction)cjRoleIdPress:(id)sender;



//---------------------------------埋点接口列表

/**
 *  自定义事件
 */
- (IBAction)customized:(id)sender;

/**
 *  启动闪屏请求
 */
- (IBAction)splashStartRequestedEvent:(id)sender;


/**
 *  访问资源服务器请求
 */
- (IBAction)resourceServerVisit:(id)sender;

/**
 *  版本检查请求
 */
- (IBAction)appVersionCheck:(id)sender;

/**
 *  加载资源请求
 */
- (IBAction)resourceLoading:(id)sender;

/**
 * 更新资源包请求
 */
- (IBAction)resourceUpdateStart:(id)sender;

/**
 * 更新资源包结果
 */
- (IBAction)resourceUpdate:(id)sender;


/**
 * 区服加载结果
 */
- (IBAction)gameServerListed:(id)sender;

/**
 * 区服登录结果
 */
- (IBAction)gameServerLoggedin:(id)sender;

/**
 * 游戏创角结果
 */
- (IBAction)roleCrsated:(id)sender;

/**
 * 角色登录请求
 */
- (IBAction)roleLoginRequested:(id)sender;

/**
 * 角色登录请求结果
 */
- (IBAction)roleLoggedin:(id)sender;

/**
 * 角色登出
 */
- (IBAction)roleLogout:(id)sender;

/**
 * 切换进入前端
 */

- (IBAction)gameForegroundPress:(id)sender;

/**
 * 切换进入后台
 */
- (IBAction)gameBackgroundPress:(id)sender;


@end
