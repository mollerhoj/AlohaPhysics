//
//  MyContactListener.h
//  AlohaPhysics
//
//  Created by Christian Lykke-Rasmussen on 28/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Box2D.h"
#import <set>
#import <algorithm>

class MyContactListener : public b2ContactListener {
    
public:
    std::set<b2Body*>contacts;
    
    MyContactListener();
    ~MyContactListener();
    
    virtual void BeginContact(b2Contact* contact);
    virtual void EndContact(b2Contact* contact);
    virtual void PreSolve(b2Contact* contact, const b2Manifold* oldManifold);   
    virtual void PostSolve(b2Contact* contact, const b2ContactImpulse* impulse);
    
};
