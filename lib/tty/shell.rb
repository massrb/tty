# -*- encoding: utf-8 -*-

module TTY

  # A class responsible for shell prompt interactions.
  class Shell

    # @api private
    attr_reader :input

    # @api private
    attr_reader :output

    # Initialize a Shell
    #
    # @api public
    def initialize(input=stdin, output=stdout)
      @input  = input
      @output = output
    end

    # Ask a question.
    #
    # @example
    #   shell = TTY::Shell.new
    #   shell.ask("What is your name?")
    #
    # @param [String] statement
    #   string question to be asked
    #
    # @yieldparam [TTY::Question] question
    #   further configure the question
    #
    # @yield [question]
    #
    # @return [TTY::Question]
    #
    # @api public
    def ask(statement, *args, &block)
      options = Utils.extract_options!(args)

      question = Question.new input, output
      question.instance_eval(&block) if block_given?
      question.prompt(statement)
    end

    # A shortcut method to ask the user positive question and return 
    # true for 'yes' reply.
    #
    # @return [Boolean]
    #
    # @api public
    def yes?(statement, *args, &block)
      ask(statement, *args, &block).read_bool
    end

    # A shortcut method to ask the user negative question and return
    # true for 'no' reply.
    #
    # @return [Boolean]
    #
    # @api public
    def no?(statement, *args, &block)
      !yes?(statement, *args, &block)
    end

    # Print statement out. If the supplied message ends with a space or
    # tab character, a new line will not be appended.
    #
    # @example
    #   say("Simple things.")
    #
    # @param [String] message
    #
    # @return [String]
    #
    # @api public
    def say(message="", options={})
      message = message.to_str
      return unless message.length > 0

      newline = options.fetch :newline, true
      color   = options.fetch :color, nil
      message = TTY::terminal.color.set message, *color if color

      if newline && /( |\t)(\e\[\d+(;\d+)*m)?\Z/ !~ message
        output.puts message
      else
        output.print message
        output.flush
      end
    end

    # Print a table to shell.
    #
    # @return [undefined]
    #
    # @api public
    def print_table(*args, &block )
      output.print TTY::Table.new *args, &block
    end

    protected

    def stdin
      $stdin
    end

    def stdout
      $stdout
    end

    def stderr
      $stderr
    end

  end # Shell
end # TTY
