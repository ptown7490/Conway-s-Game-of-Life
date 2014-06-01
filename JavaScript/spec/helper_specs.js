describe('mergeWithoutFlatten(array_1, array_2)', function() {
  it('combines all elements from two arrays into one.', function() {
    var arr1 = [1, 2, [1, 2]];
    var arr2 = [1, 3, [4, 5, 6]];
    mergeWithoutFlatten(arr1, arr2).length.should.eq(6);
  });
});

describe('coordinateEquality(coordinate_1, coordinate_2)', function() {
  it('checks whether two coordinates (2-element arrays) have the same x- and y-values.', function() {
    var coord_1 = [1, -1];
    var coord_2 = [1, -1];
    coordinateEquality(coord_1, coord_2).should.eq(true);
  });
});

describe('arrayElementCreation(start, end, func)', function() {
  it('', function() {
    
  });
});
