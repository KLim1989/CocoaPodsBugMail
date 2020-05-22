/*
Copyright (c) New Cloud Technologies, Ltd., 2013-2017
*
* You can not use the contents of the file in any way without New Cloud Technologies, Ltd. written permission.
* To obtain such a permit, you should contact New Cloud Technologies, Ltd. at http://ncloudtech.com/contact.html
*/

#import "AppDelegate.h"

//@import MailFramework;
//#import "AppAuth.h"

#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>
@property (nonatomic) BOOL activatedFromBackground;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // migration coredata to app group
//    [NCTUtility setupCoreDataStack];
//
//    [[UIApplication sharedApplication] keyWindow].tintColor = [[gs o] mainThemeColor];
//
//    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
//
//
//    [NCTUtility mulidomainMigration];
//
//    self.activatedFromBackground = NO;
//
////    [Fabric with:@[CrashlyticsKit]];
//
//    [[UINavigationBar appearance] setTintColor:[[gs o] mainThemeColor]];
//    [[UIButton appearance] setTintColor:[[gs o] mainThemeColor]];
//
//    [NCTNotificationHandler registerForNotifications:application delegate:self];
//
//    // We clear cache for the first launch to use threads
//    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:kNCTAppGroupName];
//    if ([defaults boolForKey:@"threadsAlreadyExist7"] == NO) {
//        [NCTUtility clearCache];
//        [defaults setInteger:YES forKey:@"threadsAlreadyExist7"];
//        [defaults synchronize];
//    }
//
//    [NCTAnalytics startApplication:application withLaunchOptions:launchOptions];
//
//    [NCTUtility activateAllAccountsMigration];
//
//    //handle local notification
//    //note that if app was launched by pressing on notification (NOT ACTION) than we will have this notification,
//    //instead will be called application:.. handleActionWithIdentifier:... forLocalNotification:...
//    UILocalNotification* localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
//    if (localNotification) {
//        [self handleAppLaunchedByLocalNotification:localNotification];
//    }
//
//    //TODO: remove me after 1.2.34 version
////    [self createContactsList];
//
//    //the app was opened by other app, because this app have
//    //supported documents types (see document types in info.plist)
//    NSURL* fileURL = launchOptions[UIApplicationLaunchOptionsURLKey];
//    if (fileURL) {
//        [self appReceivedSupportedDocumentWithURL:fileURL];
//    }
//
//    // start timer for accounts sync
//    [NSTimer scheduledTimerWithTimeInterval:60.0
//                                     target:self
//                                   selector:@selector(syncAccounts)
//                                   userInfo:nil
//                                    repeats:YES];
//
//    [NCTMessageSender startSendingMessages];
//    [NCTNetworkMonitor startMonitoring];
//
//    [[NCTPersistentOperationManager sharedManager] removePushTokensIfNeeded];
//
//    [self migrateMyOfficeAccountsToSupportGalSearch];
//
    return YES;
}
//
//- (void)migrateMyOfficeAccountsToSupportGalSearch {
//    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:kNCTAppGroupName];
//    if ([defaults boolForKey:@"migrateMyOfficeAccountsToSupportGalSearch"] == NO) {
//        
//        //interate through all letters and add extract receivers' emails
//        NSArray *accounts = [[gs o] allAccounts];
//        [accounts enumerateObjectsUsingBlock:^(NCTEmailAccount *accounts, NSUInteger idx, BOOL *stop) {
//            if (accounts.isMyOfficeAccount) {
//                accounts.galEnabled = YES;
//            }
//        }];
//        
//        [defaults setInteger:YES forKey:@"сontactsListAlreadyExists1"];
//        [defaults synchronize];
//        [defaults setBool:YES forKey:@"migrateMyOfficeAccountsToSupportGalSearch"];
//    }
//}
//
//-(void)appReceivedSupportedDocumentWithURL:(NSURL*)url
//{
//    if ([[NSFileManager defaultManager] fileExistsAtPath:url.path] == NO) {
//        //wrong file path
//        return;
//    }
//    
//    //open composer add add this file as attachment
//    NCTEmailAccount* currentAccount = [[gs o] realActiveAccounts].firstObject;
//    if (currentAccount == nil) {
//        return;
//    }
//    
//    NCTMessage* newMessage = [NCTMessage MR_createEntity];
//    newMessage.header = [NCTMessageHeader MR_createEntity];
//    
//    newMessage.folder = [currentAccount draftFolder];
//    
//    if ([NCTUtility isValidAttachmentsSizeForURL:url account:currentAccount] == NO) {
//        [NCTUtility showAlertAttachIsTooBigForAccount:currentAccount inViewController:[NCTUtility currentViewController]];
//        return;
//    }
//    
//    NCTAttachment* attachment = [NCTAttachment attachmentFromDocumentAtURL:url];
//    
//    if ([[NSFileManager defaultManager] fileExistsAtPath:attachment.cachedFilePath]) {
//        //remove existing file
//        [[NSFileManager defaultManager] removeItemAtPath:attachment.cachedFilePath error:nil];
//    }
//    
//    NSError* copyError;
//    if (NO == [[NSFileManager defaultManager] moveItemAtPath:url.path toPath:attachment.cachedFilePath error:&copyError]) {
//        //can't copy file to cachedFilePath
//        return;
//    }
//    
//    
//    [newMessage addAttachmentsObject:attachment];
//    
//    //TODO: what if we already have opened composer now?
//    
//    [NCTUtility pushToComposerVCWithMessage:newMessage composerType:ComposerViewControllerTypeDraft afterDelay:0];
//}
//
//
//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
//{
//    //the app have to open url, because this app have
//    //supported documents types (see document types in info.plist)
//    
//    if (url) {
//        [self appReceivedSupportedDocumentWithURL:url];
//    }
//    
//    // Sends the URL to the current authorization flow (if any) which will process it if it relates to
//    // an authorization response.
//    if ([_currentAuthorizationFlow resumeAuthorizationFlowWithURL:url]) {
//        _currentAuthorizationFlow = nil;
//        return YES;
//    }
//    
//    return YES;
//}
//
//							
//- (void)applicationWillResignActive:(UIApplication *)application
//{
//	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application
//{
//	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
//	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    
//    //update app icon badge 
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[gs unseenMessagesInInboxForAllActiveAccounts]];
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application
//{
//	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//    self.activatedFromBackground = YES;
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application
//{
//    [NCTAnalytics appDidBecomeActive:application];
//	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    if (self.activatedFromBackground == YES) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kNCTUpdateMessagesNotification object:nil];
//    }
//    
//    
//    //update folders for all accounts and update app icon badge with unseen messages
//    [gs fetchFoldersForAllAccountsWithCompletionBlock:^{
//        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[gs unseenMessagesInInboxForAllActiveAccounts]];
//    }];
//    
//    UIViewController *topmostViweController = [NCTUtility currentViewController];
//    if ([topmostViweController isMemberOfClass:[NCTAccountSettingsTableVC class]]) {
//        [(NCTAccountSettingsTableVC*)topmostViweController toggleUIByNotificationSettingsForSelectedAccount];
//    }
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application
//{
//	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}
//
//#pragma mark - Background Fetching
//-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
//    
//    [NCTUtility backgroundFetchingWithCompletionBlock:^{
//        completionHandler(UIBackgroundFetchResultNewData);
//    }];
//}
//
//#pragma mark - LocalNotifications
//
//-(void)handleAppLaunchedByLocalNotification:(UILocalNotification*)localNotification
//{
//    //TODO: pass account email, because it's possible to have same messsage UID for different accounts
//    NSString* messageUID = localNotification.userInfo[@"messageUID"];
//    if (messageUID.length) {
//        NCTMessage* receivedMessage = [NCTMessage MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"SELF.uid == %@",messageUID]];
//        if (receivedMessage != nil && [localNotification.category isEqualToString:kNCTMessageReceivedNotificationCategoryIdentifier]) {
//            [NCTUtility pushToMessageDetailVCWithMessage:receivedMessage afterDelay:3.0];
//        }
//        else if (receivedMessage != nil && [localNotification.category isEqualToString:kNCTSendMessageNotificationCategoryIdentifier]){
//            [NCTUtility pushToComposerVCWithMessage:receivedMessage composerType:ComposerViewControllerTypeReplyAll afterDelay:1.3];
//        }
//    }
//}
//
//-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
//{
//    NSString* messageUID = notification.userInfo[@"messageUID"];
//    if (messageUID.length) {
//        NCTMessage* receivedMessage = [NCTMessage MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"SELF.uid == %@",messageUID]];
//        if ([identifier isEqualToString:kNCTReadReceivedMessageNotificationActionIdentifier]) {
//            // set this message as read
//            NCTEmailAccount* messageAccount = receivedMessage.folder.account;
//            [messageAccount.sessionManager setFlag:NCTMessageFlagSeen forMessages:@[receivedMessage] completionBlock:nil];
//        }
//        else if ([identifier isEqualToString:kNCTReplyReceivedMessageNotificatinActionIdentifier]){
//            // show message in composer
//            [NCTUtility pushToComposerVCWithMessage:receivedMessage composerType:ComposerViewControllerTypeReplyAll afterDelay:0];
//        }else if ([identifier isEqualToString:kNCTSendMessageNotificationCategoryIdentifier]){
//            //send again message
//            NCTEmailAccount* account = receivedMessage.folder.account;
//            [account.sessionManager sendMessage:receivedMessage withCompletionBlock:^(NSError *error) {
//                if (error) {
//                    //show local notification again
//                    [NCTNotificationHandler scheduleFailedSendMessageLocalNotificationWithMessage:receivedMessage after:0.1];
//                }
//            }];
//        }
//    }
//    completionHandler();
//}
//
////this method is called when the app is launched (either normally or due to a local notification’s action)
//-(void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification
//{
//    NSString* messageUID = notification.userInfo[@"messageUID"];
//    if (messageUID.length) {
//        NCTMessage* receivedMessage = [NCTMessage MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"SELF.uid == %@",messageUID]];
//        switch (application.applicationState) {
//            case UIApplicationStateInactive:
//                //app was opened by local notification
//                //pass received message to MessageDetailVC
//                [NCTUtility pushToMessageDetailVCWithMessage:receivedMessage afterDelay:0.3];
//                break;
//            case UIApplicationStateActive:
//                //TODO: show alert that we have received new message ?
//                break;
//            case UIApplicationStateBackground:
//                //do nothing
//                break;
//        }
//    }
//}
//
///*
// push payload example
// 
// {
// "aps" :     {
//    "alert" : "Sender\nSubject text\nmessage plain text string",
//    "category" : "messageReceivedCategory",
//    "content-available" : "1",
//    "sound" : "default"
// },
// "email" : "t0rn@inbox.ru",
// "folderPath" : "INBOX",
// "messageUID" : "31713"
// }
// 
// "alert" - строка текста уведомления которая содержит email отправителя нового сообщения (Sender). Далее с новой строки (c помощью "\n") тема письма (Subject). Далее с новой строки (c помощью "\n") plain text строка тело imap письма (без html). Обязательно.
// "category" - "messageReceivedCategory" - Категория пуш уведомления. Обязательно. Пока возможно только одно значение: messageReceivedCategory
// "content-available": "1" - Параметер указывающий на необходимость выполнения кода для загруки письма с imap сервера в фоновом режиме на клиенте. Обязательно. Обязательное значение "1"
// "email" - email аккаунта для которого пришло новое письмо. Обязательно
// "folderPath" - строка путь папки в которой пришло новое сообщение. Обязательно
// "messageUID" - uid imap письма. Обязательно
// "sound" - параметр указывающий на необходимость воспроизведения звукового уведомления. Необязательно, но если указывается то обязательное значение "default"
// */
//
//#pragma mark - Push notifications
//
//-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
//{
//   
//}
//
//-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
//{
//    const unsigned *tokenBytes = [deviceToken bytes];
//    NSString *hexToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
//                          ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
//                          ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
//                          ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
//    
//    _devicePushToken = hexToken;
//    
//    for (NCTEmailAccount* account in [[gs o] allActiveAccounts]) {
//        if (account.isMyOfficeAccount && account.notificationsEnabled) {
//            //update push token
//            [[NCTFSAPI sharedAPI] addPushDeviceToken:hexToken forAccount:account completion:^(NSError *error) {
//                NSLog(@"updaten device push token for account %@ with error %@",account.email,error.localizedDescription);
//            }];
//        }
//    }
//}
//
//
//
////- (void)handleAppLaunchedByPush:(NSDictionary*)payload
////{
////    //ios10 calls ... handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:...
////    //when active and launched by push
////    NSString* messageUID = payload[@"messageUID"];
////    NSString* email = payload[@"email"];
////    NCTEmailAccount* account = [[gs o] accountWithEmail:email];
////    if (messageUID.length && account != nil) {
////        NCTMessage* receivedMessage = [NCTMessage MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"SELF.uid == %@ AND SELF.folder.accountName == %@",messageUID,account.email]];
////    //    [NCTUtility pushToMessageDetailVCWithMessage:receivedMessage afterDelay:1.3];
////    }
////}
//
//
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
//{
//    NSString* category = userInfo[@"aps"][@"category"];
//    NSString* email = userInfo[@"email"];
//    NSString* messageUID = userInfo[@"messageUID"];
//    NSString* folderPath = userInfo[@"folderPath"];
//    
//    if (email.length > 0 && messageUID.length > 0) {
//        NCTEmailAccount* account = [[gs o] accountWithEmail:email];
//        
//        //check for existing folder path in account folders
//        NSArray * paths = [account.accountFolders valueForKey:@"path"];
//        NSUInteger folderPathIndex = [paths indexOfObject:folderPath];
//        if (folderPathIndex == NSNotFound) {
//            completionHandler(UIBackgroundFetchResultFailed);
//            return;
//        }
//        
//        NCTFolder* folder = [account.accountFolders objectAtIndex:folderPathIndex];
//        
//        // create message from uid and push to detail view controller if necessary
//        if (account != NULL && folder != NULL) {
//            NSManagedObjectContext* context = [NSManagedObjectContext MR_defaultContext];
//            [NCTMessage findOrDownloadMessageWithUID:messageUID account:account folder:folder inContext:context completionBlock:^(NCTMessage *newMessage) {
//                if (newMessage == nil) {
//                    completionHandler(UIBackgroundFetchResultNoData);
//                    return;
//                }
//                
//                //update app icon badge
//                // count all inbox unread messages
//                [gs fetchFoldersForAllAccountsWithCompletionBlock:^{
//                    //count unread messages for all accounts inbox folder
//                    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[gs unseenMessagesInInboxForAllActiveAccounts]];
//                    completionHandler(UIBackgroundFetchResultNewData);
//                }];
//                
//                //calls when the app was open by push notification
//                if (application.applicationState == UIApplicationStateInactive) {
//                    [NCTUtility pushToMessageDetailVCWithMessage:newMessage afterDelay:1.0];
//                }
//            }];
//        }
//    }
//    else{
//        completionHandler(UIBackgroundFetchResultNoData);
//    }
//}
//
//-(void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(nonnull NSDictionary *)userInfo completionHandler:(nonnull void (^)())completionHandler
//{
//    NSLog(@"handleActionWithIdentifier %@",identifier);
//    
//    NSString* messageUID = userInfo[@"messageUID"];
//    NSString* email = userInfo[@"email"];
//    NSString* folderPath = userInfo[@"folderPath"];
//    NCTEmailAccount* account = [[gs o] accountWithEmail:email];
//    
//    //check for existing folder path in account folders
//    NSArray * paths = [account.accountFolders valueForKey:@"path"];
//    NSUInteger folderPathIndex = [paths indexOfObject:folderPath];
//    if (folderPathIndex == NSNotFound) {
//        completionHandler();
//        return;
//    }
//    
//    NCTFolder* folder = [account.accountFolders objectAtIndex:folderPathIndex];
//    
//    if (messageUID.length) {
//        // create message from uid and push to detail view controller if necessary
//        if (account != NULL && folder != NULL) {
//            NSManagedObjectContext* context = [NSManagedObjectContext MR_defaultContext];
//            [NCTMessage findOrDownloadMessageWithUID:messageUID account:account folder:folder inContext:context completionBlock:^(NCTMessage *newMessage) {
//                if (newMessage == nil) {
//                    completionHandler();
//                    return;
//                }
//                
//                if ([identifier isEqualToString:kNCTReadReceivedMessageNotificationActionIdentifier]) {
//                    // set this message as read
//                    NCTEmailAccount* messageAccount = newMessage.folder.account;
//                    [messageAccount.sessionManager setFlag:NCTMessageFlagSeen forMessages:@[newMessage] completionBlock:nil];
//                }
//                else if ([identifier isEqualToString:kNCTReplyReceivedMessageNotificatinActionIdentifier]){
//                    // show message in composer
//                    [NCTUtility pushToComposerVCWithMessage:newMessage composerType:ComposerViewControllerTypeReplyAll afterDelay:1.3];
//                }
//                else if ([identifier isEqualToString:UNNotificationDefaultActionIdentifier]){
//                    NSTimeInterval delay = 0.6;
//                    if (application.applicationState == UIApplicationStateInactive) {
//                        delay = 1.3;
//                    }
//                    [NCTUtility pushToMessageDetailVCWithMessage:newMessage afterDelay:delay];
//                }
//                
//                completionHandler();
//            }];
//        }
//    }
//    else{
//        completionHandler();
//    }
//}
//
//
//#pragma mark - syncAccounts
//
//- (void)syncAccounts {
//    [NCTSynchronizationController syncAccounts];
//}
//
//
//#pragma mark - UNUserNotificationCenterDelegate
//
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
//{
//    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionSound);
//}
//
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
//{
//    NSDictionary* userInfo = response.notification.request.content.userInfo;
//    
//    [self application:[UIApplication sharedApplication] handleActionWithIdentifier:response.actionIdentifier forRemoteNotification:userInfo completionHandler:^{
//        completionHandler();
//    }];
//}

@end
