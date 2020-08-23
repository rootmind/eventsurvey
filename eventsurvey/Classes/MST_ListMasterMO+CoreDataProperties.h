//
//  MST_ListMasterMO+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_ListMasterMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MST_ListMasterMO (CoreDataProperties)

+ (NSFetchRequest<MST_ListMasterMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *sync;
@property (nullable, nonatomic, copy) NSString *tableName;

@end

NS_ASSUME_NONNULL_END
