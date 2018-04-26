'use strict';

const stream = require('stream');

const keywords = process.argv[2];
const showLength = process.argv[3];

const BLANK = ' ';

function Selector(options = {}) {
  this.keywords = options.keywords;
  this.showLength = options.showLength;
  this.list = options.list;
  this.init();
}

Selector.prototype.init = function() {
  this.format();
};

Selector.prototype.format = function() {
  this.list = this.list.split('\n');
  this.list = this.list.map(item => {
    const arr = item.split(/\s+/g);
    arr.shift();
    arr.shift();
    return arr.join(BLANK);
  });
  this.list.pop();
  this.list = [...new Set(this.list)];
};

Selector.prototype.render = function() {
  const hightlight = `\u001b[31m${this.keywords}\u001b[0m`;
  const result = this.list.filter(item => {
    return !!~item.toLowerCase().indexOf(this.keywords.toLowerCase());
  }).slice(0, this.showLength).map((item, key) => {
    return `${key}  ${item.replace(this.keywords, hightlight)}`;
  });

  if (result.length) {
    console.log('\n');
    console.log(result.join('\n\n'));
    console.log('\n');
  }
};

function HistoryStream(options) {
  stream.Writable.call(this, options);
}

HistoryStream.prototype = Object.create(stream.Writable.prototype, {
  constructor: {
    value: HistoryStream
  }
});

HistoryStream.prototype._write = function(chunk, encoding, callback) {
  const length = parseInt(showLength || 5, 10);
  const s = new Selector({
    keywords,
    showLength: length,
    list: chunk.toString().trim()
  });
  s.render();
  callback();
};

process.stdin.pipe(new HistoryStream());
