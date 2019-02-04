#include "ofApp.h"
#include "filename_clean.h"

std::vector<std::string> _logs;

void print_log(const char *text) {
    _logs.push_back(text);
    printf("%s\n", text);
}

//--------------------------------------------------------------
void ofApp::setup(){
    _logs.push_back("Please drag to here");
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofClear(0);
    
    for(int i = 0 ; i < _logs.size() ; ++i) {
        ofDrawBitmapString(_logs[i], 10, 20 + 15 * i);
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo) {
    _logs.clear();
    
    for (auto file : dragInfo.files) {
        filename_clean(file.c_str(), print_log);
    }
}
