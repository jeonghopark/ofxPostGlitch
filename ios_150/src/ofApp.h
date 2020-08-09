#pragma once

#include "ofxiOS.h"
#include "ofxPostGlitch.h"

class ofApp : public ofxiOSApp{

public:
	void setup();
	void update();
	void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);

    
	ofImage			lenna;
	bool			bDrawLenna;
	bool			bShowHelp;

	ofFbo			myFbo;
	ofEasyCam		camera;

	ofTexture		texture;

	/*Addon instance*/
	ofxPostGlitch	myGlitch;
    
    int glitchCounter;
    ofVideoGrabber vidGrabber;
};
