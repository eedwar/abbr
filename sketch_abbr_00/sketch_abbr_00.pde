// E.Edwards. 2022.
// a2z :: A :: abbr.

// something what "abbreviate" text

PImage abbr;
float bit;

boolean mouseClick = false;
int clickCount = 0;
int mouseXPos;

color pink = color( 255, 28, 126 );

PGraphics graphic;
void setup() {


  background( pink );
  size( 1024, 1024 );


  // load image data
  abbr = loadImage( "abbr_01.png" );

  // load pixel data
  abbr.loadPixels();

  // log red value for pixels
  for ( int i = 0; i < abbr.pixels.length; i++ ) {
    print( red( abbr.pixels[ i ] ) + " , " );
  }

  for (int x = 0; x < abbr.width; x++) {
    for (int y = 0; y < abbr.height; y++ ) {

      // Calculate the 1D location from a 2D grid
      int loc = x + y * abbr.width;

      // Get the R,G,B values from image
      float r;
      r = red( abbr.pixels[ loc ] );

      // set pixels to desired
      color c;
      if ( r < 255 ) {
        c = color( 0 );


        abbr.pixels[ y * width + x  ] = c;
      } else {

        // update run window with pixels
        abbr.pixels[ y * width + x  ] = pink;
      }
    }
  }
  // update run window with pixels
  abbr.updatePixels();
}

void draw() {
  abbr.updatePixels();
  image( abbr, 0, 0 );
}

void mouseDragged() {
  if ( !mouseClick ) {
    mouseXPos = mouseX;
    println(mouseXPos);
    mouseClick = true;
    clickCount++;
  }

  for (int x = 1; x < abbr.width - 1; x++) {
    for (int y = 1; y < abbr.height -1; y++ ) {

      // Calculate the 1D location from a 2D grid
      int loc = x + y * abbr.width;

      // Get the R,G,B values from image
      float r, r1, r2;
      r = red( abbr.pixels[ loc ] );
      r1 = red( abbr.pixels[ loc + 1 ] );
      r2 = red( abbr.pixels[ loc - 1 ] );
      // set pixels to desired
      color c;
      //if ( r < 255 && r1 >= 255) {
      //  if ( clickCount % 2 == 0 ) {
      //    c = color( 0 );
      //  } else {
      //    c = color( 255 );
      //  }

      //  if ( y % 10 < 5 ) {
      //    //blendMode(LIGHTEST);
      //    abbr.pixels[ y * width + x + mouseX - mouseXPos ] = c;
      //  }
      //} else
      if ( r < 255) {// && r2 >= 255 ) {
        c = pink;
        c = color( 0, 255, 0 );
        if ( y % 10 < 10 && y % 10 > 5 ) {
          blendMode(DIFFERENCE);
          abbr.pixels[ y * width + x + mouseX ] = c;
        }
      }
    }
  }
  // update run window with pixels
  abbr.updatePixels();
}
void mouseReleased() {

  mouseClick = false;
}

void keyPressed() {

  // run "abbrivation" dots
  if ( key == '.' ) {

    println( " . . . .");
    for ( int i = 0; i < abbr.pixels.length; i++ ) {
      if ( i % 4 == 0 ) {
        float r = red(abbr.pixels[ i ]);
        color c = color( r );
        pixels[ i ] = c;
      }
    }
  }
  // run "abbrivation" lines
  if ( key == 'a' ) {

    println( " ABBBBBBBBBBBBBBBBRIVATING " );

    //for (int x = 0; x < abbr.width; x++) {
    //  for (int y = 0; y < abbr.height; y++ ) {

    //    // Calculate the 1D location from a 2D grid
    //    int loc = x + y * abbr.width;

    //    // Get the R,G,B values from image
    //    float r, g, b;
    //    r = red( abbr.pixels[ loc ] );
    //    g = green( abbr.pixels[ loc ] );
    //    b = blue( abbr.pixels[ loc ] );

    //    // set pixels to desired
    //    color c;
    //    if ( r < 255 ) {
    //      c = color( r );

    //      if ( y % 2 == 0 ) {

    //        pixels[ y + mouseY * width + x + mouseX ] = c;
    //      }
    //    }
    //  }
    //}
    //// update abbr pixel data
    //abbr.updatePixels();
  }

  if ( key == 'd' ) {
    //  // update run window with pixels
    //  updatePixels();
  }
}
