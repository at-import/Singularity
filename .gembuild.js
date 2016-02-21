'use strict';

var exec = require('child_process').execSync,
    version = require('./package.json').version;

var commands = [
  'gem build singularitygs.gemspec',
  `gem push singularitygs-${version}.gem`,
  `rm singularitygs-${version}.gem`
];

commands.forEach(command => {
  try {
    exec(command);
  }
  catch (e) {
    console.error(e.message);
    process.exit(1);
  }
});

process.exit();
