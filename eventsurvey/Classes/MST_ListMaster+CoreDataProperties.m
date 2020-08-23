//
//  MST_ListMaster+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_ListMaster+CoreDataProperties.h"

@implementation MST_ListMaster (CoreDataProperties)

+ (NSFetchRequest<MST_ListMaster *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_ListMaster"];
}

@dynamic code;
@dynamic desc;
@dynamic sync;
@dynamic tableName;

@end
