//
//  Utils.m
//  AlohaPhysics
//
//  Created by Jens Møllerhøj on 09/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(BOOL) fileExistsInProject:(NSString *)fileName
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *fileInResourcesFolder = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
	return [fileManager fileExistsAtPath:fileInResourcesFolder];
}

@end
