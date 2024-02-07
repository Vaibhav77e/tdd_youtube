import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_youtube/counter.dart';

void main(){

  //pretest
  // setUp((){});
  // setUpAll((){});
  // setUp -> it is called before every test
  // setUpAll -> it is called before all tests

  // setup -> test -> setup -> test ->setup -> test.
  // setupall -> test -> test -> test.

  late Counter counter;

  setUp(() {
    counter =  Counter();
  });

  // given when then


  group('Counter Class - ', () { 
    test('given counter class when it is initialized then value of count is 0',(){
    //Arrange
    // Act
    final val = counter.count;
    // Assert
    expect(val,0);
  });

      test('given counter class when it is initialized then value of count is 1',(){
    //Arrange
    // Act
    counter.increment();
    final val = counter.count;
    // Assert
    expect(val,1);
  });

    test('given counter class when it is initialized then value of count is -1',(){
    //Arrange
    // Act
    counter.decrement();
    final val = counter.count;
    // Assert
    expect(val,-1);
  });
  });

  test('given counter class when it is initialized then value of count is resetted to 0' , () {
    //act
    counter.reset();
    final val = counter.count;
    expect(val,0);
  });


  //post test
  // tearDown(() => null);
  // tearDownAll(() => null);

  // test -> tearDown -> test ->tearDown -> test -> tearDown
  // test -> test -> test -> tearDownAll

}