import 'package:serial_port/serial_port.dart';
import 'dart:async';
import 'dart:convert';

var arduino;

main(){
  var buffer = new StringBuffer();
  arduino = new SerialPort("/dev/tty.usbmodem1421");
  arduino.onRead.transform(UTF8.decoder).listen((word){
    buffer.write(word);
    if(buffer.toString().startsWith("pong")){
      print(buffer.toString());
      buffer.clear();
      sendPing();
    }
  });
  arduino.open().then((_) {
    print("Ctrl-c to close");
    new Timer(new Duration(seconds: 2), sendPing);

  });
}


void sendPing(){

  print("ping");
  arduino.writeString("ping");
}
