import 'package:serial_port/serial_port.dart';
import 'dart:convert';

main(){
  var arduino = new SerialPort("/dev/tty.usbmodem1421");
  arduino.open().then((_) {
    print("Ctrl-c to close");
    arduino.onRead.transform(UTF8.decoder).listen(print);
   });
}
