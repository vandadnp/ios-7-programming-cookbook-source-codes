//
//  ViewController.m
//  Editing Videos on an iOS Device
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()
<UINavigationControllerDelegate,
UIVideoEditorControllerDelegate,
UIImagePickerControllerDelegate>
@property (nonatomic, strong) NSURL *videoURLToEdit;
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
@end

@implementation ViewController

- (void)videoEditorController:(UIVideoEditorController *)editor
     didSaveEditedVideoToPath:(NSString *)editedVideoPath{
    NSLog(@"The video editor finished saving video");
    NSLog(@"The edited video path is at = %@", editedVideoPath);
    [editor dismissViewControllerAnimated:YES completion:nil];
}

- (void)videoEditorController:(UIVideoEditorController *)editor
             didFailWithError:(NSError *)error{
    NSLog(@"Video editor error occurred = %@", error);
    [editor dismissViewControllerAnimated:YES completion:nil];
}

- (void)videoEditorControllerDidCancel:(UIVideoEditorController *)editor{
    NSLog(@"The video editor was cancelled");
    [editor dismissViewControllerAnimated:YES completion:nil];
}

- (void)    imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"Picker returned successfully.");
    
    NSString     *mediaType = [info objectForKey:
                               UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        self.videoURLToEdit = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        if (self.videoURLToEdit != nil){
            
            NSString *videoPath = [self.videoURLToEdit path];
            
            /* First let's make sure the video editor is able to edit the
             video at the path in our documents folder */
            if ([UIVideoEditorController canEditVideoAtPath:videoPath]){
                
                /* Instantiate the video editor */
                UIVideoEditorController *videoEditor =
                [[UIVideoEditorController alloc] init];
                
                /* We become the delegate of the video editor */
                videoEditor.delegate = self;
                
                /* Make sure to set the path of the video */
                videoEditor.videoPath = videoPath;
                
                /* And present the video editor */
                [self presentViewController:videoEditor
                                   animated:YES
                                 completion:nil];
                
                self.videoURLToEdit = nil;
                
            } else {
                NSLog(@"Cannot edit the video at this path");
            }
            
        }
        
    }];
    
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    NSLog(@"Picker was cancelled");
    self.videoURLToEdit = nil;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType
         sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0){
        NSLog(@"Media type is empty.");
        return NO;
    }
    
    NSArray *availableMediaTypes =
    [UIImagePickerController
     availableMediaTypesForSourceType:paramSourceType];
    
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

- (BOOL) canUserPickVideosFromPhotoLibrary{
    
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie
                 sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
}

- (BOOL) isPhotoLibraryAvailable{
    
    return [UIImagePickerController
            isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
    
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    static BOOL beenHereBefore = NO;
    
    if (beenHereBefore){
        /* Only display the picker once as the viewDidAppear: method gets
         called whenever the view of our view controller gets displayed */
        return;
    } else {
        beenHereBefore = YES;
    }
    
    self.assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    if ([self isPhotoLibraryAvailable] &&
        [self canUserPickVideosFromPhotoLibrary]){
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        
        /* Set the source type to photo library */
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        /* And we want our user to be able to pick movies from the library */        
        imagePicker.mediaTypes = @[(__bridge NSString *)kUTTypeMovie];
        
        /* Set the delegate to the current view controller */
        imagePicker.delegate = self;
        
        /* Present our image picker */
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
    
}

@end
