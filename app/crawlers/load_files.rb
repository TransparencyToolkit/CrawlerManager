class LoadFiles
  def initialize(harvester_url, selector_id, dir)
    @dir = dir
	# TODO: need a method to pass "tika" value from a global/environement var
    @tika = nil
    @harvester_url = harvester_url
    @selector_id = selector_id
  end

  # Load in docs
  def run
    cm_hash = {crawler_manager_url: @harvester_url,
               selector_id: @selector_id}

    Thread.new do
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
      d = DirCrawl.new(@dir, out_dir, "_terms", false, block, include, extras, "log", cm_hash, @dir, out_dir, @tika)
    end
  end
end
