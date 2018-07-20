#!/bin/bash

if [ ! -f /opt/Unity-2018.2.0f2/Editor/Unity ]; then
    /home/user/UnitySetup
else 
    # https://www.davidezordan.net/blog/?p=8171
    /opt/Unity-2018.2.0f2/Editor/Unity -force-driver-type-warp
fi
