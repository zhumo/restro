class NagsService
  def self.get_nags(auth_token)
    error_ptr = Pointer.new(:object)
    url = "http://localhost:3000/api/nags?auth_token=#{auth_token}"
    data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url), options:NSDataReadingUncached, error:error_ptr)
    nags = NSJSONSerialization.JSONObjectWithData(data, options: 0, error: error_ptr)
    return nags.map{ |n| Nag.new(n) }
  end
end
