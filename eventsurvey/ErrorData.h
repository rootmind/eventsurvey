//
//  ErrorData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 20/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef ErrorData_h
#define ErrorData_h


#endif /* ErrorData_h */


#import <UIKit/UIKit.h>

@interface ErrorData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *errorCode;
@property (readonly) NSString *errorDesc;



@end