function contains(array, element) {
  for (var i = 0; i < array.length; i++) {
    if (array[i][0] == element[0] && array[i][1] == element[1]) {
      return true;
    }
  }
  return false;
}

function uniq(array) {
  var newArray = [ ];
  for (var i = 0; i < array.length; i++) {
    if (!contains(newArray, array[i])) {
      newArray.push(array[i]);
    }
  }
  return newArray;
}

function collect(array, testFunction) {
  var newArray = [ ];
  for (var i = 0; i < array.length; i++) {
    if (testFunction(array[i])) {
      newArray.push(array[i]);
    }
  }
  return newArray;
}

function maxX(pairs) {
  var max = pairs[0][0];
  for (var i = 0; i < pairs.length; i++) {
    if (pairs[i][0] > max)
      max = pairs[i][0];
  }
  return max;
}

function minX(pairs) {
  var min = pairs[0][0];
  for (var i = 0; i < pairs.length; i++) {
    if (pairs[i][0] < min)
      min = pairs[i][0];
  }
  return min;
}

function maxY(pairs) {
  var max = pairs[0][1];
  for (var i = 0; i < pairs.length; i++) {
    if (pairs[i][1] > max)
      max = pairs[i][1];
  }
  return max;
}

function minY(pairs) {
  var min = pairs[0][1];
  for (var i = 0; i < pairs.length; i++) {
    if (pairs[i][1] < min)
      min = pairs[i][1];
  }
  return min;
}

function offset(pairs, delta) {
  var dx = delta[0];
  var dy = delta[1];
  var newArray = [ ];

  for (var i = 0; i < pairs.length; i++) {
    newArray.push([pairs[i][0]+dx, pairs[i][1]+dy]);
  }
  return newArray;
}

var NEIGHBOR_OFFSET = [[-1,1], [0,1], [1,1],
                       [-1,0],        [1,0],
                       [-1,-1],[0,-1],[1,-1]];

var GLIDER = [[0,1],[1,1],[2,1],[2,2],[1,3]];

function Board(seed, trail) {
  if (!seed) {
    throw new Error;
  }
  this.board = uniq(seed);
  this.trail = uniq(trail.concat(seed));
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
    return collect(this.board, function(element) {
      return element[0] === number;
    });
  },

  row: function(number) {
    return collect(this.board, function(element) {
      return element[1] === number;
    });
  },

  nextGeneration: function() {
    var nextBoard = [ ];
    var releventCells = [ ];


  }
};


