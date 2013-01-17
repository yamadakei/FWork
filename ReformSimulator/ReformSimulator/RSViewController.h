//
//  RSViewController.h
//  ReformSimulator
//
//  Created by 山田 慶 on 2013/01/17.
//  Copyright (c) 2013年 山田 慶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RSViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate>
{
    AVCaptureSession* session;
}
@property (strong, nonatomic) IBOutlet UIImageView *rsImageView;

@end
