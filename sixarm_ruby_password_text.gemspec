Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_password_text"
  s.summary           = "SixArm Ruby Gem: Password text generator for strong web-savvy passwords"
  s.version           = "1.2.1"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','LICENSE.txt','lib/sixarm_ruby_password_text.rb']
  s.test_files        = ['test/sixarm_ruby_password_text_test.rb']

  s.add_dependency('bcrypt-ruby', '>= 2.0.5')

end
