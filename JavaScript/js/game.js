function play() {
  var board = new Board(glider, []);
  board.printGrid();
  for (var i = 1; i <= 20; i++) {
    console.log('====================');
    console.log('Generation: ' + i);
    board = board.nextGeneration();
    board.printGrid();
  }
}
