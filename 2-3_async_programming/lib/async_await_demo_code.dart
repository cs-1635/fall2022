import 'futures_demo_code.dart' as futures_demo_code;

void asyncExample() async{

  print("start of asyncExample()");
  print('about to await futureLongTask()');

  double result = await futures_demo_code.futureLongTask();
  print('asyncExample | futureLongTask() returned: ' + result.toString());

  print('end of asyncExample()');

}



void asyncChainedExample() async{

  print("start of asyncChainedExample()");


  print("calling futureWithErrorLongTask() and then futureLongMultiply()... ");
  try {
    double firstResult = await futures_demo_code.futureWithErrorLongTask();
    double secondResult = await futures_demo_code.futureLongMultiply(firstResult);

    print("asyncChainedExample result in try block: " + secondResult.toString());
  }

  catch (e) {
    print(e.toString());
  }

    print('end of asyncChainedExample()');

}


// asyncInClassExample -- convert future example to now async

