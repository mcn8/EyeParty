//
//  input.h
//  EyeParty
//
//  Created by Nate on 9/13/14.
//  Copyright (c) 2014 Nate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface input : NSObject
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic,retain) AVCaptureAudioDataOutput *audioDataOutput;
-(float) getAudioLevel;
@end
