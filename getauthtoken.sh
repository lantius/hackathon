#!/bin/bash
#
# Copyright 2010 Google Inc. All Rights Reserved
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Overview:
#   This will get a client login token from the Google Accounts API which
#   can be used to access the Account Management and Data Export APIs.
#
# Usage:
#   Run the script from the command line. Input your user name and password.
#   The Client Login token will be outputed to the command line as well as
#   into a file named .testAuthToken. Make sure this file can be read and
#   excuted by everybody.

read -p 'Username: ' username
stty -echo
read -p "Password: " password
stty echo
curl https://www.google.com/accounts/ClientLogin \
 -d Email=$username \
 -d Passwd=$password \
 -d accountType=GOOGLE \
 -d source=GA-curl-tester \
 -d service=storage -s | grep 'Auth=' | sed s/Auth=// > .testAuthToken

echo
echo "Client Login Auth Token: "
cat .testAuthToken