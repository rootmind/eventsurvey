//
//  DocChecklistData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 10/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DocChecklistData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *seqNo;
@property (readonly) NSString *accountType;
@property (readonly) NSString *docID;
@property (readonly) NSString *docName;
@property (readonly) NSString *mandatory;
@property (readonly) NSString *uploaded;

@property (readonly) NSString *recordFound;



@end