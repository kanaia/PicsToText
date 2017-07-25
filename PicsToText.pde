import processing.pdf.*;
import java.util.Calendar;
import gifAnimation.*;


float fontSizeMax = 20;
float fontSizeMin = 10;
float spacing = 12; // line height
float kerning = 0.5; // between letters
String inputText = "start"; // don't change this!!!

boolean fontSizeStatic = false;
boolean blackAndWhite = false;
boolean noise = false;
boolean isGif = false;
boolean firstTime = true;
boolean scrollingText = false;
boolean saveGif = false;
boolean startSaveGif = false;

int delay = 0; 
int gifPosition = 0; // Position for GIF Frames
int iterationsCounter = 0; // Counting all used characters for scrolling text mode
int counter = 0;
float x = 0, y = 10;

PFont font;
PImage img;
PImage[] imgGif;
GifMaker gifExport;

int greyscale;
int background_color = 255; // 0-255
int imgX;
int imgY;
color c;

void setup() {
  selectInput("Select an image to process", "fileSelected");
  selectInput("Select a text to process", "fileSelected");
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
      gifPosition = 0;
    }
    else if(getFileExtension(selection).equals("txt")){
      String[] input = loadStrings(selection);
      inputText = "";
      for (int i = 0 ; i < input.length; i++) {
        inputText += input[i];
      }
    }
    else if(getFileExtension(selection).equals("png") || getFileExtension(selection).equals("jpg"))
    {
       img = loadImage(selection.getAbsolutePath());
       surface.setSize(img.width, img.height);
       isGif = false;
    }  
    else
      println("Unkown File Type");
  } 
}

private static String getFileExtension(File file) {
        String fileName = file.getName();
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
        return fileName.substring(fileName.lastIndexOf(".")+1);
        else return "";
 }

void draw() {
  if((img != null || imgGif != null) && !inputText.equals("start")){
    background(background_color);
    textAlign(LEFT);
    delay(delay);
  
    x = 0; y = 10;
    counter = 0 + iterationsCounter;
  
    while (y < height) {
      // translate position (display) to position (image)
      if(isGif){
        if (gifPosition > imgGif.length-1) gifPosition = 0;
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
        if (blackAndWhite) fill(greyscale);
        else fill(c);
      } 
      else {
        // greyscale to fontsize
        float fontSize = map(greyscale, 0, 255, fontSizeMax, fontSizeMin);
        fontSize = max(fontSize, 1);
        textFont(font, fontSize);
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
        x = 0;
        y = y + spacing; // add line height
      }
    
    //Helper for Scrolling Text Mode
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
    
    //Scrolling Text Mode
    if(scrollingText){
      firstTime = false;
      iterationsCounter++;
      if (iterationsCounter > inputText.length()-1) iterationsCounter = 0;
    }
    else
    {
      firstTime = true;
    }
    
    //Save GIF
    if(saveGif)
    {
      // Start at first frame
      if(gifPosition == 0)
        startSaveGif = true;
        
      if(startSaveGif){
        gifExport.setDelay(0);
        gifExport.addFrame();
        
        if(gifPosition == imgGif.length-1){
          gifExport.finish();
          saveGif = false;
          startSaveGif = false;
          System.out.println("GIF saved");
        }
      }
    }
    
    // Increase GIF Frame after everthing is done
    if(isGif){
      gifPosition++;
    } 
  }
}


void keyReleased() {
  if (key == 's' || key == 'S'){
    if(!isGif){
      saveFrame(timestamp()+"_##.png");
    }
    else
    {
      saveGif = true;
      gifExport = new GifMaker(this, timestamp()+"_animated.gif");
      gifExport.setRepeat(0);
    }
  }
  // change render mode
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color stlye
  if (key == '2') blackAndWhite = !blackAndWhite;
  //change noise DOESNT WORK WITH 1/2
  if (key == '3') noise = !noise;
  if (key == '4') scrollingText = !scrollingText;
  if (key == 'f') selectInput("Select a image to process:", "fileSelected");
  
  println("fontSizeMin: "+fontSizeMin+"  fontSizeMax: "+fontSizeMax+"   fontSizeStatic: "+fontSizeStatic+"   blackAndWhite: "+blackAndWhite+"   noise: "+noise+"   scrollingText: "+scrollingText+"   delay: "+delay);
}

void keyPressed() {
  // change fontSizeMax with arrowkeys up/down 
  if (keyCode == UP) fontSizeMax += 2;
  if (keyCode == DOWN) if(fontSizeMax-2 > 0) fontSizeMax -= 2; 
  // change fontSizeMin with arrowkeys left/right
  if (keyCode == RIGHT) fontSizeMin += 2;
  if (keyCode == LEFT) if(fontSizeMin-2 > 0)fontSizeMin -= 2; 
  // change delay with d/e
  if (key == 'd') delay += 10;
  if (key == 'e') if(delay > 0) delay -= 10;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}