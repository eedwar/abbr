

// 2022. E.Edwards.
// a2z :: A :: abbr.

// something what "abbreviate" text

// some FloatList to store the initial points Positions
// some FloatList to store the updated points Positions
FloatList initalPosX = new FloatList();      // FloatList to hold X positions when the value is not white
FloatList initalPosY = new FloatList();
FloatList posX = new FloatList();      // FloatList to hold X positions when the value is not white
FloatList posY = new FloatList();
FloatList pinkPosX = new FloatList();
FloatList pinkPosY = new FloatList();


FloatList pointsXScaled = new FloatList();
FloatList pinkPointsXScaled = new FloatList();


float difference;

float scaleFactor;

// mouse
float mouseXPos; // position ( recorded at click )
int mouseClickCount = 0;

// in going image
PImage input;

// colors
color pink = color( 255, 28, 126 );
color black = color( 0 );
color white = color( 255 );

void setup() {

  // size & background
  size( 600, 600 );
  background( pink );

  // set positions, get positions from image, import image
  loadImageData();
  setInitalPointsPositions();

  // draw the image
  drawInputImageAtPoints();

  instructions();
}

void draw() {

  //background( pink, 10  );

  isMousePressed();
  drawCoverLines();

  //addOverlay();
}

void loadImageData() {

  input = loadImage( "abbr_01.png" );
  input.resize( width, height );
  
}

void instructions() {
  
  textAlign( CENTER );
  
  text( " press 's' to save out frame ", width * .85, height * .04 );
  text( " mouse press & hold along here ", width * .5, height  * .74 );
  
  
  strokeWeight( 6 );
  for ( int i = 0; i <= 10; i++ ) {
    int gap = i * 48;
    line( 60 + gap, height  * .76, 60 + gap, height  * .78 );
  }

  line( 60, height  * .77, width - 60, height  * .77 );
  
}

void setInitalPointsPositions() {

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
        initalPosX.append(x);
        initalPosY.append(y);
      }
    }
  }
}

void setPointsPositions() {

  // process image for x,y points
  // for all the pixels in the input image
  for (int x = 0; x < input.width - 1; x++) {
    for (int y = 0; y < input.height - 1; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y * input.width;

      // Get the R value from image
      float pix, edge;
      pix = red( input.pixels[ loc ] );
      edge = red( input.pixels[ loc + 1 ] );

      // if the pixel colour in the input image is not white & the pixel next door is
      if ( pix < 255 && edge >= 255 ) {
        if ( y % 8 == 0 ) {
          // add x & y value to the FloatLists
          pinkPosX.append(x);
          pinkPosY.append(y);
        } else {

          posX.append(x);
          posY.append(y);
        }
      }
    }
  }
}

void drawInputImageAtPoints() {

  for ( int i = 0; i < initalPosX.size(); i ++ ) {

    strokeWeight(.1);
    //stroke( initalPosX.get( i ), initalPosY.get( i ), 0, 20 );
    stroke( 255 );
    fill( 255 );
    circle( initalPosX.get( i ), initalPosY.get( i ), 2 );
  }
}


void drawImageAtPoints() {

  for ( int i = 0; i < posX.size(); i ++ ) {

    strokeWeight(.1);
    stroke( 255 );
    fill( 255 );
    circle( posX.get( i ), posY.get( i ), 2 );
  }
}

void setNewPointsPositions() {

  // this should be two functions // could be same one with variables
  for ( int i = 0; i < pointsXScaled.size(); i++ ) {

    posX.append( pointsXScaled.get( i ) );
  }
  for ( int i = 0; i < pinkPointsXScaled.size(); i++ ) {

    pinkPosX.append( pinkPointsXScaled.get( i ));
  }
}


void isMousePressed() {
  if ( mousePressed ) {

    pointsXScaled.clear();
    pinkPointsXScaled.clear();

    mouseXPos = mouseX;

    // mouse cirlce
    strokeWeight( 2 );
    stroke( black );
    fill( pink );
    circle( mouseX, mouseY, 10);
    drawUpdatedImage();
  }
}

void drawUpdatedImage() {

  for ( int i = 0; i < posX.size(); i++ ) {

    difference = mouseXPos - posX.get( i );

    // scale factor will need to be updated when the dot makes each new position
    scaleFactor = abs( difference ) * ( 0.0001 );
    float newX = posX.get( i ) + difference * scaleFactor;

    pointsXScaled.append( newX );
    posX.set( i, newX );

    noStroke();

    if ( mouseClickCount % 2 == 0 ) {
      fill( black, 20 );
    } else {
      fill( pink, 60 );
    }

    circle( pointsXScaled.get( i ), posY.get( i ), 2 );
  }
}

void drawCoverLines() {
  // almost a repeat, should be a functon
  for ( int i = 0; i < pinkPosX.size(); i++ ) {

    difference = mouseXPos - pinkPosX.get( i );

    // scale factor will need to be updated when the dot makes each new position
    scaleFactor = abs( difference ) * ( 0.0001 );
    float newPinkX = pinkPosX.get( i ) + difference * scaleFactor;

    pinkPointsXScaled.append( newPinkX );
    pinkPosX.set( i, newPinkX );

    //strokeWeight(2);
    noStroke();

    if ( mouseClickCount % 2 == 0 ) {
      fill( pink, 40 );
    } else {
      fill( white, 20 );
    }

    circle( pinkPointsXScaled.get( i ), pinkPosY.get( i ), 2 );
  }
}


void addOverlay() {

  fill( pink, 1 );
  rect( 0, 0, width, height );
}

void mousePressed() {

  mouseClickCount++;

  println( mouseClickCount );

  // function for clearing stuff here
  posX.clear();
  posY.clear();
  pinkPosX.clear();
  pinkPosY.clear();

  setPointsPositions();
}


void mouseReleased() {

  posX.clear();
  pinkPosX.clear();

  setNewPointsPositions();
}

void keyPressed() {

  if ( key == 's' ) {

    saveFrame("abbr-######.png");
    println( " frame saved " );
  }
}
