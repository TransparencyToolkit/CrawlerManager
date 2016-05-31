class LoadFiles
  def initialize(dir)
    @dir = dir
	# TODO: need a method to pass "tika" value from a global/environement var
	@tika = nil
  end

  # Load in docs
  def run

    # Make blocks for dircrawl
    block = lambda do |file, in_dir, out_dir, tika|
      p = ParseFile.new(file, in_dir, out_dir, tika)
      p.parse_file
    end

    include = lambda do
      require 'parsefile'
    end

    # Output Directory
    out_dir = @dir+"_output"

	# Extras
	extras = lambda do |out_dir|
	end

    d = DirCrawl.new(@dir, out_dir, "_terms", false, block, include, extras, @dir, out_dir, @tika)
    JSON.parse(d.get_output)
  end
end
