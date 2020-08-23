//
//  MST_EventTemplate+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_EventTemplate+CoreDataProperties.h"

@implementation MST_EventTemplate (CoreDataProperties)

+ (NSFetchRequest<MST_EventTemplate *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_EventTemplate"];
}

@dynamic component;
@dynamic eventID;
@dynamic eventRefNo;
@dynamic fieldName;
@dynamic labelName;
@dynamic listTableName;
@dynamic makerDateTime;
@dynamic makerID;
@dynamic mandatory;
@dynamic modifierDateTime;
@dynamic modifierID;
@dynamic seqNo;
@dynamic status;
@dynamic viewOrder;

@end
