#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofSetVerticalSync(true);
	ofSetFrameRate(60);
    
//    vidGrabber.setup(640, 480);
    
	camera.setDistance(400);
	ofSetCircleResolution(3);

	lenna.load("lenna.png");
	bDrawLenna = false;
	bShowHelp  = true;
	myFbo.allocate(512, 512);

	myGlitch.setup(&myFbo);
    myGlitch.loadShader();
    myGlitch.setFx(OFXPOSTGLITCH_CONVERGENCE, true);
    glitchCounter = 0;
    
    
}

//--------------------------------------------------------------
void ofApp::update(){
    
//    vidGrabber.update();
    
	myFbo.begin();
	ofClear(0, 0, 0,255);
//    vidGrabber.draw(0, 0);
    if (!bDrawLenna){
        camera.begin();

        for (int i = 0;i < 100;i++){
            if (i % 5 == 0) ofSetColor(50 , 255, 100);
            else if (i % 9 == 0) ofSetColor(255, 50, 100);
            else                 ofSetColor(255, 255, 255);

            ofPushMatrix();
            ofRotateDeg(ofGetFrameNum(), 1.0, 1.0, 1.0);
            ofTranslate((ofNoise(i/2.4)-0.5)*1000,
                        (ofNoise(i/5.6)-0.5)*1000,
                        (ofNoise(i/8.2)-0.5)*1000);
            ofDrawCircle(0, 0, (ofNoise(i/3.4)-0.5)*100+ofRandom(3));
            ofPopMatrix();
        }

        camera.end();
    }else{
        ofSetColor(255);
        lenna.draw(0, 0);
    }
	myFbo.end();

}

//--------------------------------------------------------------
void ofApp::draw(){
	
	/* draw normal view */
	ofSetColor(255);
	myFbo.draw(0, 0);

	/* Apply effects */
	myGlitch.generateFx();

	/* draw effected view */
	ofSetColor(255);
	myFbo.draw(0, 512);


	/* show information*/
	string info = "";
	info += "1 - 0 : Apply glitch effects.\n";
	info += "q - u : Apply color remap effects.\n";
	info += "i key : Switch 3Dview / 2DImage.\n";
	info += "h key : Hide or show this information.";
    info += "l key : load Sahder";

	if (bShowHelp){
		ofSetColor(0, 200);
		ofDrawRectangle(25, 17, 320, 60);
		ofSetColor(255);
		ofDrawBitmapString(info, 30,30);
	}
    
//    cout << glitchCounter << endl;
}


//--------------------------------------------------------------
void ofApp::exit(){
    
}




//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    glitchCounter++;

    switch(glitchCounter % 3) {
        case 0:
            myGlitch.setFx(OFXPOSTGLITCH_CR_GREENINVERT    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CONVERGENCE    , true);
            break;

        case 1:
            myGlitch.setFx(OFXPOSTGLITCH_CONVERGENCE    , false);
            myGlitch.setFx(OFXPOSTGLITCH_GLOW    , true);
            break;

        case 2:
            myGlitch.setFx(OFXPOSTGLITCH_GLOW    , false);
            myGlitch.setFx(OFXPOSTGLITCH_SHAKER    , true);
            break;

        case 3:
            myGlitch.setFx(OFXPOSTGLITCH_SHAKER    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CUTSLIDER    , true);
            break;

        case 4:
            myGlitch.setFx(OFXPOSTGLITCH_CUTSLIDER    , false);
            myGlitch.setFx(OFXPOSTGLITCH_TWIST    , true);
            break;

        case 5:
            myGlitch.setFx(OFXPOSTGLITCH_TWIST    , false);
            myGlitch.setFx(OFXPOSTGLITCH_OUTLINE    , true);
            break;

        case 6:
            myGlitch.setFx(OFXPOSTGLITCH_OUTLINE    , false);
            myGlitch.setFx(OFXPOSTGLITCH_NOISE    , true);
            break;

        case 7:
            myGlitch.setFx(OFXPOSTGLITCH_NOISE    , false);
            myGlitch.setFx(OFXPOSTGLITCH_SLITSCAN    , true);
            break;

        case 8:
            myGlitch.setFx(OFXPOSTGLITCH_SLITSCAN    , false);
            myGlitch.setFx(OFXPOSTGLITCH_SWELL    , true);
            break;

        case 9:
            myGlitch.setFx(OFXPOSTGLITCH_SWELL    , false);
            myGlitch.setFx(OFXPOSTGLITCH_INVERT    , true);
            break;

        case 10:
            myGlitch.setFx(OFXPOSTGLITCH_INVERT    , false);
            myGlitch.setFx(OFXPOSTGLITCH_INVERT    , true);
            break;

        case 11:
            myGlitch.setFx(OFXPOSTGLITCH_SWELL    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_HIGHCONTRAST    , true);
            break;

        case 12:
            myGlitch.setFx(OFXPOSTGLITCH_CR_HIGHCONTRAST    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_BLUERAISE    , true);
            break;

        case 13:
            myGlitch.setFx(OFXPOSTGLITCH_CR_BLUERAISE    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_REDRAISE    , true);
            break;

        case 14:
            myGlitch.setFx(OFXPOSTGLITCH_CR_REDRAISE    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_GREENRAISE    , true);
            break;

        case 15:
            myGlitch.setFx(OFXPOSTGLITCH_CR_GREENRAISE    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_BLUEINVERT    , true);
            break;

        case 16:
            myGlitch.setFx(OFXPOSTGLITCH_CR_BLUEINVERT    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_REDINVERT    , true);
            break;

        case 17:
            myGlitch.setFx(OFXPOSTGLITCH_CR_REDINVERT    , false);
            myGlitch.setFx(OFXPOSTGLITCH_CR_GREENINVERT    , true);
            break;

    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}



