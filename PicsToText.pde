/**
 * pixel mapping. each pixel is translated into a new element (letter)
 * 
 * KEYS
 * 1                 : toogle font size mode (dynamic/static)
 * 2                 : toogle font color mode (color/b&w)
 * arrow up/down     : maximal fontsize +/-
 * arrow right/left  : minimal fontsize +/-
 * s                 : save png
 */

import processing.pdf.*;
import java.util.Calendar;
import gifAnimation.*;

//String inputText ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
//String inputText="Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch. Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.Hat der alte Hexenmeister Sich doch einmal wegbegeben! Und nun sollen seine Geister Auch nach meinem Willen leben. Seine Wort' und Werke Merkt ich und den Brauch, Und mit Geistesstärke Tu' ich Wunder auch.";

String inputText = "Test j fasdfj as faisfj iasjdfi asjifja sipjf aiädsjfa isjdf iasjfi asjdfiäj asidfj äasdf";
float fontSizeMax = 20;
float fontSizeMin = 10;
float spacing = 12; // line height
float kerning = 0.5; // between letters

boolean fontSizeStatic = false;
boolean blackAndWhite = false;
boolean noise = false;
boolean isGif = false;
boolean dynamicFontSize = false;
boolean firstTime = true;
boolean scrollingText = false;
int gifPosition = 0;
int iterationsCounter = 0;

int test;

PFont font;
PImage img;
PImage[] imgGif;

int greyscale;
int imgX;
int imgY;
color c;

void setup() {
  selectInput("Select a file to process:", "fileSelected");
  size(600, 800);
  smooth(); 
  
  font = createFont("Times",10);
}

void fileSelected(File selection) {
  if (selection == null) {
    println("File Selection cancelled");
  } else {
    
    if(getFileExtension(selection).equals("gif")){
      imgGif = Gif.getPImages(this, selection.getAbsolutePath());
      isGif = true;
      surface.setSize(imgGif[0].width, imgGif[0].height);
    }
    else
     {
       img = loadImage(selection.getAbsolutePath());
       surface.setSize(img.width, img.height);
       isGif = false;
     }  
  } 
}

private static String getFileExtension(File file) {
        String fileName = file.getName();
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
        return fileName.substring(fileName.lastIndexOf(".")+1);
        else return "";
 }

void draw() {
  
  if(img != null || imgGif != null){
    background(255);
    textAlign(LEFT);
  
    float x = 0, y = 10;
    int counter = 0 + iterationsCounter;
  
    while (y < height) {
      // translate position (display) to position (image)
      if(isGif){
        imgX = (int) map(x, 0,width, 0,imgGif[gifPosition].width);
        imgY = (int) map(y, 0,height, 0,imgGif[gifPosition].height);
        // get current color
        c = imgGif[gifPosition].pixels[imgY*imgGif[gifPosition].width+imgX];
      }
      else{
        imgX = (int) map(x, 0,width, 0,img.width);
        imgY = (int) map(y, 0,height, 0,img.height);
        // get current color
        c = img.pixels[imgY*img.width+imgX];
      }
      if(!noise){
        greyscale = round(red(c)*0.222 + green(c)*0.707 + blue(c)*0.071);
      }else{
        greyscale = (int)random(255);
      }
      pushMatrix();
      translate(x, y);
  
      if (fontSizeStatic) {
        textFont(font, fontSizeMax);
        kerning = 0.02*fontSizeMax;
        if (blackAndWhite) fill(greyscale);
        else fill(c);
      } 
      else {
        // greyscale to fontsize
        float fontSize = map(greyscale, 0, 255, fontSizeMax, fontSizeMin);
        fontSize = max(fontSize, 1);
        textFont(font, fontSize);
        //kerning = 0.02*fontSizeMax;
        if (blackAndWhite) fill(greyscale);
        else fill(c);
      } 
  
      char letter = inputText.charAt(counter);
      text(letter, 0, 0);
      float letterWidth = textWidth(letter) + kerning;
      // for the next letter ... x + letter width
      x = x + letterWidth; // update x-coordinate
      popMatrix();
  
      // linebreaks
      if (x+letterWidth >= width) {
        test = counter;
        x = 0;
        y = y + spacing; // add line height
      }
    
      if(firstTime){
        counter++;
        if ((counter > inputText.length()-1)) counter = 0;
      }
      else
      {
        if (!(counter > inputText.length()-1)) counter++;
        if ((counter > inputText.length()-1)) y=height;
      }
    }
    
    delay(100);
    if(scrollingText){
      firstTime = false;
      iterationsCounter++;
      if (iterationsCounter > inputText.length()-1) iterationsCounter = 0;
    }
    else
    {
      firstTime = true;
    }
    
    if(isGif){
      gifPosition++;
      if (gifPosition > imgGif.length-1) gifPosition = 0;
    }
    
    if(dynamicFontSize)
    {      
      fontSizeMax += random(-1, 1);
      fontSizeMin += random(-1, 1);
    }
  }
}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  // change render mode
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color stlye
  if (key == '2') blackAndWhite = !blackAndWhite;
  //change noise DOESNT WORK WITH 1/2
  if (key == '3') noise = !noise;
  if (key == '4') dynamicFontSize = !dynamicFontSize;
  if (key == '5') scrollingText = !scrollingText;
  if (key == 'f') selectInput("Select a file to process:", "fileSelected");
  
  println("fontSizeMin: "+fontSizeMin+"  fontSizeMax: "+fontSizeMax+"   fontSizeStatic: "+fontSizeStatic+"   blackAndWhite: "+blackAndWhite+"   noise: "+noise+"   dynamicFontSize: "+dynamicFontSize+"   scrollingText: "+scrollingText);
}

void keyPressed() {
  // change fontSizeMax with arrowkeys up/down 
  if (keyCode == UP) fontSizeMax += 2;
  if (keyCode == DOWN) fontSizeMax -= 2; 
  // change fontSizeMin with arrowkeys left/right
  if (keyCode == RIGHT) fontSizeMin += 2;
  if (keyCode == LEFT) fontSizeMin -= 2; 

  //fontSizeMin = max(fontSizeMin, 2);
  //fontSizeMax = max(fontSizeMax, 2);
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}