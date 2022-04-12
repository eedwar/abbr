
PImage input;
PImage abbr;
PImage clean;

color pink = color( 255, 28, 126 );

void setup() {
  size( 400, 400 );
  background( pink );

  // load image data
  input = loadImage( "abbr_01.png" );
  input.resize( width, height );

  //create clean images
  abbr = createImage( width, height, ARGB );
  clean = createImage( width, height, ARGB );

  abbr.loadPixels();
  clean.loadPixels();
  // for all the pixels in the input image
  for (int x = 0; x < input.width - 1; x++) {
    for (int y = 0; y < input.height - 1; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y * input.width;

      // Get the R,G,B values from image
      float pix, edge;
      pix = red( input.pixels[ loc ] );
      edge = red( input.pixels[ loc + 1 ] );

      // set pixels to desired
      color c;
      // if the pixel colour in the input image is not white
      if ( pix < 255 ) {
        c = color( 0 );

        // set the pixels in that location to black in the created abbr image
        abbr.pixels[ loc ] = c;
        println(brightness(abbr.pixels[loc]));
      }
      // if the pixel colour in the image is not white & the pixel to the right is white
      if ( pix < 255 && edge >= 255 ) {

        c = color( 255 );
        // set the pixels in that location to white
        clean.pixels[ loc ] = c;
      }
    }
  }

  clean.updatePixels();
  abbr.updatePixels();
}

void draw() {
abbr.loadPixels();
  image( abbr, 0, 0 );
  image( clean, 0, 0 );
  abbr.updatePixels();
}

void keyPressed() {
  abbr.loadPixels();
  // for all the pixels in the input image
  for (int x = 0; x < abbr.width - 1; x++) {
    for (int y = 0; y < abbr.height - 1; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y * abbr.width;

      // Get the R,G,B values from image
      float r, g, b, a ;
      r = red( abbr.pixels[ loc ] );
      g = green( abbr.pixels[ loc ] );
      b = blue( abbr.pixels[ loc ] );
      a = brightness( abbr.pixels[ loc ] );
      if ( r > 0.0|| g > 0.0|| b> 0.0 || a > 0.0 ) {
        
        print( x + " , " +  y + " : " +  r + " , "+  g + " , "+  b + " , "+  a + " , ");
        //println( " pixel values ");
      }
      // set pixels to desired
      color c;
      // if the pixel colour in the input image is not white
      if ( r == 0.0 ) {
        c = color( 255 );

      //  if ( y % 4  == 0 ) {
      //    // set the pixels in that location to black in the created abbr image
          abbr.pixels[ loc ] = c;
        }
      //}
    }
  }
  abbr.updatePixels();
}
