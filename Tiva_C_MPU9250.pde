import processing.serial.*;

Serial SerialPort;
float pitch, roll;
float position;

void setup(){ //<>//
  size(400, 400, P3D);
  
  position = width/2;
  
  SerialPort = new Serial(this, "COM3", 115200);
  SerialPort.bufferUntil('\n');
}

void tilt(){
  translate(position, position, position);
   rotateX(radians(roll + 90));
   rotateY(radians(pitch));
   
   fill(#79BF3D);
   ellipse(0, 0, width/4, width/4);
   fill(#20542E);
}

void draw(){
  background(#20542E);
  fill(#79BF3D);
  tilt();
}

void serialEvent(Serial SerialPort){
  String data = SerialPort.readStringUntil('\n');
  println(data);
  
  if(data != null){
    data = trim(data);
    
    String tokens[] = split(data, ' ');
    if(tokens.length > 1){
      pitch = float(tokens[0]);
      roll = float(tokens[1]);
      println(pitch);
      println(roll);
    }
  }
}