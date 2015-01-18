var sass = require('node-sass'),
    jsdiff = require('diff'),
    fs = require('fs-extra'),
    glob = require('glob');

glob('./tests/**/*.scss', function (err, files) {
  if (err) throw err;

  console.log(files);

  files.forEach(function (file) {
    if (file.charAt(0) !== '_') {
      sass.render({
        file: file,
        outputStyle: 'nested',
        includePaths: [
          '../stylesheets/',
          '../vendor/ruby/2.0.0/gems/sassy-maps-0.4.0/sass/',
          '../vendor/ruby/2.0.0/gems/breakpoint-2.5.0/stylesheets/'
        ],
        success: function(result) {
          // console.log(result.css);
          fs.readFile('./controls/' + file.slice(8, -4) + 'css', function (ctrlErr, ctrlFile) {
            if (ctrlFile) {
              var results = result.css,
                  diff;

              // Libsass reverses quotes.
              // results = results.replace(/'/g, '!single\!');
              // results = results.replace(/"/g, '\'');
              // results = results.replace(/\!single\!/g, '"');
              // results += '\n';

              diff = jsdiff.createPatch(file + '.patch', ctrlFile.toString(), results);

              // console.log(diff);
              // console.log(Object.keys(diff));
              fs.outputFile('./diff/' + file.slice(8, -4) + 'css.diff', diff, function (writeErr, writeFile) {
                if (writeErr) throw writeErr;
              });
              // console.log(diff);
              // console.log(ctrlFile.toString() === result.css);
              // diff.diffLines(ctrlFile.toString(), result.css, function (fileDiff) {
                // console.log(fileDiff);
                // console.log(cssDiff);
                // fs.writeFile('./diff/' + file.slice(0, -4) + 'css.diff', cssDiff);
              // });
            }
          });
        },
        error: function (error) {
          throw error.message;
        }
      });
    }
  })
});