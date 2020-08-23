//
//  NSData+AESCrypt.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 15/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef NSData_AESCrypt_h
#define NSData_AESCrypt_h


#endif /* NSData_AESCrypt_h */


#import <Foundation/Foundation.h>

@interface NSData (AESCrypt)

- (NSData *)AES128EncryptWithKey:(NSString *)key;
- (NSData *)AES128DecryptWithKey:(NSString *)key;

+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (id)initWithBase64EncodedString:(NSString *)string;

- (NSString *)base64Encoding;
- (NSString *)base64EncodingWithLineLength:(NSUInteger)lineLength;

- (BOOL)hasPrefixBytes:(const void *)prefix length:(NSUInteger)length;
- (BOOL)hasSuffixBytes:(const void *)suffix length:(NSUInteger)length;
@end