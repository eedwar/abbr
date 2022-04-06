// E.Edwards. 2022.
// a2z :: A :: abbr.

// something what "abbreviates" text

PImage abbr;
PImage clean;

boolean mouseClick = false;

int clickCount = 0;
int mouseXPos;

color pink = color( 255, 28, 126 );

int i = 0;

void setup() {

  background( pink );
  size( 420, 420 );
  
  // load image data
  abbr = loadImage( "abbr_01.png" );
abbr.resize( width, height );
// load pixel data
  abbr.loadPixels();

  clean = createImage( width, height, ALPHA );
  //println(clean);

  // log red value for pixels
  for ( int i = 0; i < abbr.pixels.length; i++ ) {
    //print( red( abbr.pixels[ i ] ) + " , " );
  }

  for (int x = 0; x < abbr.width - 1; x++) {
    for (int y = 0; y < abbr.height - 1; y++ ) {

      // Calculate the 1D location from a 2D grid
      int loc = x + y * abbr.width;

      //    // Get the R,G,B values from image
      float pix, edge;
      pix = red( abbr.pixels[ loc ] );
      edge = red( abbr.pixels[ loc + 1 ] );


      // find edge pixels
      if ( pix < 255 && edge >= 255 ) {
        clean.pixels[ loc ] = abbr.pixels[ loc ];
        clean.pixels[ loc ] = color( 255 );
      }
    }
  }
  // update run window with pixels
  clean.updatePixels();
  //clean.width( maxWid );
  //image( abbr, 0, 0 );
  println( "abbr", abbr.pixels.length );
  println( "clean", clean.pixels.length );
}

void draw() {

  image( clean, 0, 0 );
}

void mouseClicked() {
  i++;
  for ( int x = 0; x < clean.width - 1; x++ ) {
    for ( int y = 0; y < clean.height - 1; y++ ) {
      int loc = x + y * clean.width;
      float edge;
      edge = red( clean.pixels[ loc + 1 ] );
      if( edge == 255 ) {
        
      println( "edge" , edge );
      println( clean.pixels );
      println( clean.pixels[ x + 1 ] );
        clean.pixels[ x + 1 ] = color( 0 );
      }
    }
  }
  clean.updatePixels();
}

void mouseReleased() {

  mouseClick = false;
}

void mouseDragged() {

  //  if ( !mouseClick ) {
  //    mouseXPos = mouseX;
  //    println(mouseXPos);
  //    mouseClick = true;
  //    clickCount++;
  //  }

  //  for ( int x = 0; x < clean.width; x++ ) {
  //    for ( int y = 0; y < clean.height; y++ ) {

  //      // Calculate the 1D location from a 2D grid
  //      int loc = x + y * clean.width;

  //      float pix;
  //      pix = red( clean.pixels[ loc ] );
  //      if ( pix == 255 ) {
  //        color c = color( 255, 255, 0 );
  //        if ( y % 10 < 5 ) {
  //          clean.pixels[ loc + mouseX - mouseXPos ] = c;
  //        }
  //      }
  //    }
  //  }
  //  clean.updatePixels();
}
