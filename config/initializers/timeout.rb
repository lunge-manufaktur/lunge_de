class TimeoutRecovery
  def initialize(app, options = {})
    @app, @options = app, options
  end

  # Rack::Timeout, as of 0.2.4, raises errors that descend from the Exception
  # class when a request takes too long - however, this is a very strong
  # exception level and will kill Puma's worker if we let it continue down the
  # stack. So instead, catch it and wrap it in a recoverable StandardError.

  class Error < StandardError; end

  def call(env)
    @app.call(env)
  rescue Rack::Timeout::Error => e
    raise Error, "Original Error: #{e.class.inspect}, #{e.message.inspect}, #{e.backtrace.inspect}"
  end
end

Rack::Timeout.timeout = 29  #seconds