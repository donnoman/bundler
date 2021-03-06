module Bundler
  class Environment
    attr_reader :root

    def initialize(root, definition)
      @root = root
      @definition = definition

      env_file = root.join('.bundle/environment.rb')
      env_file.rmtree if env_file.exist?
    end

    def inspect
      @definition.to_lock.inspect
    end

    # TODO: Remove this method. It's used in cli.rb still
    def index
      @definition.index
    end

    def requested_specs
      @definition.requested_specs
    end

    def specs
      @definition.specs
    end

    def dependencies
      @definition.dependencies
    end

    def current_dependencies
      @definition.current_dependencies
    end

    def lock
      @definition.lock(Bundler.default_lockfile)
    end

    def update(*gems)
      # Nothing
    end

  end
end
