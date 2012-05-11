//
//  MyContactListener.m
//  AlohaPhysics
//
//  Created by Christian Lykke-Rasmussen on 28/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "MyContactListener.h"
#import "SoundManager.h"
#import "ObjectUtilities.h"

MyContactListener::MyContactListener() : contacts()
{
}

MyContactListener::~MyContactListener()
{
}

void MyContactListener::BeginContact(b2Contact* contact)
{
}

void MyContactListener::EndContact(b2Contact* contact)
{
    b2Body *a = contact->GetFixtureA()->GetBody();
    b2Body *b = contact->GetFixtureB()->GetBody();
    ObjectUtilities *aO = (ObjectUtilities*)a->GetUserData();
    ObjectUtilities *bO = (ObjectUtilities*)b->GetUserData();
    
    if(aO.isHit)
    {
        aO.isHit = NO;
    }
    
    if(bO.isHit) 
    {
        bO.isHit = NO;
    }
}

void MyContactListener::PreSolve(b2Contact* contact,
                                 const b2Manifold* oldManifold)
{
}

void MyContactListener::PostSolve(b2Contact* contact,
                                  const b2ContactImpulse* impulse)
{

    b2Body *a = contact->GetFixtureA()->GetBody();
    b2Body *b = contact->GetFixtureB()->GetBody();
    ObjectUtilities *aO = (ObjectUtilities*)a->GetUserData();
    ObjectUtilities *bO = (ObjectUtilities*)b->GetUserData();
    
    float32 maxImpulse = 0.0f;
    maxImpulse = b2Max(maxImpulse, impulse->normalImpulses[0]);
    
    if (maxImpulse > 3.0f)
    {
        if(!aO.isHit && !bO.isHit)
        {
            //[[SoundManager sharedManager] playSound:HIT];
            if(!aO.isHit)
            {
                aO.isHit = YES;
            }
            
            if(!bO.isHit) 
            {
                bO.isHit = YES;
            }
        }
    }
}
