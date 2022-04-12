
PImage input;
PImage abbr;
PImage clean;

PGraphics abbrGraphic;
PGraphics edgeGraphic;

FloatList posX;      // FloatList to hold X positions when the value is not white
FloatList posY;

color pink = color( 255, 28, 126 );

boolean mousePress = false;
float difference = 0;
float mul = .2;
int addOne = 1;

void setup() {
  size( 800, 800 );
  background( pink );

  // load image data
  input = loadImage( "abbr_01.png" );
  input.resize( 400, 400 );

  // create a graphic
  abbrGraphic = createGraphics( 400, 400 );
  edgeGraphic = createGraphics( width, height );

  // create new FloatList
  posX = new FloatList();
  posY = new FloatList();

  // for all the pixels in the input image
  for (int x = 0; x < input.width - 1; x++) {
    for (int y = 0; y < input.height - 1; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y * input.width;

      // Get the R value from image
      float pix;
      pix = red( input.pixels[ loc ] );

      // if the pixel colour in the input image is not white
      if ( pix < 255 ) {

        // add x & y value to the FloatLists
        posX.append(x);
        posY.append(y);
      }
    }
  }

  // make the graphic ( off screen ) based on data in FloatList posX & posY
  abbrGraphic.beginDraw();
  for ( int i = 0; i < posX.size(); i++ ) {
    abbrGraphic.circle(posX.get(i), posY.get(i), 1);
  }
  abbrGraphic.endDraw();

  image(abbrGraphic, width * .25, width  * .25 );
}

void draw() {

  //  if ( mousePressed ) {
  //    mousePress = true;
  //  }

  // now use locations in float list to add to the graphic
  //background(pink);

  edgeGraphic.beginDraw();
  edgeGraphic.background(pink, 0);
  edgeGraphic.stroke(255, 127);

  // get mouse position at mouseClick, calculate difference from this to all the xPos of the pixels
  // map this to squish
  // redraw
  if ( mousePress ) {
    float mouseXPos = mouseX;
    println( mouseXPos );
    for ( int i = 0; i < posX.size(); i++ ) {


      mouseXPos = map( mouseXPos, 0, width, posX.min(), posX.max());
      //if( i == 0 ) println( mouseXPos );
      //if ( mouseXPos < posX.get( i ) ) {
      //  difference = posX.get(i) - mouseXPos;
      //} else {
      //  difference = mouseXPos - posX.get(i);
      //}

      difference = posX.get(i) - mouseXPos;
      difference /= 100;
      difference = posX.get(i) * difference;

      //println( difference );

      //abbrGraphic.circle(posX.get(i) + difference, posY.get(i), 1 + difference);
      edgeGraphic.ellipse( difference, posY.get(i), 1, 1 );
    }
  }
  //println( "drawn" );
  edgeGraphic.endDraw();

  blendMode(DIFFERENCE);

  // draw the graphic
  image( edgeGraphic, 0, 0 );
}

void mousePressed() {
  mousePress = true;
}
//void mouseDragged() {
//  mousePress = true;
//}
void mouseReleased() {

  mousePress = false;
}




//void keyPressed() {
//  abbr.loadPixels();
//  // for all the pixels in the input image
//  for (int x = 0; x < abbr.width - 1; x++) {
//    for (int y = 0; y < abbr.height - 1; y++ ) {
//      // Calculate the 1D location from a 2D grid
//      int loc = x + y * abbr.width;

//      // Get the R,G,B values from image
//      float r, g, b, a ;
//      r = red( abbr.pixels[ loc ] );
//      g = green( abbr.pixels[ loc ] );
//      b = blue( abbr.pixels[ loc ] );
//      a = brightness( abbr.pixels[ loc ] );
//      if ( r > 0.0|| g > 0.0|| b> 0.0 || a > 0.0 ) {

//        //print( x + " , " +  y + " : " +  r + " , "+  g + " , "+  b + " , "+  a + " , ");
//        //println( " pixel values ");
//      }
//      // set pixels to desired
//      color c;
//      // if the pixel colour in the input image is not white
//      if ( r == 0.0 ) {
//        c = color( 255 );

//        //  if ( y % 4  == 0 ) {
//        //    // set the pixels in that location to black in the created abbr image
//        abbr.pixels[ loc ] = c;
//      }
//      //}
//    }
//  }
//  abbr.updatePixels();
//}
