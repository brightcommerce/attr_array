module AttrArray
  module Version
    Major       = 1
    Minor       = 0
    Revision    = 0
    Prerelease  = 0
    Compact     = [Major, Minor, Revision, Prerelease].compact.join('.')
    Summary     = "AttrArray v#{Compact}"
    Description = "A high performance ActiveRecord concern for Rails using the PostgreSQL array type."
    Author      = "Jurgen Jocubeit"
    Email       = "hello@apikits.com"
    Homepage    = "https://www.apikits.com"
    Metadata    = {'copyright' => 'Copyright 2017 Pocket Business, Co. All Rights Reserved.'}
    License     = "UNLICENSED"
  end
end
