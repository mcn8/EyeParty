//
//  input.m
//  EyeParty
//
//  Created by Nate on 9/13/14.
//  Copyright (c) 2014 Nate. All rights reserved.
//

#import "input.h"

@implementation input
-(float) getAudioLevel{
    AVCaptureAudioDataOutput *audioDataOutput;
    NSArray *connections = audioDataOutput.connections;
    if ([connections count] > 0) {
        // There should be only one connection to an AVCaptureAudioDataOutput.
        AVCaptureConnection *connection = [connections objectAtIndex:0];
        
        NSArray *audioChannels = connection.audioChannels;
        
        for (AVCaptureAudioChannel *channel in audioChannels) {
            float avg = channel.averagePowerLevel;
            float peak = channel.peakHoldLevel;
            return avg;
            // Update the level meter user interface.
        }
    }
    return 0;
}

@end
