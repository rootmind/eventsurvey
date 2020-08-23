//
//  NSData+AES.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 14/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef NSData_AES_h
#define NSData_AES_h

#endif /* NSData_AES_h */

#include <CommonCrypto/CommonCryptor.h>

@interface NSData(AES)
- (NSData*)AES128Decrypt;
- (NSData*)AES128Encrypt;
@end