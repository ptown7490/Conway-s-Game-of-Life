function coordinateEquality(coord_1, coord_2) {
  return (coord_1[0] == coord_2[0] && coord_1[1] == coord_2[1]);
}

function contains(array, element) {
  for (var i = 0; i < array.length; i++) {
    if (coordinateEquality(array[i], element)) {
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

function count(array, element) {
  var number = 0;
  for (var i = 0; i < array.length; i++) {
    if (coordinateEquality(array[i], element))
      number++;
  }
  return number;
}

function arrayElementCreation(start, end, func) {
  var length = end - start + 1;
  var newArray = new Array(length);

  for (var i = 0, j = start; i < length; i++, j++)
    newArray[i] = func(j);

  return newArray;
}

function deleteIf(array, element, func) {
  var newArray = [ ]
  for (var i = 0; i < array.length; i++) {
    if (func(array[i], element))
      continue;
    newArray.push(array[i]);
  }
  return newArray;
}

function mergeWithoutFlatten(array_1, array_2) {
  var newArray = new Object(array_1);

  for (var i = 0; i < array_2.length; i++)
    newArray.push(array_2[i]);

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

var neighborOffset = [[-1,1], [0,1], [1,1],
                       [-1,0],        [1,0],
                       [-1,-1],[0,-1],[1,-1]];

