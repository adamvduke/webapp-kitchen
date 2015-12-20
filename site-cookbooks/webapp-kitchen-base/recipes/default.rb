#
# Cookbook Name:: webapp-kitchen-base
# Recipe:: default
#
# Copyright 2015, Adam Duke
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe 'apt::default'

node.set['firewall']['allow_ssh'] = true
include_recipe 'firewall::default'

node.set['users'] = ['adamd']
include_recipe 'user::data_bag'

node.set['authorization']['sudo']['groups'] = ['admin']
node.set['authorization']['sudo']['passwordless'] = true
include_recipe 'sudo::default'

node.set['openssh']['server']['permit_root_login'] = 'no'
node.set['openssh']['server']['password_authentication'] = 'no'
include_recipe 'openssh::default'
