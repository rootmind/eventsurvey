//
//  ImageData.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/26/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *cifNumber;
@property (readonly) NSString *imageId;
@property (readonly) NSString *imageFile;
@property (readonly) NSString *imageFileName;
@property (readonly) NSString *imageFileFolder;
@property (readonly) NSString *imageStatus;
@property (readonly) NSString *uploadUserId;
@property (readonly) NSString *uploadDateTime;
@property (readonly) NSString *modifiedUserId;
@property (readonly) NSString *modifiedDateTime;
@property (readonly) NSString *imageUploadStatus;
@property (readonly) NSString *imageDeleteStatus;
@property (readonly) NSString *imageFoundStatus;

@property (readonly) NSString *docID;
@property (readonly) NSString *docIDValue;
@property (readonly) NSString *ocrData;
@property (readonly) NSString *ocrOriginal;
@property (readonly) NSString *ocrEditFlag;

@property (readonly) NSString *recordFound;

@end
