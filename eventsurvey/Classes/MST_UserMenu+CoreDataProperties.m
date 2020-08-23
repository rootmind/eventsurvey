//
//  MST_UserMenu+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_UserMenu+CoreDataProperties.h"

@implementation MST_UserMenu (CoreDataProperties)

+ (NSFetchRequest<MST_UserMenu *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_UserMenu"];
}

@dynamic assignFlag;
@dynamic desc;
@dynamic menuID;
@dynamic menuIDValue;
@dynamic userid;

@end
