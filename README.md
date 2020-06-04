# Next::Test

This displays ruby-next being broken with jruby projects being bundled into a war/jar.

I originally saw this issue on a Rails project, and it failed on a different method within `tracing.rb`.

This might not be a perfect replica but it does show ruby-next working without the jar file and failing with.

## Reproduce:

Simply run `./reproduce.sh` or follow these steps:

```shell
$ gem install bundler warbler
$ bundle install
$ export TEST_USERNAME=testing-testable-ruby-next
$ bundle exec exe/next-test
$ warble runnable jar
$ java -jar ruby-next-jruby-jar-test.jar
```

## Output

> _Note: JDK 14.0.1, Warnings about reflective access redacted_

```
$ bundle exec exe/next-test
Config Value: testing-testable-ruby-next

$ java -jar ruby-next-jruby-jar-test.jar
Traspiled files are missing in: uri:classloader:/gems/anyway_config-2.0.5/lib/.rbnext.
Make sure you have gem 'ruby-next' in your Gemfile to auto-transpile the required files from source on load. Otherwise the code from uri:classloader:/gems/anyway_config-2.0.5 may not work correctly.
SyntaxError: uri:classloader:/gems/anyway_config-2.0.5/lib/anyway/tracing.rb:16: syntax error, unexpected '='
        def path_lineno() = "#{path}:#{lineno}"
                          ^
  require at org/jruby/RubyKernel.java:974
  require at uri:classloader:/META-INF/jruby.home/lib/ruby/stdlib/rubygems/core_ext/kernel_require.rb:54
   <main> at uri:classloader:/gems/anyway_config-2.0.5/lib/anyway_config.rb:15
  require at org/jruby/RubyKernel.java:974
  require at uri:classloader:/META-INF/jruby.home/lib/ruby/stdlib/rubygems/core_ext/kernel_require.rb:130
   <main> at uri:classloader:/ruby-next-jruby-jar-test/lib/next/test.rb:2
  require at org/jruby/RubyKernel.java:974
  require at uri:classloader:/META-INF/jruby.home/lib/ruby/stdlib/rubygems/core_ext/kernel_require.rb:54
   <main> at uri:classloader:/ruby-next-jruby-jar-test/exe/next-test:3
     load at org/jruby/RubyKernel.java:1009
   <main> at uri:classloader:/META-INF/main.rb:1
  require at org/jruby/RubyKernel.java:974
  require at uri:classloader:/META-INF/jruby.home/lib/ruby/stdlib/rubygems/core_ext/kernel_require.rb:54
   <main> at <script>:3
ERROR: org.jruby.embed.EvalFailedException: (SyntaxError) uri:classloader:/gems/anyway_config-2.0.5/lib/anyway/tracing.rb:16: syntax error, unexpected '='
        def path_lineno() = "#{path}:#{lineno}"
```
