# Cookbook Name:: wlp
# Attributes:: default
#
# (C) Copyright IBM Corporation 2013.
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

=begin
#<
Installs or downloads an asset from the Liberty Repository, a local LARS reposiory, or a local directory based repository using installUtility.

@action install installs an asset from which ever repositoryis confiugured in teh repositoies.properties file

@action download downloads an asset from the configured repository to the specified directory.

@section Examples
```ruby
wlp_install_utility "mongodb" do
  name "mongodb-2.0"
  accept_license true
end
```
#>
=end
actions :install, :download

=begin
#<
 @attribute name Specifies the name of the asset to be installed or downloaded.
 When using the @action install you can specify the following names:
 - One or more asset names separated by a space. For features, use
   the IBM-Shortname or Subsystem-SymbolicName.
 - A server name
 - A local ESA file
 - A local server package archive file that was created by the server
   package action with the --include=usr option

  When using the @action download you can specify the IBM-Shortname or Subsystem-SymbolicName.
 #>
=end
attribute :name, :kind_of => String, :default => nil

#<> @attribute to Specifies where to install the feature. The feature can be installed to any configured product extension location, or as a user feature.
attribute :to, :kind_of => String, :default => "usr"

#<> @attribute Directory specifies which local directory path utilities are downloaded to when using the :download action.
attribute :directory, :kind_of => String, :default => "#{node[:wlp][:base_dir]}"

#<> @attribute accept_license Specifies whether to accept the license terms and conditions of the feature.
attribute :accept_license, :kind_of => [TrueClass, FalseClass], :default => false

default_action :install
