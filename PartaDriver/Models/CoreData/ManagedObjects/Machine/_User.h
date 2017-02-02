// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserID *objectID;

@property (nonatomic, strong, nullable) NSString* email;

@property (nonatomic, strong, nullable) NSString* first_name;

@property (nonatomic, strong, nullable) NSString* last_name;

@property (nonatomic, strong, nullable) NSString* user_id;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;

- (NSString*)primitiveFirst_name;
- (void)setPrimitiveFirst_name:(NSString*)value;

- (NSString*)primitiveLast_name;
- (void)setPrimitiveLast_name:(NSString*)value;

- (NSString*)primitiveUser_id;
- (void)setPrimitiveUser_id:(NSString*)value;

@end

@interface UserAttributes: NSObject 
+ (NSString *)email;
+ (NSString *)first_name;
+ (NSString *)last_name;
+ (NSString *)user_id;
@end

NS_ASSUME_NONNULL_END
