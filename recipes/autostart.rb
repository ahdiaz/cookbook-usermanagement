#
# Cookbook Name:: usermanagement
# Recipe:: autostart
#
# Copyright 2011 Junta de Andalucía
#
# Author::
#  * Juanje Ojeda <jojeda@emergya.com>
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

users.each do |userdata|
  username = userdata["name"]
  homedir = userdata["home"]

  desktop_path = "/usr/share/applications/"
  autostart_path = homedir+"/.config/autostart/"

  FileUtils.mkdir_p(homedir+"/.config/autostart/")
  autostart = userdata["autostart"]["autostart"].map{|x| x[1]}.flatten
  autostart.each do |desktopfile|
    if FileTest.exist? desktop_path + desktopfile["name"] and desktopfile["name"] != ''
      puts desktop_path + desktopfile["name"]
      FileUtils.cp desktop_path + desktopfile["name"],  autostart_path
    end
  end

end
