float mouseXPos;

float minDif, maxDif, difference;

float scaleFactor;
float scaleFMin, scaleFMax;

FloatList points = new FloatList();
FloatList pointsScaled = new FloatList();

float scaledPoint;

int mouseCount;
float mouseHeld;

void setup() {

  size( 400, 400 );

  setPointsPositions();
  println( points );
}

void draw() {

  if ( mousePressed ) {
    
    pointsScaled.clear();

    mouseXPos = mouseX;

    // mouse cirlce
    fill( 0 );
    circle( mouseX, mouseY, 10);

    for ( int i = 0; i < points.size(); i++ ) {

      difference = mouseXPos - points.get( i );


      // scale factor will need to be updated when the dot makes each new position 
      scaleFactor = abs( difference ) * ( 0.0001 + mouseHeld );
      float newX = points.get( i ) + difference * scaleFactor;

      //scaledPoint = points.get( i ) * difference ;

      pointsScaled.append( newX );
      points.set( i, newX );

      fill( points.get( i ), - 50 + points.get( i ), 0 );
      circle( pointsScaled.get(i), ( mouseY ), 6 );
    }
  }
}

void setPointsPositions() {

  
  for ( int i = 0; i < 13; i ++ ) {
    float point = map( random( width ), 0, width, 10, width - 10 );
    println( point );
    points.append( point );
    fill( 255, 28 + ( mouseCount * 20 ), 126 - ( mouseCount * 20 ));
    circle( points.get(i), ( mouseCount * 4 ) + ( height/2 ) , 6 );
  }
  println( mouseCount, points );

}
void mouseReleased() {

  points.clear();
  setPointsPositions();
  
}

void mousePressed() {

  pointsScaled.clear();
  mouseCount++;
  mouseXPos = mouseX;

  // mouse cirlce
  fill( 0 );
  circle( mouseX, mouseY, 10);

  // min & max Point logs
  /*
  float minPoint = points.min();
   float maxPoint = points.max();
   println( minPoint, maxPoint );
   minDif = mouseXPos - minPoint;
   
   println( mouseXPos, "minDif : " + minDif );
   maxDif = maxPoint - mouseXPos;
   println( mouseXPos, "maxDif : " + maxDif );
   
   scaleFMin = minDif * 0.1;
   scaleFMax = maxDif * 0.1;
   
   println( " scale factor min : " +  scaleFMin, " scale factor max : " + scaleFMax );
   

  for ( int i = 0; i < points.size(); i++ ) {

    //if ( points.get( i ) < mouseXPos ) {

    //difference = points.get( i ) - mouseXPos;

    println(" difference at " +  i + " point :  " + points.get( i ) + " : " + difference );
    //} else {

    difference = mouseXPos - points.get( i );

    //  println(" difference at " +  i + " point :  " + points.get( i ) + " : " + difference );
    //}

    // all negative numbers

    scaleFactor = abs( difference ) * ( 0.0001 + mouseHeld );
    float newX = points.get( i ) + difference * scaleFactor;

    //scaledPoint = points.get( i ) * difference ;

    pointsScaled.append( newX );

    fill( points.get( i ), - 50 + points.get( i ), 0 );
    circle( pointsScaled.get(i), ( mouseY ) + ( mouseCount * 5), 6 );
  }

  println( pointsScaled );
  */
}
