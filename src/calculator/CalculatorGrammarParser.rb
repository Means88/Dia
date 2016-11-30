#!/usr/bin/env ruby
#
# CalculatorGrammar.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: CalculatorGrammar.g
# Generated at: 2016-11-30 20:47:16
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

module CalculatorGrammar
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :ADD => 4, :DECIMAL => 5, :DIV => 6, :INTEGER => 7, 
                   :LPARENT => 8, :MUL => 9, :RPARENT => 10, :SUB => 11, 
                   :WS => 12 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ADD", "DECIMAL", "DIV", "INTEGER", "LPARENT", "MUL", 
                    "RPARENT", "SUB", "WS" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = CalculatorGrammar

    RULE_METHODS = [ :evaluate, :expression, :mul, :single, :atom ].freeze

    include TokenData

    begin
      generated_using( "CalculatorGrammar.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    #
    # parser rule evaluate
    #
    # (in CalculatorGrammar.g)
    # 7:1: evaluate returns [value] : a= expression EOF ;
    #
    def evaluate
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      value = nil


      a = nil


      begin
      # at line 7:26: a= expression EOF
      @state.following.push( TOKENS_FOLLOWING_expression_IN_evaluate_28 )
      a = expression
      @state.following.pop
      match( EOF, TOKENS_FOLLOWING_EOF_IN_evaluate_30 )

      # --> action
       value = a 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )


      end

      return value
    end



    #
    # parser rule expression
    #
    # (in CalculatorGrammar.g)
    # 9:1: expression returns [value] : a= mul ( ADD b= mul | SUB b= mul )* ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      value = nil


      a = nil
      b = nil


      begin
      # at line 9:28: a= mul ( ADD b= mul | SUB b= mul )*
      @state.following.push( TOKENS_FOLLOWING_mul_IN_expression_44 )
      a = mul
      @state.following.pop
      # at line 9:33: ( ADD b= mul | SUB b= mul )*
      while true # decision 1
        alt_1 = 3
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == ADD )
          alt_1 = 1
        elsif ( look_1_0 == SUB )
          alt_1 = 2

        end
        case alt_1
        when 1
          # at line 10:5: ADD b= mul
          match( ADD, TOKENS_FOLLOWING_ADD_IN_expression_51 )
          @state.following.push( TOKENS_FOLLOWING_mul_IN_expression_55 )
          b = mul
          @state.following.pop

          # --> action
           a += b 
          # <-- action


        when 2
          # at line 11:5: SUB b= mul
          match( SUB, TOKENS_FOLLOWING_SUB_IN_expression_63 )
          @state.following.push( TOKENS_FOLLOWING_mul_IN_expression_67 )
          b = mul
          @state.following.pop

          # --> action
           a -= b 
          # <-- action


        else
          break # out of loop for decision 1
        end
      end # loop for decision 1


      # --> action
       value = a 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )


      end

      return value
    end



    #
    # parser rule mul
    #
    # (in CalculatorGrammar.g)
    # 14:1: mul returns [value] : a= single ( MUL b= single | DIV b= single )* ;
    #
    def mul
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      value = nil


      a = nil
      b = nil


      begin
      # at line 14:21: a= single ( MUL b= single | DIV b= single )*
      @state.following.push( TOKENS_FOLLOWING_single_IN_mul_88 )
      a = single
      @state.following.pop
      # at line 14:29: ( MUL b= single | DIV b= single )*
      while true # decision 2
        alt_2 = 3
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == MUL )
          alt_2 = 1
        elsif ( look_2_0 == DIV )
          alt_2 = 2

        end
        case alt_2
        when 1
          # at line 15:5: MUL b= single
          match( MUL, TOKENS_FOLLOWING_MUL_IN_mul_95 )
          @state.following.push( TOKENS_FOLLOWING_single_IN_mul_99 )
          b = single
          @state.following.pop

          # --> action
           a *= b 
          # <-- action


        when 2
          # at line 16:5: DIV b= single
          match( DIV, TOKENS_FOLLOWING_DIV_IN_mul_107 )
          @state.following.push( TOKENS_FOLLOWING_single_IN_mul_111 )
          b = single
          @state.following.pop

          # --> action
           a /= b 
          # <-- action


        else
          break # out of loop for decision 2
        end
      end # loop for decision 2


      # --> action
       value = a 
      # <-- action


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )


      end

      return value
    end



    #
    # parser rule single
    #
    # (in CalculatorGrammar.g)
    # 19:1: single returns [value] : ( ( ADD )? a= atom | SUB a= atom );
    #
    def single
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      value = nil


      a = nil


      begin
      # at line 20:3: ( ( ADD )? a= atom | SUB a= atom )
      alt_4 = 2
      look_4_0 = @input.peek( 1 )

      if ( look_4_0.between?( ADD, DECIMAL ) || look_4_0.between?( INTEGER, LPARENT ) )
        alt_4 = 1
      elsif ( look_4_0 == SUB )
        alt_4 = 2
      else
        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        # at line 20:5: ( ADD )? a= atom
        # at line 20:5: ( ADD )?
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == ADD )
          alt_3 = 1
        end
        case alt_3
        when 1
          # at line 20:5: ADD
          match( ADD, TOKENS_FOLLOWING_ADD_IN_single_133 )

        end
        @state.following.push( TOKENS_FOLLOWING_atom_IN_single_138 )
        a = atom
        @state.following.pop

        # --> action
         value = a 
        # <-- action


      when 2
        # at line 21:5: SUB a= atom
        match( SUB, TOKENS_FOLLOWING_SUB_IN_single_146 )
        @state.following.push( TOKENS_FOLLOWING_atom_IN_single_150 )
        a = atom
        @state.following.pop

        # --> action
         value = -a 
        # <-- action


      end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )


      end

      return value
    end



    #
    # parser rule atom
    #
    # (in CalculatorGrammar.g)
    # 23:1: atom returns [value] : (a= INTEGER |a= DECIMAL | LPARENT e= expression RPARENT );
    #
    def atom
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      value = nil


      a = nil
      e = nil


      begin
      # at line 24:3: (a= INTEGER |a= DECIMAL | LPARENT e= expression RPARENT )
      alt_5 = 3
      case look_5 = @input.peek( 1 )
      when INTEGER then alt_5 = 1
      when DECIMAL then alt_5 = 2
      when LPARENT then alt_5 = 3
      else
        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        # at line 24:5: a= INTEGER
        a = match( INTEGER, TOKENS_FOLLOWING_INTEGER_IN_atom_167 )

        # --> action
         value = a.text.to_i 
        # <-- action


      when 2
        # at line 25:5: a= DECIMAL
        a = match( DECIMAL, TOKENS_FOLLOWING_DECIMAL_IN_atom_177 )

        # --> action
         value = a.text.to_f 
        # <-- action


      when 3
        # at line 26:5: LPARENT e= expression RPARENT
        match( LPARENT, TOKENS_FOLLOWING_LPARENT_IN_atom_185 )
        @state.following.push( TOKENS_FOLLOWING_expression_IN_atom_189 )
        e = expression
        @state.following.pop

        # --> action
         value = e 
        # <-- action

        match( RPARENT, TOKENS_FOLLOWING_RPARENT_IN_atom_193 )

      end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )


      end

      return value
    end



    TOKENS_FOLLOWING_expression_IN_evaluate_28 = Set[  ]
    TOKENS_FOLLOWING_EOF_IN_evaluate_30 = Set[ 1 ]
    TOKENS_FOLLOWING_mul_IN_expression_44 = Set[ 1, 4, 11 ]
    TOKENS_FOLLOWING_ADD_IN_expression_51 = Set[ 4, 5, 7, 8, 11 ]
    TOKENS_FOLLOWING_mul_IN_expression_55 = Set[ 1, 4, 11 ]
    TOKENS_FOLLOWING_SUB_IN_expression_63 = Set[ 4, 5, 7, 8, 11 ]
    TOKENS_FOLLOWING_mul_IN_expression_67 = Set[ 1, 4, 11 ]
    TOKENS_FOLLOWING_single_IN_mul_88 = Set[ 1, 6, 9 ]
    TOKENS_FOLLOWING_MUL_IN_mul_95 = Set[ 4, 5, 7, 8, 11 ]
    TOKENS_FOLLOWING_single_IN_mul_99 = Set[ 1, 6, 9 ]
    TOKENS_FOLLOWING_DIV_IN_mul_107 = Set[ 4, 5, 7, 8, 11 ]
    TOKENS_FOLLOWING_single_IN_mul_111 = Set[ 1, 6, 9 ]
    TOKENS_FOLLOWING_ADD_IN_single_133 = Set[ 5, 7, 8 ]
    TOKENS_FOLLOWING_atom_IN_single_138 = Set[ 1 ]
    TOKENS_FOLLOWING_SUB_IN_single_146 = Set[ 5, 7, 8 ]
    TOKENS_FOLLOWING_atom_IN_single_150 = Set[ 1 ]
    TOKENS_FOLLOWING_INTEGER_IN_atom_167 = Set[ 1 ]
    TOKENS_FOLLOWING_DECIMAL_IN_atom_177 = Set[ 1 ]
    TOKENS_FOLLOWING_LPARENT_IN_atom_185 = Set[ 4, 5, 7, 8, 11 ]
    TOKENS_FOLLOWING_expression_IN_atom_189 = Set[ 10 ]
    TOKENS_FOLLOWING_RPARENT_IN_atom_193 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
