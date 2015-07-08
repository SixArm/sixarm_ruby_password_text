# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_password_text"
  s.summary           = "SixArm.com » Ruby » PasswordText class"
  s.description       = "PasswordText class to generate strong savvy passwords"
  s.version           = "1.3.2"

  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.licenses          = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key       = "/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem"
  s.cert_chain        = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform          = Gem::Platform::RUBY
  s.require_path      = "lib"
  s.has_rdoc          = true

  s.files = [
    ".gemtest",
    "Rakefile",
    "README.md",
    "VERSION",
    "lib/sixarm_ruby_password_text.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_password_text_test.rb",
  ]

  s.add_dependency('bcrypt-ruby', '>= 3.1.5', '< 4')

end
