#
# Author:: Seth Falcon (<seth@opscode.com>)
# Author:: Jeremiah Snapp (<jeremiah@chef.io>)
# Copyright:: Copyright 2011--2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
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

module OpscodeAcl
  class GroupShow < Chef::Knife
    category "OPSCODE HOSTED CHEF ACCESS CONTROL"
    banner "knife group show GROUP_NAME"

    deps do
      require 'chef/knife/acl_base'
      include OpscodeAcl::AclBase
    end

    def run
      group_name = name_args[0]

      if name_args.length != 1
        show_usage
        ui.fatal "You must specify group name"
        exit 1
      end

      validate_member_name!(group_name)

      group = rest.get_rest("groups/#{group_name}")
      ui.output group
    end
  end
end
