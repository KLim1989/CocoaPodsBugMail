//
//  MailCoreSearchTests.m
//  Mail
//
//  Created by Alexey Ivanov on 14.04.17.
//  Copyright © 2017 ru.ncloudtech. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MailFramework/MailFramework.h>
#import <MailCore/MailCore.h>

@interface MailCoreSearchTests : XCTestCase

@end

@implementation MailCoreSearchTests


- (void)testSimpleIMAPSearch {
    
    NCTEmailAccount* testAccount = [[NCTEmailAccount alloc] initWithEmail:@"testncloud@yandex.ru"
                                                             IMAPPassword:@"Serg12345"
                                                             SMTPPassword:@"Serg12345"
                                                                 IMAPhost:nil
                                                                 SMTPhost:nil];
    [self measureBlock:^{
        [testAccount.sessionManager getImapSessionWithCompletionBlock:^(NSError *error, MCOIMAPSession *session) {
            XCTAssertNil(error);
            MCOIMAPSearchKind searchKind = MCOIMAPSearchKindSubject|MCOIMAPSearchKindBody|MCOIMAPSearchKindCc|MCOIMAPSearchKindRecipient|MCOIMAPSearchKindFrom| MCOIMAPSearchKindTo | MCOIMAPSearchKindBcc | MCOIMAPSearchKindBcc;
            MCOIMAPSearchOperation* searchOperation = [session searchOperationWithFolder:@"INBOX"
                                                                                    kind:searchKind
                                                                            searchString:@"Apple"];
            [searchOperation start:^(NSError * _Nullable error, MCOIndexSet * _Nullable searchResult) {
                XCTAssertNil(error);
                NSLog(@"testSimpleIMAPSearch count %d",searchResult.count);
                NSLog(@"testSimpleIMAPSearch %@",searchResult);
            }];
        }];
    }];
}

-(void)testIMAPSearchExpressionTest
{
    NCTEmailAccount* testAccount = [[NCTEmailAccount alloc] initWithEmail:@"testncloud@yandex.ru"
                                                             IMAPPassword:@"Serg12345"
                                                             SMTPPassword:@"Serg12345"
                                                                 IMAPhost:nil
                                                                 SMTPhost:nil];

    [self measureBlock:^{
        [testAccount.sessionManager getImapSessionWithCompletionBlock:^(NSError *error, MCOIMAPSession *session) {
            XCTAssertNil(error);

            NSString* searchTerm = @"Apple";
//            MCOIMAPSearchExpression* searchExpr = [MCOIMAPSearchExpression searchSubject:searchTerm];
            MCOIMAPSearchExpression* bodyExpr = [MCOIMAPSearchExpression searchBody:searchTerm];
            MCOIMAPSearchExpression* fromExpr = [MCOIMAPSearchExpression searchFrom:searchTerm];
            MCOIMAPSearchExpression* toExpr = [MCOIMAPSearchExpression searchTo:searchTerm];
            MCOIMAPSearchExpression* ccExpr = [MCOIMAPSearchExpression searchCc:searchTerm];
            MCOIMAPSearchExpression* bccExpr = [MCOIMAPSearchExpression searchBcc:searchTerm];
            MCOIMAPSearchExpression* subjectExpr = [MCOIMAPSearchExpression searchSubject:searchTerm];
            MCOIMAPSearchExpression* orExpr1 = [MCOIMAPSearchExpression searchOr:bodyExpr other:fromExpr];
            MCOIMAPSearchExpression* orExpr2 = [MCOIMAPSearchExpression searchOr:ccExpr other:bccExpr];
            MCOIMAPSearchExpression* orExpr3 = [MCOIMAPSearchExpression searchOr:subjectExpr other:toExpr];
            
            MCOIMAPSearchExpression* orExpr4 = [MCOIMAPSearchExpression searchOr:orExpr1 other:orExpr2];
            MCOIMAPSearchExpression* orExpr5 = [MCOIMAPSearchExpression searchOr:orExpr3 other:orExpr4];
            
            MCOIMAPSearchOperation* searchOperation = [session searchExpressionOperationWithFolder:@"INBOX"
                                                                                        expression:orExpr5];
            [searchOperation start:^(NSError * _Nullable error, MCOIndexSet * _Nullable searchResult) {
                XCTAssert(error == nil);
                NSLog(@"testIMAPSearchExpressionTest count %d",searchResult.count);
                NSLog(@"testIMAPSearchExpressionTest %@",searchResult);
            }];
        }];
    }];
}

@end
