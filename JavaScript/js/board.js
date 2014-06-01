function Board(seed, trail) {
  if (!seed) {
    throw new Error;
  }
  this.board = uniq(seed);
  this.trail = uniq(mergeWithoutFlatten(trail, seed));
  this.xMax = maxX(this.trail);
  this.xMin = minX(this.trail);
  this.yMax = maxY(this.trail);
  this.yMin = minY(this.trail);
}

Board.prototype = {
  board: [ ],
  trail: [ ],

  printGrid: function() {
    for (var j = this.yMax; j >= this.yMin; j--) {
      var row = '';
      for (var i = this.xMin; i <= this.xMax; i++) {
        row += (contains(this.board, [i, j]) ? '# ' : '+ ');
      }
      console.log(row + '\n');
    }
  },

  width: function() {
    return this.xMax - this.xMin + 1;
  },

  height: function() {
    return this.yMax - this.yMin + 1;
  },

  size: function() {
    return this.width() * this.height();
  },

  live: function() {
    return this.board.length;
  },

  column: function(number) {
    return this.board.filter(function(element) {
      return element[0] === number;
    });
  },

  row: function(number) {
    return this.board.filter(function(element) {
      return element[1] === number;
    });
  },

  includes: function(pair) {
    return contains(this.board, pair);
  },

  nextGeneration: function() {
    var nextBoard = [ ];
    var relevantCells = [ ];
    var countHash = [ ];

    for (var i = 0; i < this.board.length; i++) {
      var pair = this.board[i];
      relevantCells =  mergeWithoutFlatten(relevantCells, offset(neighborOffset, pair));
    }

    var element = relevantCells.pop();
    while (element) {
      var number = 1;
      number += count(relevantCells, element);
      relevantCells = deleteIf(relevantCells, element, coordinateEquality);
      countHash.push([element, number]);
      element = relevantCells.pop();
    }

    for (var i = 0; i < countHash.length; i++) {
      var key = countHash[i][0];
      var value = countHash[i][1];
      if (value === 3 || (value === 2 && containsCoordinate(this.board, key)))
        nextBoard.push(key);
    }

    return new Board(nextBoard, this.trail);
  }
};


