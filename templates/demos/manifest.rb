description "Singularity Demos"

discover :stylesheets
file 'isolation.html.erb', :to => 'isolation.html', :erb => true
file 'float.html.erb', :to => 'float.html', :erb => true

help %Q{
  For help with Singularity, please ask a question on Stack Overflow (http://stackoverflow.com/questions/ask) tagged with "singularitygs".

  To file an issue with Singularity, please use our GitHub Issue Queue (https://github.com/Team-Sass/Singularity/issues).
}

welcome_message %Q{
  Welcome to the Singularity Demo!

  These two sites, with their accompanying Sass, should give you a working example as to how Singularity works with its two out-of-the-box output styles.
}