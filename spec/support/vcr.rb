require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  CONFIG.each do |key, value|
    c.filter_sensitive_data("[#{key}]") { value }
  end
end
