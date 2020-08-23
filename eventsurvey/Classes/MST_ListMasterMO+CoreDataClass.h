//
//  MST_ListMasterMO+CoreDataClass.h
//  
//
//  Created by Rootmind TechSoft Private Limited on 22/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface MST_ListMasterMO : NSManagedObject

+ (NSFetchRequest<MST_ListMasterMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *tableName;
@property (nullable, nonatomic, copy) NSString *sync;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *code;


@end

NS_ASSUME_NONNULL_END

#import "MST_ListMasterMO+CoreDataProperties.h"
