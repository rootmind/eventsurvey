//
//  EventTemplateMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/11/16.
//
//

#import "EventTemplateMO+CoreDataProperties.h"

@implementation EventTemplateMO (CoreDataProperties)

+ (NSFetchRequest<EventTemplateMO *> *)fetchRequest {
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
@dynamic maxLength;
@dynamic pageNo;

@end
