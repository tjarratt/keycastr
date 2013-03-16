//
//  CCCFx.m
//
//  Created by Chris Topher on 3/9/13.
//  Copyright (c) 2013 Chris Topher. All rights reserved.
//

#import "CCCFx.h"

@implementation CCCFx

- (CCCFx*)initWithModel:(id<CCCFxModel>)aModel {
    self = [super init];
    if (self) {
        model = aModel;
    }
    return self;
}

- (void)start {
    [self stop];
    [model reset];
    if ([model delay] > 0) {
        delayTimer = [[NSTimer scheduledTimerWithTimeInterval:[model delay] target:self selector:@selector(wakeUp) userInfo:NULL repeats:NO] retain];
    } else {
        [self wakeUp];
    }
}

- (void)wakeUp {
    fxTimer = [[NSTimer scheduledTimerWithTimeInterval:1.f/[model framesPerSecond] target:self selector:@selector(applyFx) userInfo:NULL repeats:YES] retain];
}

- (void)applyFx {
    if ([model hasNextValue]) {
        [model applyNextValue];
    } else {
        [self stop];
    }
}

- (void)stop {
    if (delayTimer) {
        [delayTimer invalidate];
        delayTimer = NULL;
    }
    if (fxTimer) {
        [fxTimer invalidate];
        fxTimer = NULL;
    }
}

@end
