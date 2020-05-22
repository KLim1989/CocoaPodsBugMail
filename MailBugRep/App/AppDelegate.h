/*
Copyright (c) New Cloud Technologies, Ltd., 2013-2017
*
* You can not use the contents of the file in any way without New Cloud Technologies, Ltd. written permission.
* To obtain such a permit, you should contact New Cloud Technologies, Ltd. at http://ncloudtech.com/contact.html
*/

#import <UIKit/UIKit.h>

@protocol OIDAuthorizationFlowSession;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readonly) NSString* devicePushToken;
@property(nonatomic, strong, nullable) id<OIDAuthorizationFlowSession> currentAuthorizationFlow;
@end
