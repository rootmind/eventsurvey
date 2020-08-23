//
//  ImageData.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/26/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import "ImageData.h"

@implementation ImageData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _imageId = [jsonDictionary objectForKey:@"imageId"];
        _imageFile = [jsonDictionary objectForKey:@"imageFile"];
        _imageFileName = [jsonDictionary objectForKey:@"imageFileName"];
        _imageFileFolder = [jsonDictionary objectForKey:@"imageFileFolder"];
        _imageStatus = [jsonDictionary objectForKey:@"imageStatus"];
        _uploadUserId = [jsonDictionary objectForKey:@"uploadUserId"];
        _uploadDateTime = [jsonDictionary objectForKey:@"uploadDateTime"];
        _modifiedUserId = [jsonDictionary objectForKey:@"modifiedUserId"];
        _modifiedDateTime = [jsonDictionary objectForKey:@"modifiedDateTime"];
        _imageUploadStatus = [jsonDictionary objectForKey:@"imageUploadStatus"];
        _imageDeleteStatus = [jsonDictionary objectForKey:@"imageDeleteStatus"];
        _imageFoundStatus = [jsonDictionary objectForKey:@"imageFoundStatus"];
        _docID = [jsonDictionary objectForKey:@"docID"];
        _docIDValue = [jsonDictionary objectForKey:@"docIDValue"];
        
        _ocrData = [jsonDictionary objectForKey:@"ocrData"];
        _ocrOriginal = [jsonDictionary objectForKey:@"ocrOriginal"];
        _ocrEditFlag = [jsonDictionary objectForKey:@"ocrEditFlag"];
        
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
    }
    
    return self;
}

@end
