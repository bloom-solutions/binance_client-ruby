require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  CONFIG.each do |key, value|
    c.filter_sensitive_data("[#{key}]") { value }
  end
  c.default_cassette_options = {
    match_requests_on: [
      :method,
      VCR.request_matchers.uri_without_param(:timestamp, :signature)
    ]
  }
end
