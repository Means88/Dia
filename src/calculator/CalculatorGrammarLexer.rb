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

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = CalculatorGrammar
    include TokenData

    begin
      generated_using( "CalculatorGrammar.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "INTEGER", "DECIMAL", "ADD", "SUB", "MUL", "DIV", "LPARENT", 
                     "RPARENT", "WS" ].freeze
    RULE_METHODS = [ :integer!, :decimal!, :add!, :sub!, :mul!, :div!, :lparent!, 
                     :rparent!, :ws! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule integer! (INTEGER)
    # (in CalculatorGrammar.g)
    def integer!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = INTEGER
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 28:10: ( '0' .. '9' )+
      # at file 28:10: ( '0' .. '9' )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( 0x30, 0x39 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_1 > 0 and break
          eee = EarlyExit(1)


          raise eee
        end
        match_count_1 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule decimal! (DECIMAL)
    # (in CalculatorGrammar.g)
    def decimal!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = DECIMAL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 29:10: ( '0' .. '9' )+ '.' ( '0' .. '9' )+
      # at file 29:10: ( '0' .. '9' )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x30, 0x39 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_2 > 0 and break
          eee = EarlyExit(2)


          raise eee
        end
        match_count_2 += 1
      end


      match( 0x2e )
      # at file 29:26: ( '0' .. '9' )+
      match_count_3 = 0
      while true
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0.between?( 0x30, 0x39 ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_3 > 0 and break
          eee = EarlyExit(3)


          raise eee
        end
        match_count_3 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule add! (ADD)
    # (in CalculatorGrammar.g)
    def add!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = ADD
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 30:6: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule sub! (SUB)
    # (in CalculatorGrammar.g)
    def sub!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = SUB
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 31:6: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule mul! (MUL)
    # (in CalculatorGrammar.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 32:6: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule div! (DIV)
    # (in CalculatorGrammar.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 33:6: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule lparent! (LPARENT)
    # (in CalculatorGrammar.g)
    def lparent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = LPARENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 34:10: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule rparent! (RPARENT)
    # (in CalculatorGrammar.g)
    def rparent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = RPARENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 35:10: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule ws! (WS)
    # (in CalculatorGrammar.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 36:5: ( ' ' | '\\t' | '\\r' | '\\n' )+
      # at file 36:5: ( ' ' | '\\t' | '\\r' | '\\n' )+
      match_count_4 = 0
      while true
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x9, 0xa ) || look_4_0 == 0xd || look_4_0 == 0x20 )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek(1) == 0xd || @input.peek(1) == 0x20
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_4 > 0 and break
          eee = EarlyExit(4)


          raise eee
        end
        match_count_4 += 1
      end



      # --> action
       channel = HIDDEN 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( INTEGER | DECIMAL | ADD | SUB | MUL | DIV | LPARENT | RPARENT | WS )
      alt_5 = 9
      alt_5 = @dfa5.predict( @input )
      case alt_5
      when 1
        # at line 1:10: INTEGER
        integer!


      when 2
        # at line 1:18: DECIMAL
        decimal!


      when 3
        # at line 1:26: ADD
        add!


      when 4
        # at line 1:30: SUB
        sub!


      when 5
        # at line 1:34: MUL
        mul!


      when 6
        # at line 1:38: DIV
        div!


      when 7
        # at line 1:42: LPARENT
        lparent!


      when 8
        # at line 1:50: RPARENT
        rparent!


      when 9
        # at line 1:58: WS
        ws!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 1, -1, 1, 9, 9, -1 )
      EOF = unpack( 11, -1 )
      MIN = unpack( 1, 9, 1, 46, 9, -1 )
      MAX = unpack( 2, 57, 9, -1 )
      ACCEPT = unpack( 2, -1, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 
                       1, 1, 1, 2 )
      SPECIAL = unpack( 11, -1 )
      TRANSITION = [
        unpack( 2, 8, 2, -1, 1, 8, 18, -1, 1, 8, 7, -1, 1, 6, 1, 7, 1, 4, 
                1, 2, 1, -1, 1, 3, 1, -1, 1, 5, 10, 1 ),
        unpack( 1, 10, 1, -1, 10, 1 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze

      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end

      @decision = 5


      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( INTEGER | DECIMAL | ADD | SUB | MUL | DIV | LPARENT | RPARENT | WS );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end
