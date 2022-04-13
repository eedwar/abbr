

// 2022. E.Edwards.
// a2z :: A :: abbr.

// something what "abbreviate" text

// some FloatList to store the initial points Positions
// some FloatList to store the updated points Positions
FloatList posX = new FloatList();      // FloatList to hold X positions when the value is not white
FloatList posY = new FloatList();
FloatList pointsXScaled = new FloatList();
FloatList pointsYScaled = new FloatList();    // probs wont use this


float difference;

float scaleFactor;

// mouse position ( recorded at click )
float mouseXPos;

// in going image
PImage input;

// colors
color pink = color( 255, 28, 126, 10 );

void setup() {

  // size & background
  size( 400, 400 );
  background( pink );


  // set positions
  // get positions from image
  // import image
  loadImageData();
  // transfer x,y points to PGraphic ( will this be a class ? ? ? - the points not the graphic )
  // set up PGraphic prior

  setPointsPositions();

  // draw the image
  drawInputImageAtPoints();
}


void draw() {

  background( pink );
  if ( mousePressed ) {

    pointsXScaled.clear();

    mouseXPos = mouseX;

    // mouse cirlce
    //fill( 0 );
    circle( mouseX, mouseY, 10);

    for ( int i = 0; i < posX.size(); i++ ) {

      difference = mouseXPos - posX.get( i );

      // scale factor will need to be updated when the dot makes each new position
      scaleFactor = abs( difference ) * ( 0.0001 ); //+ mouseHeld );
      float newX = posX.get( i ) + difference * scaleFactor;

      //scaledPoint = points.get( i ) * difference ;

      pointsXScaled.append( newX );
      posX.set( i, newX );

      strokeWeight(.01);
      stroke( 0, 60 );
      fill( pointsXScaled.get( i ), posY.get( i ), 0, 60 );
      circle( pointsXScaled.get(i), posY.get( i ), 1 );
    }
  }
}

void loadImageData() {
  input = loadImage( "abbr_01.png" );
  input.resize( 400, 400 );
}

void setPointsPositions() {

  // process image for x,y points
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
}

void drawInputImageAtPoints() {

  for ( int i = 0; i < posX.size(); i ++ ) {

    strokeWeight(.01);
    stroke( posX.get( i ), posY.get( i ), 0, 20 );
    circle( posX.get( i ), posY.get( i ), 1 );
  }

  println( posX, posY );
}


void setNewPointsPositions() {

  for ( int i = 0; i < pointsXScaled.size(); i++ ) {

    posX.append(pointsXScaled.get( i ));
    //posY.append(y);
  }
}


void mouseReleased() {

  posX.clear();
  //posY.clear();
  setNewPointsPositions();
}
