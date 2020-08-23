//
//  OccupationData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OccupationData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;

@property (readonly) NSString *occupationType;
@property (readonly) NSString *occupation;
@property (readonly) NSString *designation;
@property (readonly) NSString *nameOfOrg;
@property (readonly) NSString *doj;
@property (readonly) NSString *monthlySalary;
@property (readonly) NSString *employeeNo;


@property (readonly) NSString *recordStatus;
@property (readonly) NSString *recordFound;

@property (readonly) NSString *occupationTypeValue;
@property (readonly) NSString *occupationValue;


@end