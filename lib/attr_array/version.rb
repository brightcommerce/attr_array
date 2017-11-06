module AttrArray
  module Version
    Major       = 1
    Minor       = 0
    Revision    = 1
    Prerelease  = nil
    Compact     = [Major, Minor, Revision, Prerelease].compact.join('.')
    Summary     = "AttrArray v#{Compact}"
    Description = "A high performance ActiveRecord concern for Rails using the PostgreSQL array type."
    Author      = "Jurgen Jocubeit"
    Email       = "support@brightcommerce.com"
    Homepage    = "https://github.com/brightcommerce/attr_array"
    Metadata    = {'copyright' => 'Copyright 2017 Pocket Business, Co. All Rights Reserved.'}
    License     = "MIT"
  end
end
