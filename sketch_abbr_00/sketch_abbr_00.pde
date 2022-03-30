// E.Edwards. 2022.
// a2z :: A :: abbr.

// something what "abbrivates" text

PImage abbr;
float bit;
void setup() {

  background( 255, 28, 126 );
  size( 1024, 1024 );

  // load image data
  abbr = loadImage( "abbr_01.png" );

  // load pixel data
  loadPixels();

  // log red value for pixels
  for ( int i = 0; i < abbr.pixels.length; i++ ) {
    print( red( abbr.pixels[ i ] ) + " , " );
  }
}

void draw() {
}


void keyPressed() {

  // run "abbrivation" dots
  if ( key == '.' ) {

    println( " . . . .");
    for ( int i = 0; i < abbr.pixels.length; i++ ) {
      if ( i % 4 == 0 ) {
        float r = red(abbr.pixels[i]);
        color c = color( r );
        pixels[ i ] = c;
      }
    }
  }
  // run "abbrivation" lines
  if ( key == 'a' ) {

    println( " ABBBBBBBBBBBBBBBBRIVATING " );

    for (int x = 0; x < abbr.width; x++) {
      for (int y = 0; y < abbr.height; y++ ) {

        // Calculate the 1D location from a 2D grid
        int loc = x + y * abbr.width;

        // Get the R,G,B values from image
        float r, g, b;
        r = red (abbr.pixels[loc]);
        g = green (abbr.pixels[loc]);
        b = blue (abbr.pixels[loc]);

        // set pixels to desired
        color c;
        if ( r < 255 ) {
          c = color(r);

          if ( y % 2 == 0 ) {

            pixels[y * width + x] = c;
          }
        }
      }
    }
    // update abbr pixel data
    abbr.updatePixels();
  }

  if ( key == 'd' ) {
    // update run window with pixels
    updatePixels();
  }
}
