class LoadFiles
  def initialize(dir)
    @dir = dir
  end

  # Load in docs
  def run
    # Make blocks for dircrawl
    block = lambda do |file, in_dir, out_dir|
      p = ParseFile.new(file, in_dir, out_dir)
      p.parse_file
    end

    include = lambda do
      require 'parsefile'
    end

    # Call dircrawl
    out_dir = @dir+"_output"
    d = DirCrawl.new(@dir, out_dir, "_terms", block, include, @dir, out_dir)
    JSON.parse(d.get_output)
  end
end

