//
//  CommonUtils.h
//  TechElite
//
//  Created by Sai Kiran Gandham on 4/23/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef TechElite_CommonUtils_h
#define TechElite_CommonUtils_h


#endif

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PopoverViewController.h"
//#import "Reachability.h"


@interface CommonUtils : NSObject 

//@property (nonatomic) Reachability *hostReachability;
//@property (nonatomic) Reachability *internetReachability;
//@property (nonatomic) Reachability *wifiReachability;







//+(NSString*)checkWifi;
+(NSString *)removeSpaces:(NSString *)string;
+(BOOL)checkEmptyString:(NSString *)string;
+(void)showMessage:(NSString *)msg :(UIViewController *)viewController;
+(void) showError:(NSError *) error :(UIViewController *)viewController :(NSString *)functionName;
+(void) loadActivityIndicator: (UIViewController *)viewController;
+(void)startActivityIndicator:(UIViewController *) viewController;
+(void)stopActivityIndicator:(UIViewController *) viewController;
+(void) logout:(id) sender :(UIViewController *)viewController;

//+ (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller;
//+ (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (NSString *) password;
//+ (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (NSString *) multiJSON :(NSMutableArray *) jsonMutableArray;
//: successResponse

+ (void) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (NSString *) multiJSON :(NSMutableArray *) jsonMutableArray : (NSString *) password : (void (^)(NSDictionary *))successResponse;

+(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar;

+ (void) connectHostImage:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (UIImage *)imageToPost : (NSString *)targetFileName : (NSString *)folderName : (void (^)(NSDictionary *))successResponse;


+(NSData *)resizeImage:(UIImage *)image;

+(UIImage *)resizeImage:(UIImage *)image : (float) maxWidth : (float) maxHeight;

+(NSString *)getIPAddress;

//+(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *) dateFormat :(UIViewController *) viewController;
//+(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat :(UIViewController *) viewController;
//+(void) popoverData: (UITextField *)sender :(NSString *)tableName :(UIViewController *) viewController;

@end
