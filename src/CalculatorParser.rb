#!/usr/bin/env ruby
#
# Calculator.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Calculator.g
# Generated at: 2016-11-30 16:19:52
#

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!

Failed to load the ANTLR3 runtime library (version 1.10.0):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:

  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin

  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'

rescue LoadError

  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end

  # 3: try to activate the antlr3 gem
  begin
    defined?( gem ) and gem( 'antlr3', '~> 1.10.0' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end

  require 'antlr3'

end
# <~~~ end load path setup

module Calculator
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :ADD => 4, :INTEGER => 5, :SUB => 6, :WS => 7 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ADD", "INTEGER", "SUB", "WS" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = Calculator

    RULE_METHODS = [ :expression ].freeze

    include TokenData

    begin
      generated_using( "Calculator.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    #
    # parser rule expression
    #
    # (in Calculator.g)
    # 7:1: expression returns [value] : (a= INTEGER ADD b= INTEGER |a= INTEGER SUB b= INTEGER );
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      value = nil


      a = nil
      b = nil


      begin
      # at line 8:3: (a= INTEGER ADD b= INTEGER |a= INTEGER SUB b= INTEGER )
      alt_1 = 2
      look_1_0 = @input.peek( 1 )

      if ( look_1_0 == INTEGER )
        look_1_1 = @input.peek( 2 )

        if ( look_1_1 == ADD )
          alt_1 = 1
        elsif ( look_1_1 == SUB )
          alt_1 = 2
        else
          raise NoViableAlternative( "", 1, 1 )

        end
      else
        raise NoViableAlternative( "", 1, 0 )

      end
      case alt_1
      when 1
        # at line 8:5: a= INTEGER ADD b= INTEGER
        a = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_expression_31 )
        match( ADD, TOKENS_FOLLOWING_ADD_IN_expression_33 )
        b = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_expression_37 )

        # --> action
         value = a.text.to_i + b.text.to_i 
        # <-- action


      when 2
        # at line 9:5: a= INTEGER SUB b= INTEGER
        a = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_expression_47 )
        match( SUB, TOKENS_FOLLOWING_SUB_IN_expression_49 )
        b = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_expression_53 )

        # --> action
         value = a.text.to_i - b.text.to_i 
        # <-- action


      end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )


      end

      return value
    end



    TOKENS_FOLLOWING_INTEGER_IN_expression_31 = Set[ 4 ]
    TOKENS_FOLLOWING_ADD_IN_expression_33 = Set[ 5 ]
    TOKENS_FOLLOWING_INTEGER_IN_expression_37 = Set[ 1 ]
    TOKENS_FOLLOWING_INTEGER_IN_expression_47 = Set[ 6 ]
    TOKENS_FOLLOWING_SUB_IN_expression_49 = Set[ 5 ]
    TOKENS_FOLLOWING_INTEGER_IN_expression_53 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
