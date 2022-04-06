
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
  abbr = createImage( width, height, ALPHA );
  clean = createImage( width, height, ALPHA );


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
      if ( pix < 255 ) {
        c = color( 0 );

        abbr.pixels[ loc ] = c;
        //clean.pixels[ loc ] = color(255);
      } 
      if( pix < 255 && edge >= 255 ) {

        c = color( 255 );
        // update run window with pixels
        clean.pixels[ loc ] = c;
      }
    }
  }
  clean.updatePixels();
  abbr.updatePixels();
}

void draw() {

  image( abbr, 0, 0 );
  image( clean, 0, 0 );
}
