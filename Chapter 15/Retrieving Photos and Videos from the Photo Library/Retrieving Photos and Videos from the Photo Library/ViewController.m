//
//  ViewController.m
//  Retrieving Photos and Videos from the Photo Library
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@end

@implementation ViewController

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType
         sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0){
        NSLog(@"Media type is empty.");
        return NO;
    }
    
    NSArray *availableMediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    
    [availableMediaTypes enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop) {
         
         NSString *mediaType = (NSString *)obj;
         if ([mediaType isEqualToString:paramMediaType]){
             result = YES;
             *stop= YES;
         }
         
     }];
    
    return result;
    
}

- (void)  imagePickerController:(UIImagePickerController *)picker
  didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"Picked media info = %@", info);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) isPhotoLibraryAvailable{
    
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
    
}

- (BOOL) canUserPickVideosFromPhotoLibrary{
    
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie
            sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
}

- (BOOL) canUserPickPhotosFromPhotoLibrary{
    
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
            sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    static BOOL beenHereBefore = NO;
    
    if (beenHereBefore){
        /* Only display the picker once as the viewDidAppear: method gets
         called whenever the view of our view controller gets displayed */
        return;
    } else {
        beenHereBefore = YES;
    }
	
    if ([self isPhotoLibraryAvailable]){
        
        UIImagePickerController *controller =
        [[UIImagePickerController alloc] init];
        
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        
        if ([self canUserPickPhotosFromPhotoLibrary]){
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
        }
        
        if ([self canUserPickVideosFromPhotoLibrary]){
            [mediaTypes addObject:(__bridge NSString *)kUTTypeMovie];
        }
        
        controller.mediaTypes = mediaTypes;
        
        controller.delegate = self;
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    
}

@end
