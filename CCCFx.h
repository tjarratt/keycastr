//
//  CCCFx.h
//
//  Created by Chris Topher on 3/9/13.
//  Copyright (c) 2013 Chris Topher. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCCFxModel;

@interface CCCFx : NSObject {
    id<CCCFxModel> model;
    NSTimer *delayTimer;
    NSTimer *fxTimer;
}

- (CCCFx*)initWithModel:(id<CCCFxModel>)model;
- (void)start;
- (void)stop;

@end

@protocol CCCFxModel <NSObject>
@required

- (void)reset;

- (NSTimeInterval)delay;
- (unsigned int)framesPerSecond;

- (BOOL)hasNextValue;
- (void)applyNextValue;

@end