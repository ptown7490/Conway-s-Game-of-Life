describe('mergeWithoutFlatten()', function() {
  it('', function() {
    var arr1 = [1, 2, [1, 2]];
    var arr2 = [1, 3, [4, 5, 6]];
    mergeWithoutFlatten(arr1, arr2).length.should.eq(6);
  });
});
