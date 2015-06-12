/*
* Copyright (c) 2015- Facebook.
* All rights reserved.
*/
#import <Foundation/NSObject.h>

typedef struct {
    int queue;
} FBAudioRecordState;

@interface FBAudioRecorder : NSObject

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) FBAudioRecordState *recordState;
@property (nonatomic, assign) FBAudioRecorder *recorder;

@end


@implementation FBAudioRecorder {
    int x;
}

-(int) FBAudioInputCallbackSimple:(FBAudioRecorder *)rec
{
    FBAudioRecordState *recordState = rec.recordState;
    return recordState->queue;
}

-(int) FBAudioInputCallbackSimpleAliasing:(FBAudioRecorder *)userdata
{
    FBAudioRecorder *recorder = userdata;
    FBAudioRecordState *recordState = recorder.recordState;
    return recordState->queue;
}

-(int) FBAudioInputCallbackField
{
    FBAudioRecordState *recordState = _recorder->_recorder.recordState;
    return recordState->queue;
}

-(int) FBAudioInputCallbackChain:(FBAudioRecorder *)rec
{
    FBAudioRecordState *recordState = rec.recorder.recordState;
    return recordState->queue;
}

-(int) test
{
    FBAudioRecorder *rec = nil;
    FBAudioRecordState *recordState = rec.recordState;
    return recordState->queue;
}

-(instancetype) init {
    self = [super init];
    self->x = 0;
    return self;
}

@end