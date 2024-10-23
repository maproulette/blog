Jekyll::Hooks.register :site, :post_write do |site|
  dest = site.config["destination"]
  File.rename "#{dest}/feed/index", "#{dest}/feed/index.atom"
end
