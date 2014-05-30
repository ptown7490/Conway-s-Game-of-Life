var glider = [[0,1],[1,1],[2,1],[2,2],[1,3]];

var blinker = [[0,0], [0,1], [0,2]];

var loneSurvivor = [[0,0]];

var acorn = [[0,0],[1,0],[1,2],[3,1],[4,0],[5,0],[6,0]];

var smallExploder = [[1,0],[0,1],[2,1],[0,2],[1,2],[2,2],[1,3]];

var gliderGun = [
                 [0,4],[1,4],
                 [0,3],[1,3],

                 [10,2],[10,3],[10,4],
                 [11,5],[12,6],[13,6],
                 [11,1],[12,0],[13,0],

                 [14,3],
                 [15,1], [15,5],
                 [16,2],[16,3],[16,4],
                 [17,3],

                 [20,4],[20,5],[20,6],
                 [21,4],[21,5],[21,6],

                 [22,3],[22,7],
                 [24,2],[24,3],[24,7],[24,8],

                 [34,5],[34,6],
                 [35,5],[35,6]
                ];

var lineOf7 = arrayElementCreation(0, 6, function(i) {
  return [i, 0];
});

var lineOf10 = arrayElementCreation(-4, 5, function(i) {
  return [i, 0];
});

var lineOf450 = arrayElementCreation(-224, 225, function(i) {
  return [i, 0];
});

function shift(seed, /* optional */ xTranslate, yTranslate) {
  xTranslate = xTranslate || 0;
  yTranslate = yTranslate || 0;
  var newSeed = [ ];

  for (var i = 0; i < seed.length; i++) {
    newSeed[i] = [seed[i][0] + xTranslate, seed[i][1] + yTranslate];
  }
  return newSeed;
}
