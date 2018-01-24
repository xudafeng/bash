'use strict';

const stream = require('stream');

let color = 'red';

if (process.argv.length > 2) {
  color = process.argv[process.argv.length - 1];
}

const colorWrapper = (string, color) => {
  switch (color) {
    case 'red':
      return `\u001b[31m${string}\u001b[0m`;
    case 'yellow':
      return `\u001b[33m${string}\u001b[0m`;
    case 'green':
      return `\u001b[32m${string}\u001b[0m`;
    case 'purple':
      return `\u001b[34m${string}\u001b[0m`;
    case 'pink':
      return `\u001b[35m${string}\u001b[0m`;
    case 'cyan':
      return `\u001b[36m${string}\u001b[0m`;
    case 'blue':
      return `\u001b[37m${string}\u001b[0m`;
    default:
      return `\u001b[37m${string}\u001b[0m`;
  }
};

function ColorStream(options) {
  stream.Writable.call(this, options);
}

ColorStream.prototype = Object.create(stream.Writable.prototype, {
  constructor: {
    value: ColorStream
  }
});

ColorStream.prototype._write = function(chunk, encoding, callback) {
  process.stdout.write(colorWrapper(chunk.toString().trim(), color));
  callback();
};

process.stdin.pipe(new ColorStream());
