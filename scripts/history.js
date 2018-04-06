'use strict';

const stream = require('stream');

const keywords = process.argv.slice(2);

function Selector(options = {}) {
  this.keywords = options.keywords;
  this.list = options.list;
  this.init();
}

Selector.prototype.init = function() {
  this.format();
};

Selector.prototype.format = function() {
  const BLANK = ' ';
  this.list = this.list.split('\n');
  this.list = this.list.map(item => {
    const arr = item.split(/\s+/g);
    arr.shift();
    arr.shift();
    return arr.join(BLANK);
  });
  this.list = [...new Set(this.list)];
  this.keywords = this.keywords.join(BLANK);
};

Selector.prototype.render = function() {
  const hightlight = `\u001b[31m${this.keywords}\u001b[0m`;
  const result = this.list.filter(item => {
    return !!~item.indexOf(this.keywords);
  }).slice(0, 5).map((item, key) => {
    return `${key}  ${item.replace(this.keywords, hightlight)}`;
  });
  console.log('\n');
  console.log(result.join('\n\n'));
  console.log('\n');
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
  const s = new Selector({
    keywords,
    list: chunk.toString().trim()
  });
  s.render();
  callback();
};

process.stdin.pipe(new HistoryStream());
