//
//  MST_ListMaster+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_ListMaster+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MST_ListMaster (CoreDataProperties)

+ (NSFetchRequest<MST_ListMaster *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *sync;
@property (nullable, nonatomic, copy) NSString *tableName;

@end

NS_ASSUME_NONNULL_END
