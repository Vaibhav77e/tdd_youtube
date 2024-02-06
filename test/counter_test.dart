import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_youtube/counter.dart';

void main(){
  // given when then


  group('Counter Class - ', () { 
    test('given counter class when it is initialized then value of count is 0',(){
    //Arrange
      Counter counter = Counter();
    // Act
    final val = counter.count;
    // Assert
    expect(val,0);
  });

      test('given counter class when it is initialized then value of count is 1',(){
    //Arrange
      Counter counter = Counter();
    // Act
    counter.increment();
    final val = counter.count;
    // Assert
    expect(val,1);
  });

    test('given counter class when it is initialized then value of count is -1',(){
    //Arrange
      Counter counter = Counter();
    // Act
    counter.decrement();
    final val = counter.count;
    // Assert
    expect(val,-1);
  });
  });

}