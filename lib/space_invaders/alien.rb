module SpaceInvaders
  class Alien
    def self.from_file(filepath, parser = AsciiParser)
      new(parser.parse(File.read(File.expand_path(filepath))))
    end

    def initialize(bitmap)
      @bitmap = bitmap
    end
  end
end
