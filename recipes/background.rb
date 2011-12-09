#
# Cookbook Name:: usermanagement
# Recipe:: background
#
# Copyright 2011 Junta de Andalucía
#
# Author::
#  * Juanje Ojeda <jojeda@emergya.com>
# 
# Based on the Roberto C. Morano's applyuserconfs recipe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.home_users.each do |username|
  begin
    user = data_bag_item('users', username)
  rescue
    next
  end

  usermanagement_desktopsetting "picture-uri" do
    type "string"
    name "picture-uri"
    value user['background']['filename']
    schema "org.gnome.desktop.background"
    username username
    provider "usermanagement_gsettings"
    action :set
  end

end
