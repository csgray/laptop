# # encoding: utf-8

# Inspec test for recipe laptop::aws_cli

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('python3') do
  it { should be_installed }
end
