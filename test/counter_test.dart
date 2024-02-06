import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_youtube/counter.dart';

void main(){
  // given when then
  test('given counter class when it is initialized then value of count is 0',(){
    //Arrange
    Counter counter = Counter();
    // Act
    final val = counter.count;
    // Assert
    expect(val,0);
  });
}