import 'dart:async';
import 'dart:io';
import 'dart:math';



void syncExample(){
  print("start of syncExample() method");
  print("calling longTask()");
  double randomDouble = longTask();
  print("longTask returned: " + randomDouble.toString());
  print("end of syncExample() method");
}

double longTask() {
  sleep(Duration(seconds:5));

  final random = Random();
  return random.nextDouble();
}



void futureExample(){
  print("start of futureExample()");
  print("calling futrerLongTask()");
  Future<double> randomDoubleVal = futureLongTask();
  randomDoubleVal.then((value) =>  print("futerLongTask returned: " + value.toString()));
  print("end of futureExample() method");

}

Future<double> futureLongTask() {
  sleep(Duration(seconds:5));

  final random = Random();
  double randomDouble = random.nextDouble();

  return Future<double>.value(randomDouble);
}





void futureWithErrorExample(){
  print("start of futureWithErrorExample() method");
  print("calling futureWithErrorLongTask()");
  Future<double> randomDoubleVal = futureWithErrorLongTask();
  randomDoubleVal
      .then((value) =>  print("futerLongTask returned: " + value.toString()))
      .catchError((e) => print("futureLongTask returned an error: " + e.toString()));
  print("end of futureWithErrorExample() method");

}

Future<double> futureWithErrorLongTask() {
  sleep(Duration(seconds:1));

  final random = Random();
  double randomDouble = random.nextDouble();

  if(randomDouble < 0.5)
    return Future.error(Exception("The random number was less than 0.5"));

  return Future<double>.value(randomDouble);
}




void futureChainedExample(){
  print("start of futureChainedExample() method");
  print("calling futureWithErrorLongTask() and then futureLongMultiply()... ");
  Future<double> randomDoubleVal = futureWithErrorLongTask();
  randomDoubleVal
      .then((value) =>  futureLongMultiply(value))
      .then((value) => print("futerLongTask returned " + value.toString()))
      .catchError((e) => print("Returned an error: " + e.toString()));
  print("end of futureChainedExample() method");

}


Future<double> futureLongMultiply(double inValue) {

  print("start futureLongMultiply()");
  sleep(Duration(seconds:1));

  double outValue = inValue * 2;
  print("leaving futureLongMultiply()");
  return Future<double>.value(outValue);
}



/*
Rather than chain, you can put a whole bunch of long methods/tasks in a wait list, continue when all return...

Future.<int> a = methodA();
Future.<int> b = methodB();

Future.wait<int>([a, b])
    .then(....)
    .catchError(...);
*/


void syncInClassExample(){

  int result = methodAInClassExample() * methodBInClassExample() * methodCInClassExample();
  print("result: " + result.toString());

}

int methodAInClassExample() {
  sleep(Duration(seconds:1));
  return 40;
}

int methodBInClassExample() {
  sleep(Duration(seconds:1));
  return 45;
}

int methodCInClassExample() {
  sleep(Duration(seconds:1));
  return 50;
}






Future<int> futureAInClassExample(){
  sleep(Duration(seconds:1));
  return Future<int>.value(40);
}

Future<int> futureBInClassExample(){
  sleep(Duration(seconds:1));
  return Future<int>.value(45);
}

Future<int> futureCInClassExample(){
  sleep(Duration(seconds:1));
  return Future<int>.value(50);
}

void futureInClassExample(){

  Future<int> futureA = futureAInClassExample();
  Future<int> futureB = futureBInClassExample();
  Future<int> futureC = futureCInClassExample();


  Future.wait<int>([futureA, futureB, futureC])
      .then((data) => print("result: " + (data[0] * data[1] * data[2]).toString()));

}


