//
//  NSString+AESCrypt.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 15/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef NSString_AESCrypt_h
#define NSString_AESCrypt_h


#endif /* NSString_AESCrypt_h */


#import "NSData+AESCrypt.h"

@interface NSString (AESCrypt)

- (NSString *)AES128EncryptWithKey:(NSString *)key;
- (NSString *)AES128DecryptWithKey:(NSString *)key;

@end