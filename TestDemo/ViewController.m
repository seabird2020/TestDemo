//
//  ViewController.m
//  TestSDK
//
//  Created by Apple on 15-1-19.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

   
    
    
}



/**
 *  SDK 按钮切换账号（非个人中心）
 */

- (IBAction)onAccountPress:(id)sender {
    
    [CJSDKDataGA mainSwitchAccount];
    
}


/**
 * 个人中心
 */

- (IBAction)onUserCenterPress:(id)sender {
    
    [CJSDKDataGA loadUserCenterWithCjAccessToken];
}


/**
 *  支付
 */

- (IBAction)onIAPPress:(id)sender {
    
    /**
     * 发起充值申请前进行用户实名状态处理
     */
    [CJSDKDataGA getBeforeAuthWithCallback:^(int volide) {
        
        /**
         *  支付-店铺中心
         *
         *
         */
        [CJSDKDataGA loadPayShopVariants:self callBack:^(NSDictionary *shopDict) {
            
            
            NSLog(@"店铺商品x：%@",shopDict);
            if(shopDict!= nil && ![shopDict isKindOfClass:[NSNull class]] && shopDict.count != 0)
            {
                
                /**
                 *  shopDict 商铺中心请求字典数据
                 
                 包含 shoppe_id 商铺ID
                 
                 items数组 :tips:该数组为游戏苹果后台所传的的内购商品配置项。
                 
                 items[].variant_id         商品id
                 items[].product_id         产品ID
                 items[].price              商品价格
                 items[].quantity           商品数量
                 items[].currency           货币类型
                 items[].product_name       产品名称
                 items[].product_image      产品图像
                 items[].description        产品描述
                 items[].is_onsale          产品是否下架
                 items[].type               产品类型
                 *
                 *  @param
                 */
                
                
                
                
                
                /**
                 *传入用户等级
                 **/
                [CJSDKDataGA payRequestLevel:@"100"];
                
                
                /**
                 
                *   充值消费申请（请求初见订单ID）
                
                
                DeveloperPayload  透传参数（CP使用）
                
                
                ServerId     游戏服务器ID
                ServerName      游戏服务器名称
                RegionId     游戏服务器区服ID
                RegionName             游戏服务器区服名称
                RoleId       游戏角色ID
                RoleName             游戏角色名称
                
                
                **/
                //发起充值申请
                [CJSDKDataGA loadPayCheckoutDeveloperPayload:@"DeveloperPayload" andServerId:@"ServerId" andServerName:@"ServerName" andRegionId:@"RegionId" andRegionName:@"RegionName" andRoleId:@"RoleId" andRoleName:@"RoleName" andVariantId:@"varwsap115"];
            }
            
            else{
                
                NSLog(@"获取商品列表失败");
            }
        }];
        
    }];
    
}




/**
 *  支付成功
 */

-(void)paySuccessCallBack{
    
    NSLog(@"支付成功");
}

/**
 *  支付失败
 */
-(void)payFailCallBack:(NSString *)errorStr{
    
    NSLog(@"支付失败:%@", errorStr);
}



//---------------------------------MTA接口列表

//---------------------------------配置接口列表


//---------------------------------MTA-埋点接口列表

/**
 *  自定义事件
 */
- (IBAction)customized:(id)sender {
    
    [CJSDKDataGA customizedEvent:@"LABEL" andCategory:@"afterInit" andCustomArray:@[@{@"k":@"奖励",@"v":@"100元包"},@{@"k":@"等级",@"v":@"120"}]];

}

/**
 *  启动闪屏请求
 */
- (IBAction)splashStartRequestedEvent:(id)sender {
    
    
    [CJSDKDataGA splashStartRequestedEvent:@"label" andStatus:@"succ"];
}


/**
 *  访问资源服务器请求
 */
- (IBAction)resourceServerVisit:(id)sender {
    
    [CJSDKDataGA resourceServerVisitRequestedEvent:@"label" andIp:@"ip" andResourceId:@"resourceId"];
}


/**
 * 版本检查请求
 */
- (IBAction)appVersionCheck:(id)sender {
    
    [CJSDKDataGA appVersionCheckRequestedEvent:@"label" andAppVer:@"appVer"];
}


/**
 *  加载资源请求
 */
- (IBAction)resourceLoading:(id)sender {
    
    [CJSDKDataGA resourceLoadingRequestedEvent:@"label" andResourceId:@"resourceId"];
}


/**
 * 更新资源包请求
 */
- (IBAction)resourceUpdateStart:(id)sender {
    
    [CJSDKDataGA resourceUpdateStartedEvent:@"label" andResourceId:@"resourceId"];
}


/**
 * 更新资源包结果
 */
- (IBAction)resourceUpdate:(id)sender {
    
    [CJSDKDataGA resourceUpdatedEvent:@"label" andResourceId:@"resourceId" andStatus:@"succ"];
}




/**
 * 区服加载结果
 */
- (IBAction)gameServerListed:(id)sender {
    
    [CJSDKDataGA gameServerListedEvent:@"label" andStatus:@"succ"];
}


/**
 * 区服登录结果
 */
- (IBAction)gameServerLoggedin:(id)sender {
    
    [CJSDKDataGA gameServerLoggedinEvent:@"label" andStatus:@"succ"];
}


/**
 * 游戏创角结果
 */
- (IBAction)roleCrsated:(id)sender {
    
    [CJSDKDataGA roleCreatedEvent:@"label" andStatus:@"succ"];
}


/**
 * 角色登录请求
 */
- (IBAction)roleLoginRequested:(id)sender {
    [CJSDKDataGA roleLoginRequestedEvent:@"label"];
    
}


/**
 * 角色登录请求结果
 */
- (IBAction)roleLoggedin:(id)sender {
    
    [CJSDKDataGA roleLoggedinEvent:@"label" andStatus:@"succ"];
}


/**
 * 角色登出
 */
- (IBAction)roleLogout:(id)sender {
    
    [CJSDKDataGA roleLogoutEvent:@"label" andStatus:@"succ"];
}




/**
 * 切换进入前端
 */

- (IBAction)gameForegroundPress:(id)sender {
    
       [CJSDKDataGA gameForegroundSwitchedEvent:@"label"];
}


/**
 * 切换进入后台
 */
- (IBAction)gameBackgroundPress:(id)sender {
    
     [CJSDKDataGA gameBackgroundSwitchedEvent:@"label"];
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

/**
 * 设置游戏平台
 */




- (IBAction)cjGamePlatformIdPress:(id)sender {
    
    [CJSDKDataGA gamePlatformId:@"chujian"];
    
    NSLog(@"设置游戏q平台");
}

/**
 * 设置区服ID
 */

- (IBAction)cjGameServerIdPress:(id)sender {
    
    
    [CJSDKDataGA gameServerId:@"serverId"];
    
    NSLog(@"设置区服ID");
    
}

/**
 *设置角色名称
 */
- (IBAction)cjRoleNamePress:(id)sender {
    
    [CJSDKDataGA setRoleName:@"roleName"];
    
    NSLog(@"设置角色名称");
    
}

/**
 *设置角色ID
 */
- (IBAction)cjRoleIdPress:(id)sender {
    
    [CJSDKDataGA setRoleId:@"roleId"];
    
    NSLog(@"设置角色ID");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
