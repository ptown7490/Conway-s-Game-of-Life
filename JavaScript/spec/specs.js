
describe('Board', function() {
  it('allocates a grid on the Cartesian plane.', function() {
    var testBoard = new Board([[0,0]], []);
    Board.prototype.isPrototypeOf(testBoard).should.eq(true);
  });

  it('has a display size defined by extrema.', function() {
    var testBoard = new Board([[0,0]], [[1,1]]);
    testBoard.size().should.eq(4);
  });

  it('requires a seed argument for initialization', function() {
    var fn = function() {
      var testBoard = new Board();
    };
    fn.should.throw(Error);
  });

  it('accepts \'seed\' for live cells as parameter during creation.', function() {
    var testBoard = new Board(
                          [[1,2],
                           [-3,5],
                           [4,-9]], []);
    testBoard.live().should.eq(3);
  });

  describe('.column(number)', function() {
    it('returns array of all live cells with corresponding x-coordinate.', function() {
      var testBoard = new Board([[0,1],[2,5],[0,-2]], []);
      testBoard.column(0).length.should.eq(2);
    });
  });

  describe('.row(number)', function() {
    it('returns array of all cells with corresponding y-coordinate', function() {
      var testBoard = new Board([[1,0],[2,5],[-2,0]], []);
      testBoard.row(0).length.should.eq(2);
    });
  });

  describe('.nextGeneration()', function() {
    it('', function() {
      var testBoard = new Board(glider, []);
      testBoard.nextGeneration().live().should.eq(glider.length);
    });
  });
});

