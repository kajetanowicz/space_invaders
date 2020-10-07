module SpaceInvaders
  class RadarSample
    def self.from_file(filepath)
      new(File.read(File.expand_path(filepath)))
    end

    def initialize(snapshot)
      @snapshot = snapshot
    end

    def width
      content.first.size
    end

    def height
      content.size
    end

    private

    # TODO - turn it into a parser
    def content
      @content ||= @snapshot.split("\n").map(&:chars)
    end
  end
end
