//
//  MyContactListener.m
//  AlohaPhysics
//
//  Created by Christian Lykke-Rasmussen on 28/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "MyContactListener.h"

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
}

void MyContactListener::PreSolve(b2Contact* contact,
                                 const b2Manifold* oldManifold)
{
}

void MyContactListener::PostSolve(b2Contact* contact,
                                  const b2ContactImpulse* impulse)
{
    int32 count = contact->GetManifold()->pointCount;
    
    float32 maxImpulse = 0.0f;
    for (int32 i = 0; i < count; ++i)
    {
        maxImpulse = b2Max(maxImpulse, impulse->normalImpulses[i]);
    }
    
    if (maxImpulse > 3.0f)
    {
        NSLog(@"Impulse strong enough for hero to sound!");
    }
}
